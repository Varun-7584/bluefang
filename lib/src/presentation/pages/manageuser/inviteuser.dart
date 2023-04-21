import 'package:bluefang/src/application/ManageUser_Bloc/invite_user_cubit.dart';
import 'package:bluefang/src/application/ManageUser_Bloc/invite_user_state.dart';
import 'package:bluefang/src/infrastructure/manageuser/firebase_manageuser_repository.dart';
import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:bluefang/src/presentation/pages/auth/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';

import '../../../domain/user/invite_users.dart';
import '../../constants/global_routes.dart';
import '../auth/button.dart';
import '../auth/text_field.dart';

class inviteuser extends StatefulWidget {
  inviteuser({Key? key}) : super(key: key);

  @override
  State<inviteuser> createState() => _inviteuserState();
}

class _inviteuserState extends State<inviteuser> {
  final _formKey = GlobalKey<FormState>();
  String number="";
  String dropdownValue = 'Admin';
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController accessRoleTextController = TextEditingController();
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;
  @override
  void dispose() {
    phoneNumberTextController.dispose();
    accessRoleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    accessRoleTextController.text = dropdownValue;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xffffffff),
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(GlobalRoutes.manageuser);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffffffff),
      body: BlocConsumer<InviteUserCubit, InviteUserState>(
          listener: (context, state) {
        if (state is InviteUserNavigate) {
          //Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
              // content: state.errorMsg.toString(),
              content: "Invitation code has been sent successfully!",
              onActionClick: () {},
              type: "Success"));
          phoneNumberTextController.clear();
          dropdownValue = "Admin";
        }
        if (state is InviteUserFail) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
              // content: state.errorMsg.toString(),
              content:
                  "Sorry, sending invite code failed.", //state.errorMsg.toString(),
              onActionClick: () {},
              type: "error"));
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 10.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Invite User!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff375172),
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Please enter the phone number of the user you want to invite",
                          style:
                              TextStyle(color: Color(0xff375172), fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //Required Fields
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2,
                        left: 50,
                        right: 50),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: phoneNumberTextController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[0-9]"),
                            )
                          ],
                          validator: (val) {
                          if (val == null || val.isEmpty) {
                          return 'Phone number is required';
                          }
                          if (!val.isValidPhone) return 'Invalid phone number';
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              hintStyle: const TextStyle(color: Color(0xff375172)),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.contact_phone),
                                onPressed: ()async {
                                  Contact? contact = await _contactPicker.selectContact();
                                  setState(() {
                                    _contact = contact;
                                    phoneNumberTextController.text = (contact == null ? '' : contact.phoneNumbers![0]).toString();
                                  });
                                },
                                splashRadius: 0.1, // removes the splash effect
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,

                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1.0,
                            ),
                          ),
                          child: DropdownButton<String>(
                            // Step 3.
                            value: dropdownValue,
                            // Step 4.
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
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                accessRoleTextController.text = dropdownValue;
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                        SizedBox(height: 10),

                        const SizedBox(height: 15),
                        button(
                          any_color: Color(0xff375172),
                          main_text: "Invite User",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<InviteUserCubit>().inviteUser(
                                  ManageUser(
                                      phonenumber:
                                          phoneNumberTextController.text,
                                      role: accessRoleTextController.text,
                                      invitecode: null));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

}
