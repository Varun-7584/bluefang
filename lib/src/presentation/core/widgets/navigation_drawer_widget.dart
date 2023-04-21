// ignore_for_file: prefer_const_constructors

import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/add_vehicle_screen.dart';
import 'package:bluefang/src/presentation/pages/manageuser/manage_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/auth/start_tracking.dart';
import '../../pages/manageuser/inviteuser.dart';
/// Widget for navigating bewteen major app pages.
class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(24, 98, 142, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            _buildMenuItem(
              text: AppLocalizations.of(context)!.fleetManagerScreen,
              icon: Icons.home_filled,
              onClicked: () => _selectedItem(context, 0),
            ),
            const SizedBox(
              height: 5,
            ),
            _buildMenuItem(
              text: 'Event Log',
              icon: Icons.note,
              onClicked: () => _selectedItem(context, 1),
            ),
            _buildMenuItem(
              text: AppLocalizations.of(context)!.helpMenu,
              icon: Icons.help,
              onClicked: () => _selectedItem(context, 2),
            ),
            _buildMenuItem(
              text: AppLocalizations.of(context)!.addNewVehicle,
              icon: Icons.add,
              onClicked: () => _selectedItem(context, 3)
            ),
            _buildMenuItem(
                text: "Manage User",
                icon: Icons.account_circle_sharp,
                onClicked: () => _selectedItem(context, 4)
            ),
            _buildMenuItem(
              text: "LogOut",
              icon: Icons.logout_rounded,
              onClicked: ()async{
                final pref = await SharedPreferences.getInstance();
                pref.remove("userid");
                pref.remove("name");
                pref.remove("phonenumber");
                _signOut().then((value) => _selectedItem(context, 5));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  // ignore: always_declare_return_types
  _selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(GlobalRoutes.fleetManager);
        break;
      case 1:
        Navigator.of(context)
            .pushNamed(GlobalRoutes.logging);
        break;
      case 2:
        Navigator.of(context)
            .pushNamed(GlobalRoutes.helpMenu);
        break;
      case 3: 
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddVehicleScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddVehicleScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => manage_users()),
        );
        break;
      case 5:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => start_tracking()),
        );
        break;
      default: 
        Navigator.of(context).pushNamed(GlobalRoutes.fleetManager);
    }
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
