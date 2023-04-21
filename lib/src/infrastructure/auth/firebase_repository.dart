import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/user/user.dart';
import '../../presentation/constants/global_routes.dart';
import '../../presentation/pages/auth/otp_verification.dart';

class FirebaseRepository {
  final Users? user;

  FirebaseRepository({
    this.user,
  });

  //AuthResultStatus _status = AuthResultStatus.undefined;
  String? _status;
  String? verificationId;

  //Variables
  //late UserCredential credential;
  //final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseUser; GETx package

  // SIGN UP
  Future<String?> createUserWithEmailAndPassword() async {
    try {
      int companyId = 101;
      QuerySnapshot invitedUser;
      String? userRole = null;
      if (user?.invitecode != null) {
        CollectionReference _collectionInActiveUserRef =
        FirebaseFirestore.instance.collection('Invitees');
        invitedUser = await _collectionInActiveUserRef
            .where('PhoneNumber', isEqualTo: user?.phonenumber)
            .where('InviteCode', isEqualTo: user?.invitecode)
            .get();
        if (invitedUser.docs.length == 0) {
          return 'Invalid invite code';
        } else {
          companyId =
          (invitedUser.docs.first.data() as Map)['CompanyId'] as int;
          userRole = (invitedUser.docs.first.data() as Map)['Role'] as String;
        }
      }

      user?.deviceid = await getDeviceId();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user?.email as String,
        password: user?.password as String,
      )
          .then((doc) {
        FirebaseFirestore.instance
            .collection('CompanyDetail')
            .orderBy('companyid', descending: true)
            .limit(1)
            .get()
            .then((value) {
          if (user?.invitecode == null) {
            if (value.docs.length > 0) {
              companyId =
                  ((value.docs.first.data() as Map)['companyid'] as int) + 1;
            }
            FirebaseFirestore.instance
                .collection("CompanyDetail")
                .doc(doc.user?.uid)
                .set({
              "companyid": companyId,
              "companyname": user?.companyname,
              "address": user?.address,
            });
          }
          FirebaseFirestore.instance
              .collection("Users")
              .doc(doc.user?.uid)
              .set({
            "docid": doc.user?.uid,
            "companyid": companyId,
            "firstname": user?.firstname,
            "lastname": user?.lastname,
            "phonenumber": user?.phonenumber,
            "jobtitle": user?.jobtitle,
            "email": user?.email,
            "invitecode": user?.invitecode,
            "deviceid": user?.deviceid,
            "isActive": true,
            "role": user?.role == null ? userRole : user?.role
          }).then((value) {
            FirebaseFirestore.instance
                .collection("InvitedUsers")
                .doc(user?.invitecode)
                .delete();
          });
        });
      });
      //firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      print('Exception @createAccount: $e');
      _status = e.message;
    }
    return _status;
  }

  // SIGN IN
  Future<String?> loginWithEmailAndPassword() async {
    try {
      QuerySnapshot userdata;
      CollectionReference _collectionInActiveUserRef =
      FirebaseFirestore.instance.collection('Users');
      userdata = await _collectionInActiveUserRef
          .where('email', isEqualTo: user?.email).get();
      if ((userdata.docs.first.data() as Map)['isActive'] as bool) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: user?.email as String, password: user?.password as String);
      }
      else {
        _status = "InActive user";
      }
    } on FirebaseAuthException catch (e) {
      print('Exception @createAccount: $e');
      _status = e.message;
    }
    return _status;
  }

  // SIGN OUT
  Future<void> logout() async => await FirebaseAuth.instance.signOut();

  // PHONE MULTI FACTOR AUTH
  Future<String?> phoneMultiFactorAuth(String? phoneNumber) async {
    final user = FirebaseAuth.instance.currentUser;
    final session = await user?.multiFactor.getSession();
    final auth = FirebaseAuth.instance;
    final fullPhoneNumber = "$phoneNumber";

    // Create a new TextEditingController object and set its text
    final phonenumberTextController = TextEditingController(text: phoneNumber);

    await auth.verifyPhoneNumber(
      //multiFactorSession: session,
      phoneNumber: fullPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        var pref = await SharedPreferences.getInstance();
        pref.setString("verificationId", verificationId);
        pref.setString("fullPhoneNumber", fullPhoneNumber!);
        pref.setInt("resendToken", resendToken!);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return null;
  }

  Future<String?> resendOtp() async {
    final user = FirebaseAuth.instance.currentUser;
    final session = await user?.multiFactor.getSession();
    final auth = FirebaseAuth.instance;
    final pref = await SharedPreferences.getInstance();
    final phoneNumber = pref.getString("fullPhoneNumber")!;

    final phonenumberTextController = TextEditingController(text: phoneNumber);
    final storedResendToken = pref.getInt("resendToken");
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        var pref = await SharedPreferences.getInstance();
        pref.setString("verificationId", verificationId);
        pref.setInt("resendToken", resendToken!);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      forceResendingToken: storedResendToken ?? null,
    );

    return null;
  }


  Future<bool> verifyOTP(String otp) async {
    try {
  //Uncomment
  //     var pref = await SharedPreferences.getInstance();
  //     var verificationId = pref.getString("verificationId");
  //     if (verificationId == null) {
  //       return false;
  //     }
  //     var creds = await FirebaseAuth.instance.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //         verificationId: verificationId,
  //         smsCode: otp,
  //       ),
  //     );
  //     if (creds.user != null && await saveUserDevice()) {
  //       return true;
  //     }
  //     return false;

      // Comment
      return await saveUserDevice();

    } catch (e) {
      print(e);
      return false;
    }
  }


  Future<String?> getDeviceId() async {
    var deviceinfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceinfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceinfo.androidInfo;
      return androidDeviceInfo.androidId;
    }
  }

  Future<String?> getUserData() async {
    try {
      String? systemName;
      final pref = await SharedPreferences.getInstance();
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        systemName = 'Android ' + '${androidInfo.version.release}';
      } else {
        final iosInfo = await DeviceInfoPlugin().iosInfo;
        systemName = iosInfo.systemName;
      }
      if (await pref.getString("userid") != null) {
        return "Please find below details....\n\n\n\t Name : '${await pref
            .getString("name")}'\n\tMob  : ${await pref.getString(
            "phonenumber")}\n\tDevice : '${systemName}'";
      } else {
        final currentuser = await FirebaseAuth.instance.currentUser!.uid;
        final userData = await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentuser)
            .get();
        return "Please find below details....\n\n\n\t Name : ${userData['firstname']
            .toString()} ${userData['lastname'] != null ? userData['lastname']
            .toString() : ""}\n\tMob  : ${userData['phonenumber']
            .toString()}\n\tDevice : '${systemName}'";
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: user?.email as String);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<bool> saveUserDevice() async {
    try {
      final currentuser = await FirebaseAuth.instance.currentUser!.uid;
      final deviceId = await getDeviceId();
      FirebaseFirestore.instance.collection('UserDevice').where(
          'userid', isEqualTo: currentuser).orderBy('createdtimestamp')
          .get()
          .then((value) {
        if (value.docs.length == 5) {
          FirebaseFirestore.instance.collection('UserDevice').doc(
              value.docs[0]['deviceid'].toString()).delete();
        }
        FirebaseFirestore.instance.collection("UserDevice").doc(deviceId).set(
            {
              "userid": currentuser,
              "deviceid": deviceId,
              "isverified": true,
              "createdtimestamp": DateTime.now()
            }).then((value) => null);
      });
      return true;
    }
    catch(error){
      return false;
    }
  }

  Future<bool> isUserDeviceVerified() async{
    if (FirebaseAuth.instance.currentUser != null) {
      final userid = FirebaseAuth.instance.currentUser!.uid;
      final deviceId = await getDeviceId();
      final device = await FirebaseFirestore.instance
          .collection('UserDevice').where('userid',isEqualTo: userid).where('deviceid',isEqualTo: deviceId)
          .get();
      if(device.docs.length > 0) {
        return Future<bool>.value(device.docs[0]['isverified'] == true ? true : false);
      }
      else {
        return Future<bool>.value(false);
      }
    } else {
      return Future<bool>.value(false);
    }


  }

}
