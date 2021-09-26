import 'package:boc_smart_passbook/validators/user_validator.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final _LoginInFormKey = GlobalKey<FormState>();

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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 5.0),
                    child: CustomAuthFormField(
                      isObscure: false,
                      initialValue: "",
                      controller: _usernameController,
                      focusNode: widget.usernameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      label: 'Username',
                      hint: 'Enter your name',
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getUserName = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 5.0),
                    child: CustomAuthFormField(
                      isObscure: false,
                      initialValue: "",
                      controller: _nicController,
                      focusNode: widget.nicFocusNode,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 5.0),
                    child: CustomAuthFormField(
                      isObscure: false,
                      initialValue: "",
                      controller: _contactController,
                      focusNode: widget.contactFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Contact Number',
                      hint: 'Enter your Contact Number',
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getContact = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 5.0),
                    child: CustomAuthFormField(
                      isObscure: true,
                      initialValue: "",
                      controller: _pwdController,
                      focusNode: widget.pwdFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Password',
                      hint: 'Enter your new Password',
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getPwd = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0, top: 5.0),
                    child: CustomAuthFormField(
                      isObscure: true,
                      initialValue: "",
                      controller: _pwdController,
                      focusNode: widget.pwdFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Re-Type Password',
                      hint: 'Enter your new Password',
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getPwd = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0),
              child: Container(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(251, 215, 78, 100.0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: (){},
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
