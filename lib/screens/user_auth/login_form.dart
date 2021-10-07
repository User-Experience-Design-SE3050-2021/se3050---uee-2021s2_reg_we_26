import 'package:boc_smart_passbook/screens/dashboard/dashboard_screen.dart';
import 'package:boc_smart_passbook/validators/user_database.dart';
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
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _LoginInFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _nicController,
                    focusNode: widget.nicFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Enter User NIC',
                    hint: 'Enter your NIC number',
                    validator: (value) {
                      Validator.validateField(value: value);
                      getUserName = value;
                    },
                  ),
                  SizedBox(height: 10),
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
                      Validator.validateField(value: value);
                      getPwd = value;
                    },
                  ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(251, 215, 78, 1)),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
                          widget.nicFocusNode.unfocus();
                          widget.pwdFocusNode.unfocus();

                          if (_LoginInFormKey.currentState!.validate()) {
                            setState((){
                              _isProcessing = true;
                            });

                            await Database.loginUser(nic: getUserName, password: getPwd);

                            setState((){
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
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
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
