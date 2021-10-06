import 'package:boc_smart_passbook/screens/user_auth/custom_auth_form_field.dart';
import 'package:boc_smart_passbook/validators/user_validator.dart';
import 'package:flutter/material.dart';

class ResetPasscodeForm extends StatefulWidget {
  final FocusNode passcode;
  final FocusNode newPasscode;

  const ResetPasscodeForm({
    Key? key,
    required this.passcode,
    required this.newPasscode,
    // required this.password,
  }) : super(key: key);

  @override
  _ResetPasscodeFormState createState() => _ResetPasscodeFormState();
}

class _ResetPasscodeFormState extends State<ResetPasscodeForm> {
  final _LoginInFormKey = GlobalKey<FormState>();

  final TextEditingController _passcodeController = TextEditingController();
  final TextEditingController _newPasscodeController = TextEditingController();


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
                  SizedBox(height: 30.0),
                  CustomAuthFormField(
                    initialValue: "",
                    controller: _passcodeController,
                    focusNode: widget.passcode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getUserName = value;
                    },
                    label: 'Current Passcode',
                    hint: 'Enter your current passcode',
                  ),
                  SizedBox(height: 25),
                  CustomAuthFormField(
                    isObscure: false,
                    initialValue: "",
                    controller: _newPasscodeController,
                    focusNode: widget.newPasscode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'New Passcode',
                    hint: 'Enter your new passcode',
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getNIC = value;
                    },
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
