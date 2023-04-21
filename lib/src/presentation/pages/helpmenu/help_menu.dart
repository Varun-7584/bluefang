// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/url_launching_methods.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import 'licences_screen.dart';

class HelpMenuScreen extends StatefulWidget {
  HelpMenuScreen({Key? key}) : super(key: key);

  @override
  State<HelpMenuScreen> createState() => _HelpMenuScreenState();
}

class _HelpMenuScreenState extends State<HelpMenuScreen> {
  final double bxSize = 50;

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Help Menu",
        'firebase_screen_class': "HelpMenuScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(
          title: AppLocalizations.of(context)!.helpMenu,
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          })),
      body: Column(
        children: [
          Card(
            elevation: 0,
            color: kcLightGreyColor,
            child: Column(
              children: [
                BFText.headingThree(
                    AppLocalizations.of(context)!.contactSupport),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          final firebaseRepo =
                              FirebaseRepository(user: Users());

                          final userData = await firebaseRepo.getUserData();

                          final String path = await usersDbManager.getDBPath();
                          //Use flutter_mailer here
                          final Email email = Email(
                            // body: "Some text for this test email.\n",
                            body: '${userData}',//"Some text for this test email.\n",
                            subject: "Log detail",
                            recipients: ["support@batrf.com"],
                            attachmentPaths: [path],
                          );
                          final String result =
                              await UrlLaunchingMethods.sendEmail(email);
                          if (result == "noClientFound") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: BFText.body(
                                      AppLocalizations.of(context)!
                                          .emailTechSupportError),
                                );
                              },
                            );
                          }
                          log("Email result: $result");
                        },
                        iconSize: bxSize,
                        icon: Icon(Icons.email)),
                    SizedBox(width: bxSize),
                    IconButton(
                      onPressed: () async {
                        final bool success =
                            await UrlLaunchingMethods.makePhoneCall(
                                "+1 (800) 527-8492");
                        log("Made phone call? $success");
                      },
                      iconSize: bxSize,
                      icon: Icon(Icons.call),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: bxSize / 2),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(children: [
                BFButtons(
                    title: AppLocalizations.of(context)!.installInstructions,
                    onTap: () {
                      UrlLaunchingMethods.launchInBrowser(Uri(
                          scheme: "https",
                          host: "www.stemco.com",
                          path:
                              "wp-content/uploads/2020/09/930-0073_Tracbat-RF-Pro-Installation-Instructions_4-18.pdf"));
                    }),
                SizedBox(height: bxSize / 4),
                BFButtons(
                    title: AppLocalizations.of(context)!.termsAndConditions,
                    onTap: () {
                      UrlLaunchingMethods.launchInBrowser(Uri(
                          scheme: "https",
                          host: "www.freeprivacypolicy.com",
                          path: "live/602bc3e4-fca2-44f5-8ff8-fdb419d940df"));
                    }),
                SizedBox(height: bxSize / 4),
                BFButtons(
                    title: "Software License Agreement",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LicencesPage()),
                      );
                    }),
                SizedBox(height: bxSize / 4),
                BFButtons(
                    title: AppLocalizations.of(context)!.privacyPolicy,
                    onTap: () {
                      UrlLaunchingMethods.launchInBrowser(Uri(
                          scheme: "https",
                          host: "www.freeprivacypolicy.com",
                          path: "live/602bc3e4-fca2-44f5-8ff8-fdb419d940df"));
                    }),
                SizedBox(height: bxSize / 4),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
