import 'package:boc_smart_passbook/screens/common/reset_passcode_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/reset_credentials/forgot_credentials_screen.dart';
import 'package:flutter/material.dart';

import '../custom_auth_form_field.dart';

class OTPForm extends StatefulWidget {
  final FocusNode otpFocusNode;

  const OTPForm({
    Key? key,
    required this.otpFocusNode,
  }) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  String code = '12345';

  final TextEditingController _otpController = TextEditingController();
  final _ForgotFormKey = GlobalKey<FormState>();

  String getOTP = '';
  bool _isProcessing = false;

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
                  SizedBox(height: 10),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _otpController,
                    focusNode: widget.otpFocusNode,
                    keyboardType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    label: 'OTP',
                    hint: 'Enter your OTP number',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter your OTP number';
                      }
                      getOTP = value;
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(251, 215, 78, 1)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              widget.otpFocusNode.unfocus();

                              if (_ForgotFormKey.currentState!.validate()) {
                                if (code == getOTP) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PasscodeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Incorrect OTP"),
                                    backgroundColor:
                                        Color.fromRGBO(253, 198, 13, 1),
                                  ));
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotCredentialsScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                'Submit OTP',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            "Didn't recieved yet?",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(251, 215, 78, 0.70)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              widget.otpFocusNode.unfocus();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotCredentialsScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                'Re-Send OTP',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption(
      BuildContext context, String title, String description) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
                fontSize: 18.0,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
