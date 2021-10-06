import 'package:flutter/material.dart';
import 'package:boc_smart_passbook/validators/user_validator.dart';
import 'custom_auth_form_field.dart';

class EditUserForm extends StatefulWidget {
  final FocusNode username;
  final FocusNode nic;
  final FocusNode contact;
  // final FocusNode password;

  // const EditUserForm({
  //   required this.username,
  //   required this.nic,
  //   required this.contact,
  //   required this.password,
  // });

  const EditUserForm({
    Key? key,
    required this.username,
    required this.nic,
    required this.contact,
    // required this.password,
  }) : super(key: key);


  @override
  _EditUserFormState createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _LoginInFormKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  String getUserName = "";
  String getNIC = "";
  String getContact = "";
  String getPwd = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _LoginInFormKey,
        child: Column(
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0, top: 20.0),
              child: Column(
                children: [
                  Icon(
                      Icons.person_pin,
                      color: Colors.black,
                      size: 100.0,
                  ),
                  SizedBox(height: 30.0),
                  CustomAuthFormField(
                    initialValue: "",
                    controller: _usernameController,
                    focusNode: widget.username,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getUserName = value;
                    },
                    label: 'Username',
                    hint: 'Enter your name',
                  ),
                  SizedBox(height: 25),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _nicController,
                    focusNode: widget.nic,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'NIC Number',
                    hint: 'Enter your NIC number',
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getNIC = value;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _contactController,
                    focusNode: widget.contact,
                    keyboardType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getContact = value;
                    },
                    label: 'Contact Number',
                    hint: 'Enter your Contact Number',
                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // minimumSize: const Size(50, 20),
                          // maximumSize: const Size(200, 50),
                            primary: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(251, 215, 78, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                        ),
                        onPressed: (){},
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
