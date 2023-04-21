// ignore_for_file: must_be_immutable

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ReInitDb extends StatefulWidget {
  bool reinitUserDB;
  ReInitDb({Key? key, this.reinitUserDB = false}) : super(key: key);

  @override
  State<ReInitDb> createState() => _ReInitDbState();
}

class _ReInitDbState extends State<ReInitDb> {
  @override
  void initState() {
    super.initState();
    reinitializeDB();
  }

  void reinitializeDB() {
    if (widget.reinitUserDB){
      reinitializeUserDB();
    }
    else {
      reinitializeMockDB();
    }
  }

  /// Reinits the user DB (main DB).
  /// 
  /// ONLY CALL ONE OR THE OTHER REINITIALIZING METHOD - do not call this method AND `reinitializeMockDB()` both.  
  Future<void> reinitializeUserDB() async {
      await usersDbManager.reinitializeFreshDB().whenComplete(() {
      EnvironmentManager().updateConfig(EnviromentType.prod);
      configureInjection(EnvironmentManager().currEnvironment);
      Phoenix.rebirth(context);
    });
  }

  Future<void> reinitializeMockDB() async {
    mockUserDbManager.reinitializeFreshDB().whenComplete(() {
      EnvironmentManager().updateConfig(EnviromentType.demo);
      configureInjection(EnvironmentManager().currEnvironment);
      Phoenix.rebirth(context);
    });
  }

  void reinitializeDBinTest() {
    EnvironmentManager().updateConfig(EnviromentType.prod);
    usersDbManager.reinitializeFreshDB().whenComplete(() {
      Phoenix.rebirth(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BFText.headingOne("Reinitializing Fresh DB"),
      ),
    );
  }
}
