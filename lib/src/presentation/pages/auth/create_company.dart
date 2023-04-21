import 'package:bluefang/src/presentation/pages/auth/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_bar.dart';
import 'button.dart';
import 'validators.dart';
import 'text_field.dart';

class create_Company extends StatefulWidget {
  create_Company({Key? key}) : super(key: key);

  @override
  State<create_Company> createState() => Create_CompanyState();
}

class Create_CompanyState extends State<create_Company> {
  @override
  void initState() {
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        leadingIcon: Icons.close,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
        trailingIcon: Icons.help,
        trailingOnPressed: () {

        },
      ),

      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Create Company",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
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
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.17,
                  left: 40,
                  right: 40),
              child: Expanded(
                child: Column(
                  children: <Widget>[
                        Text_Field(
                        hint_text: "Company Name",
                         validator: (val){
                           if( val== null || val.isEmpty) {
                             return 'Company name is required.';
                           }
                           if ( !val.isValidName) {
                             return 'Enter valid Company Name';
                           }
                         },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"),
                            )
                          ],
                      ),
                      SizedBox(height: 8,),
                       Text_Field(
                        hint_text: "First Name",
                         validator: (val){
                           if( val== null || val.isEmpty) {
                             return 'First Name is required.';
                           }
                           if (!val.isValidName) {
                             return 'Enter valid first Name';
                           }
                         },
                         inputFormatters: [
                           FilteringTextInputFormatter.allow(
                             RegExp(r"[a-zA-Z]+|\s"),
                           )
                         ],



                      ),
                      const SizedBox(height: 8,),
                       Text_Field(
                        hint_text: "Last Name",
                         validator: (val){
                           if( val== null || val.isEmpty) {
                             return 'Last Name is required.';
                           }
                           if (!val.isValidName) {
                             return 'Enter valid Last Name';
                           }
                         },
                         inputFormatters: [
                           FilteringTextInputFormatter.allow(
                             RegExp(r"[a-zA-Z]+|\s"),
                           )
                         ],

                      ),
                      const SizedBox(height: 8,),

                       Text_Field(
                        hint_text: "Job Title",
                         validator: (val){
                           if( val== null || val.isEmpty)
                             return 'Job title is required.';
                           if (!val.isValidName) {
                             return 'Enter valid Job Title';
                           }
                         },
                         inputFormatters: [
                           FilteringTextInputFormatter.allow(
                             RegExp(r"[a-zA-Z]+|\s"),
                           )
                         ],

                      ),
                      SizedBox(height: 8,),
                        Text_Field(
                        hint_text: "Address",
                         validator: (val){
                           if( val== null || val.isEmpty) {
                             return 'Address is required.';
                           }
                           if (!val.isValidName) {
                             return 'Enter valid Address';
                           }
                         },
                      ),
                      const SizedBox(height: 8),
                        button(
                          onPressed: () { if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_in()
                            ));
                          }
                          },
                          any_color:Color(0xff375172),
                          main_text: "sign up",
                        ),
                  ],
                ),
              ),
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}
