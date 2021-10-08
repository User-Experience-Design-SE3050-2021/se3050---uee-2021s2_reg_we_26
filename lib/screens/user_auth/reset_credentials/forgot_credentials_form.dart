import 'package:boc_smart_passbook/screens/user_auth/reset_credentials/otp_screen.dart';
import 'package:flutter/material.dart';

import '../custom_auth_form_field.dart';

class ForgotCredentialsForm extends StatefulWidget {
  final FocusNode nicFocusNode;
  final FocusNode contactFocusNode;

  const ForgotCredentialsForm({
    Key? key,
    required this.nicFocusNode,
    required this.contactFocusNode,
  }) : super(key: key);

  @override
  _ForgotCredentialsFormState createState() => _ForgotCredentialsFormState();
}

class _ForgotCredentialsFormState extends State<ForgotCredentialsForm> {
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  String getNIC = '';
  String getContact = '';
  bool _isProcessing = false;

  final _ForgotFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _ForgotFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Credentials',
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
                  SizedBox(height: 10),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _contactController,
                    focusNode: widget.contactFocusNode,
                    keyboardType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    label: 'Contact Number',
                    hint: 'Enter your contact number',
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
                          widget.contactFocusNode.unfocus();

                          if (_ForgotFormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("OTP sent to "+ getContact),
                            ));
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OTPScreen(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: Text(
                            'Send OTP',
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
