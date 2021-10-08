import 'package:boc_smart_passbook/screens/dashboard/dashboard_screen.dart';
import 'package:boc_smart_passbook/validators/user_database.dart';
import 'package:flutter/material.dart';

import 'custom_auth_form_field.dart';

class RegisterForm extends StatefulWidget {
  final FocusNode usernameFocusNode;
  final FocusNode nicFocusNode;
  final FocusNode contactFocusNode;
  final FocusNode pwdFocusNode;

  const RegisterForm({
    Key? key,
    required this.usernameFocusNode,
    required this.nicFocusNode,
    required this.contactFocusNode,
    required this.pwdFocusNode,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _LoginInFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _rePwdController = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 2.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    initialValue: "",
                    controller: _usernameController,
                    focusNode: widget.usernameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter username';
                      }
                      getUserName = value;
                    },
                    label: 'Username',
                    hint: 'Enter your name',
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _nicController,
                    focusNode: widget.nicFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'NIC Number',
                    hint: 'Enter your NIC number',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter you NIC number';
                      } else if (value.length < 10) {
                        return 'Please enter a valid NIC number';
                      } else if (value.length == 10 &&
                          value.characters.last != 'V') {
                        return 'Please enter letter "V" in uppercase';
                      } else if (value.length > 12) {
                        return 'Maximum characters for NIC number is 12';
                      }
                      getNIC = value;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _contactController,
                    focusNode: widget.contactFocusNode,
                    keyboardType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter your contact number';
                      } else if (value.length < 10) {
                        return 'Please enter a valid contact number';
                      } else if (value.length > 12) {
                        return 'Please enter a locally used mobile number';
                      }
                      getContact = value;
                    },
                    label: 'Contact Number',
                    hint: 'Enter your Contact Number',
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _pwdController,
                    focusNode: widget.pwdFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Password',
                    hint: 'Enter your Password',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter a password';
                      } else if (value.length < 5) {
                        return 'Passcode cannot be less than 5 characters';
                      }
                      getPwd = value;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _rePwdController,
                    focusNode: widget.pwdFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Re-Type Password',
                    hint: 'Enter your Password again',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please re-type your password';
                      } else if (value != getPwd) {
                        return 'Does not match with the password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(251, 215, 78, 1)),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(251, 215, 78, 1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          widget.usernameFocusNode.unfocus();
                          widget.nicFocusNode.unfocus();
                          widget.contactFocusNode.unfocus();
                          widget.pwdFocusNode.unfocus();

                          if (_LoginInFormKey.currentState!.validate()) {
                            Database.userId = getNIC;
                            setState(() {
                              _isProcessing = true;
                            });
                            await Database.registerUser(
                                username: getUserName,
                                nic: getNIC,
                                contact: getContact,
                                password: getPwd);

                            setState(() {
                              _isProcessing = false;
                            });
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              letterSpacing: 2,
                            ),
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
