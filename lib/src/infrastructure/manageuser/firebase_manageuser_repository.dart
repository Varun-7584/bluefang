import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';

import '../../domain/user/invite_users.dart';

class ManageUserRepository {
  final ManageUser user;

  ManageUserRepository({
    required this.user,
  });

   String? _error, _message;
   String? currentuser;
   int companyId = 0;


  Future<String?> InviteUser() async {
    try {
      final List<String> recipients = [user.phonenumber!];
      final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentuser)
          .get();

      final String inviteCode =
          DateTime.now().microsecondsSinceEpoch.toString();
      final String link = "https://play.google.com/store/apps/details?id=com.stemco.bluefangmain \n Invite Code : $inviteCode";
          //"https://play.google.com/apps/test/com.stemco.bluefangmain/21 \n Invite Code : $inviteCode";

      await _sendSMS(recipients, link).then((value) {
        if (value == null) {
          FirebaseFirestore.instance
              .collection("Invitees")
              .doc(inviteCode)
              .set({
            "CompanyId": userData['companyid'].toString(),
            "PhoneNumber": user.phonenumber,
            "InviteCode": inviteCode,
            "Role": user?.role,
            "InviteDate": DateTime.now()
          });
        } else {
          return _error = value;
        }
      });
    } on FirebaseAuthException catch (e) {
      return _error = e.message;
    }
    return _error;
  }
  void ResendInvite(String receipent,String inviteCode)async{
    final List<String> recipients = [receipent];
    final String link = "https://play.google.com/store/apps/details?id=com.stemco.bluefangmain \n Invite Code : $inviteCode";
    //"https://play.google.com/apps/test/com.stemco.bluefangmain/21 \n Invite Code : $inviteCode";

    await _sendSMS(recipients, link).then((value)=>{});
  }

  Future<Map<String, dynamic>> GetApprovedUsers()  async{
    try {
      currentuser = await FirebaseAuth.instance.currentUser!.uid;
       final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentuser)
          .get();
     companyId = userData["companyid"] as int;
      CollectionReference _collectionUserRef = FirebaseFirestore.instance
          .collection('Users');
      
      QuerySnapshot activeSnapshot = await _collectionUserRef.where('companyid',isEqualTo: companyId).where('isActive',isEqualTo: true).get();
      final activeusers = activeSnapshot.docs.map((doc) =>
      doc.data() as Map<String, dynamic>).toList();


      QuerySnapshot inactiveSnapshot = await _collectionUserRef.where('companyid',isEqualTo: companyId).where('isActive',isEqualTo: false).get();
      final inactiveusers = inactiveSnapshot.docs.map((doc) =>
      doc.data() as Map<String, dynamic>).toList();

      return {'_activeUsers':activeusers,'_inActiveUsers':inactiveusers};
    }on FirebaseException catch(e) {
      // return List.empty();
      return {'active':null};
    }

  }
  Future<List<Map<String, dynamic>>> GetInvitedUsers()  async{
    try {
      currentuser = await FirebaseAuth.instance.currentUser!.uid;
      final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentuser)
          .get();
      companyId = userData["companyid"] as int;

      CollectionReference _collectionRef = FirebaseFirestore.instance
          .collection('Invitees');
      final QuerySnapshot snapshot = await _collectionRef.where('CompanyId',isEqualTo: companyId).get();
      final invitedUsers = snapshot.docs.map((doc) =>
      doc.data() as Map<String, dynamic>).toList();

      return invitedUsers;
    }on FirebaseException catch(e) {
       return List.empty();
    }

  }
  Future<String> UpdateUsers(String? isActive, String? role, String? docId) async{
    var collection = FirebaseFirestore.instance.collection('Users');
    collection.doc(docId)
        .update({'role' : role,'isActive': isActive == 'InActive'?false:true}) // <-- Updated data
        .then((value) {
         // return 'Success';
        })
        .catchError((error) {
          return 'Error: $error';
        });
    return 'User updated Successfully!';
  }

  Future<String?> _sendSMS(List<String> recipients, String inviteCode) async {
    try {
      String _result = await sendSMS(
        message: 'link : ${inviteCode}',
        recipients: recipients,
        sendDirect: false,
      );
      return null;
    } catch (error) {
      return _message = error.toString();
    }
  }
}
