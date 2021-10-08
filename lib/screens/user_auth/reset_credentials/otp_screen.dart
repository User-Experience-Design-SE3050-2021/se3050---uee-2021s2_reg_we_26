import 'package:boc_smart_passbook/screens/user_auth/reset_credentials/otp_form.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FocusNode _otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _otpFocusNode.unfocus(),
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 60.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Image.asset(
                            'assets/logo.png',
                            height: 150,
                          )),
                    ],
                  ),
                ),
                Card(
                  color: Color.fromRGBO(196, 196, 196, 0.35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: OTPForm(
                    otpFocusNode: _otpFocusNode,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
