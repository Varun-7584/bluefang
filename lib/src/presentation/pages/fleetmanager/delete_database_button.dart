// ignore_for_file: use_build_context_synchronously

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteDatabaseButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BFButtons(
      title: AppLocalizations.of(context)!.deleteDatabase, 
      onTap: () async {
        final bool shouldDelete = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: BFText.headingOne(AppLocalizations.of(context)!.confirmDatabaseDeletion),
              content: BFText.headingOne(AppLocalizations.of(context)!.deleteDatabaseWarning, color: Colors.red),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                  child: BFText.body(AppLocalizations.of(context)!.cancel)
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(true);
                  },
                  child: BFText.body(AppLocalizations.of(context)!.ok)
                )
              ]
            );
          }
        ) ?? false;
        if (shouldDelete){
          
          
          Navigator.pushNamed(context, GlobalRoutes.reinitDb, arguments: {"reinitUserDB" : true});
          ScaffoldMessenger.of(context).showSnackBar(
            bFSnackBar(
                content: "Database Reinitialized",
                type: 'success',
                onActionClick: () {}
            )
          );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            bFSnackBar(
                content: "Canceled",
                type: 'info',
                onActionClick: () {}
            )
          );
        }
      }
    );
  }
}
