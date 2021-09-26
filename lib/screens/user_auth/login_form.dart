import 'package:boc_smart_passbook/validators/user_validator.dart';
import 'package:flutter/material.dart';
import 'custom_auth_form_field.dart';

class LoginForm extends StatefulWidget {
  final FocusNode nicFocusNode;
  final FocusNode pwdFocusNode;

  const LoginForm({
    Key? key,
    required this.nicFocusNode,
    required this.pwdFocusNode,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final _LoginInFormKey = GlobalKey<FormState>();

  String getUserName = "";
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
                  SizedBox(height: 10),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0, top: 20.0),
                    child: CustomAuthFormField(
                      isObscure: false,
                      initialValue: "",
                      controller: _nicController,
                      focusNode: widget.nicFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      label: 'Enter User NIC',
                      hint: 'Enter your NIC number',
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getUserName = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0, top: 20.0),
                    child: CustomAuthFormField(
                      isObscure: true,
                      initialValue: "",
                      controller: _pwdController,
                      focusNode: widget.pwdFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Password',
                      hint: 'Enter your Password',
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
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
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
