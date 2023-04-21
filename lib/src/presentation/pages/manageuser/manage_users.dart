import 'package:bluefang/src/application/ManageUser_Bloc/onsave_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../package/bluefang_ui/src/shared/app_colors.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../../application/ManageUser_Bloc/manage_user_bloc.dart';
import '../../../application/ManageUser_Bloc/manage_user_event.dart';
import '../../../application/ManageUser_Bloc/manage_user_state.dart';
import '../../../application/ManageUser_Bloc/onsave_bloc.dart';
import '../../../application/ManageUser_Bloc/onsave_event.dart';
import '../../../domain/user/invite_users.dart';
import '../../../infrastructure/manageuser/firebase_manageuser_repository.dart';
import '../../constants/global_routes.dart';
import '../auth/button.dart';
import 'package:collection/collection.dart';

class manage_users extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<manage_users> {
  int _selectedIndex = 0;
  bool isSwitched = true;
  late bool showInactiveUsers;
  late bool PendingInvitations;

  String ddl_role = '';
  String ddl_isActive = '';
  TextEditingController ddl_roleTextController = TextEditingController();
  TextEditingController ddl_isActiveTextController = TextEditingController();
  TextEditingController docidTextController = TextEditingController();

  List<Map<String, dynamic>> activeUsers = [];
  List<Map<String, dynamic>> inactiveUsers = [];
  List<Map<String, dynamic>> invitedUser = [];

  @override
  void initState() {
    super.initState();
    showInactiveUsers = true;
    PendingInvitations = false;
  }

  @override
  void dispose() {
    ddl_roleTextController.dispose();
    ddl_isActiveTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manageUserBloc = BlocProvider.of<ManageUserBloc>(context);
    manageUserBloc.add(LoadUsersEvent());
    return BlocProvider(
      create: (_) => ManageUserBloc()..add(LoadUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xff375172),
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(GlobalRoutes.fleetManager);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Manage User",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: BlocBuilder<ManageUserBloc, ManageUserState>(
                bloc: manageUserBloc,
                builder: (context, state) {
                  if (state is ManageUserLoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 7,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff375172)),
                    ));
                  }

                  if (state is ManageUserSuccessState) {
                    final activeUsers = state.activeUsers;
                    final inactiveUsers = state.inactiveUsers;
                    final invitedUser = state.invitedUsers;
                    final String docid = FirebaseAuth.instance.currentUser!.uid;
                    final loggedInfo = activeUsers.firstWhereOrNull((element) => element["docid"] == docid);
                    activeUsers.removeWhere((element) => element["docid"] == docid);
                    return Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              color: const Color(0xffffffff),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedIndex = 0;
                                            showInactiveUsers = true;
                                            PendingInvitations = false;
                                            isSwitched = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: _selectedIndex == 0 ||
                                                  _selectedIndex == 2
                                              ? kcPrimaryColor
                                              : Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          textStyle: TextStyle(
                                            color: (_selectedIndex == 0 ||
                                                    _selectedIndex == 2)
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        child: const Text('Approved'),
                                      ),
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedIndex = 1;
                                            showInactiveUsers = false;
                                            PendingInvitations = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: _selectedIndex == 1
                                              ? kcPrimaryColor
                                              : Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          textStyle: TextStyle(
                                            color: _selectedIndex == 1
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        child: const Text('Invited'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (showInactiveUsers)
                              SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        isSwitched
                                            ? "Show Active Users"
                                            : "Show Inactive Users",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Switch(
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                              if (isSwitched == false) {
                                                _selectedIndex = 2;
                                              } else {
                                                _selectedIndex = 0;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (PendingInvitations)
                              SizedBox(
                                height: 50,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${invitedUser.length} Pending Invitations',
                                          style: const TextStyle(
                                            color: Color(0xff375172),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                          if (_selectedIndex == 0)
                            Expanded(
                              flex: 2,
                              child: Card(
                                color: Colors.grey.shade300,
                                elevation: 2,
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  title: Text('${loggedInfo?['firstname']}',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff375172)),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text('${loggedInfo?['phonenumber']}',
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  trailing: SizedBox(
                                    width: 110,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                              const Color(0xff375172),
                                            ),
                                            child: Text('${loggedInfo?['role']}'),
                                            onPressed: () {
                                              // ...
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),),

                        Expanded(
                          flex: 14,
                          child: Container(
                            color: const Color(0xffffffff),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _selectedIndex == 0
                                  ? activeUsers.length
                                  : _selectedIndex == 1
                                      ? invitedUser.length
                                      : inactiveUsers.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (_selectedIndex == 0) {
                                  final Map<String, dynamic> user =
                                      activeUsers[index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.account_circle,
                                        color: Colors.grey,
                                        size: 35,
                                      ),
                                      title: Text(
                                        user['firstname'].toString(),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff375172)),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: Colors.grey,
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            user['phonenumber'].toString() ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      trailing: SizedBox(
                                        width: 110,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xff375172),
                                                ),
                                                child: Text(
                                                    user['role'].toString() ??
                                                        ''),
                                                onPressed: () {
                                                  // ...
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                String ddl_role =
                                                    user['role'].toString() ??
                                                        '';
                                                String ddl_isActive =
                                                    user['isActive'] == true
                                                        ? "Active"
                                                        : "InActive";
                                                docidTextController.text =
                                                    user['docid'].toString();
                                                setState(() {
                                                  showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return maange_user_threedot_method(
                                                          user,
                                                          ddl_role,
                                                          ddl_isActive);
                                                    },
                                                  );
                                                });
                                              },
                                              child: const Icon(
                                                Icons.more_vert,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (_selectedIndex == 1) {
                                  final Map<String, dynamic> user =
                                      invitedUser[index];
                                  return Card(
                                    elevation: 2, // Increase the shadow depth
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.account_circle,
                                        color: Colors.grey,
                                        size: 35,
                                      ),
                                      title: Text(
                                        user['PhoneNumber'].toString() ?? '',
                                        style: const TextStyle(
                                            color: Color(0xff375172)),
                                      ),
                                      subtitle: Text(
                                          DateFormat('MM-dd-yyyy – kk:mm')
                                              .format(DateTime.parse(
                                                  user['InviteDate']
                                                      .toDate()
                                                      .toString()))),
                                      trailing: SizedBox(
                                        width: 110,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xff375172),
                                                ),
                                                child: Text(
                                                    user['Role'].toString() ??
                                                        ''),
                                                onPressed: () {
// ...
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        "Resend invitation"),
                                                    actions: <Widget>[
                                                      Center(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                const Color(
                                                                    0xff375172),
                                                          ),
                                                          child: Text(
                                                              "Resend invite"),
                                                          onPressed: () {
                                                            final firebaseRepo =
                                                                ManageUserRepository(
                                                                    user:
                                                                        ManageUser());
                                                            firebaseRepo.ResendInvite(
                                                                user['PhoneNumber']
                                                                        .toString() ??
                                                                    '',
                                                                user['InviteCode']
                                                                    .toString());
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: const Icon(
                                                Icons.more_vert,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (_selectedIndex == 2) {
                                  final Map<String, dynamic> user =
                                      inactiveUsers[index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.account_circle,
                                        color: Colors.grey,
                                        size: 35,
                                      ),
                                      title: Text(
                                        user['firstname'].toString() ?? '',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff375172)),
                                      ),
                                      subtitle: Text(
                                        user['phonenumber'].toString() ?? '',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      trailing: SizedBox(
                                        width: 110,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xff375172),
                                                ),
                                                child: Text(
                                                    user['role'].toString() ??
                                                        ''),
                                                onPressed: () {
                                                  // ...
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                String ddl_role =
                                                    user['role'].toString() ??
                                                        '';
                                                String ddl_isActive =
                                                    user['isActive'] == true
                                                        ? "Active"
                                                        : "InActive";
                                                docidTextController.text =
                                                    user['docid'].toString();
                                                showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return maange_user_threedot_method(
                                                        user,
                                                        ddl_role,
                                                        ddl_isActive);
                                                  },
                                                );
                                              },
                                              child: const Icon(
                                                Icons.more_vert,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const Text("No Result");
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: button(
                            any_color: const Color(0xff375172),
                            main_text: "Invite User",
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  GlobalRoutes.inviteuser);

                              //
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        )
                      ],
                    );
                  }
                  return Container();
                })),
      ),
    );
  }

  StatefulBuilder maange_user_threedot_method(
      Map<String, dynamic> user, String ddl_role, String ddl_isActive) {
    return StatefulBuilder(builder: (context, setState) {
      return BlocProvider(
          create: (_) => OnSaveBloc(),
          child: BlocListener<OnSaveBloc, OnSaveState>(listener:
              (context, state) {
            if (state is OnSaveSaved) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                content: state.value,
                onActionClick: () {},
                type: state.status,
              ));
            }
          }, child:
              BlocBuilder<OnSaveBloc, OnSaveState>(builder: (context, state) {
            if (state is OnSaveLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 7,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff375172)),
              ));
            }
            if (state is ReloadListState) {
              final manageUserBloc = context.read<ManageUserBloc>();
              manageUserBloc.add(ReloadListEvent());
            }
            return SizedBox(
              height: 700,
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Icon(
                            Icons.horizontal_rule_rounded,
                            size: 50,
                          ),
                        ),
                        Text(
                          'Edit user information',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            labelText: user['firstname'].toString(),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            labelText: user['phonenumber'].toString(),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: ddl_role,
                            items: <String>['Admin', 'Base', 'Power']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  "  " + value,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                ddl_role = newValue.toString();
                                ddl_roleTextController.text = ddl_role;
                                ddl_isActiveTextController.text =
                                    user['isActive'].toString() ?? '';
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: DropdownButton<String>(
                            value: ddl_isActive,
                            isExpanded: true,
                            items: <String>[
                              'Active',
                              'InActive',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  "  " + value,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                ddl_isActive = newValue.toString();
                                ddl_isActiveTextController.text = ddl_isActive;
                                ddl_roleTextController.text = ddl_role == ''? user['role'].toString():ddl_role;
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color(0xff375172),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  primary: Colors.white,
                                ),
                                child: const Text(
                                  'cancel',
                                  style: TextStyle(
                                    color: Color(0xff375172),
                                  ),
                                ),
                                onPressed: () {
                                  ddl_roleTextController.clear();
                                  ddl_isActiveTextController.clear();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  primary: const Color(0xff375172),
                                ),
                                child: const Text('Save'),
                                onPressed: () {
                                  String role = ddl_roleTextController.text;
                                  String isActive =
                                      ddl_isActiveTextController.text;
                                  String docId = docidTextController.text;
                                  Navigator.of(context).pop();
                                  if (isActive.isNotEmpty || role.isNotEmpty) {
                                    BlocProvider.of<OnSaveBloc>(context).add(
                                        SaveButtonPressedEvent(
                                            isActive: isActive,
                                            role: role,
                                            docId: docId));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ])),
            );
          })));
    });
  }
}
