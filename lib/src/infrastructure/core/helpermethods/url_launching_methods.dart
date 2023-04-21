// ignore_for_file: avoid_classes_with_only_static_members, join_return_with_assignment

import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

/// Holds methods to make launching URLs easier.
///
/// Things like phone calls and emails are handled as URLs.
class UrlLaunchingMethods {
  /// Launches the given URL in the browser. Logs the error if it fails. 
  /// 
  /// Returns true if it succeeds or false if it fails. 
  static Future<bool> launchInBrowser(Uri url) async {
    if (!(await launchUrl(url, mode: LaunchMode.externalApplication))) {
      log("ERROR: Could not launch $url");
      return false;
    } else {
      return true;
    }
  }

  ///Makes a phone call using the [Uri] class. 
  static Future<bool> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    return launchUrl(launchUri);
  }

  /// Sends an email using the provided [MailOptions].
  ///
  /// Returns a string that gives status information on the email. On Android, this provides no information. We don't even know if the email sent.
  static Future<String> sendEmail(Email mailOptions) async {
    String mailResponse = "";
    try {
      await FlutterEmailSender.send(mailOptions);
      mailResponse = "Success";
    } on PlatformException {
      mailResponse = "noClientFound";
    }

    return mailResponse;
  }
}
