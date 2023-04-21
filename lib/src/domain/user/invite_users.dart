import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

class ManageUser {
  final String? name;
  final String? phonenumber;
  final String? invitecode;
  final String? companyname;
  final String? role;
  final DateTime? invitedate;

  ManageUser(
      {this.name,
      this.phonenumber,
      this.invitecode,
      this.companyname,
      this.role,
      this.invitedate});
}
