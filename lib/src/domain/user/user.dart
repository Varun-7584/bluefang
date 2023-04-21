import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

class Users{
  String? uid;
  String? companyname;
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? address;
  String? jobtitle;
  String? email;
  String? password;
  String? invitecode;
  String? deviceid;
  String?  role;

  Users({
    this.uid,
    this.companyname,
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.address,
    this.jobtitle,
    this.email,
    this.password,
    this.invitecode,
    this.deviceid,
    this.role
  });
  Users.fromMap(Map<String, dynamic> map){
    uid = map["uid"] as String;
    companyname = map["companyname"] as String;
    firstname = map["firstname"] as String;
    lastname = map["lastname"] as String;
    phonenumber = map["phonenumber"] as String;
    address = map["address"] as String;
    jobtitle = map["jobtitle"] as String;
    email = map["email"] as String;
    password = map["password"] as String;
    invitecode = map["invitecode"] as String;
    deviceid = map["deviceid"] as String;
    role = map["role"] as String;
  }

  Map<String,dynamic> toMap(){
    return{
      "uid": uid,
      "companyname": companyname,
      "firstname": firstname,
      "lastname": lastname,
      "phonenumber": phonenumber,
      "address": address,
      "jobtitle":jobtitle,
      "email":email,
      "password":password,
      "invitecode":invitecode,
      "deviceid":deviceid,
      "role":role
    };
  }


}