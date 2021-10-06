import 'package:boc_smart_passbook/screens/common/reset_passcode_form.dart';
import 'package:flutter/material.dart';

class PasscodeScreen extends StatefulWidget {
  // final String username;
  // final String nic;
  // final String contact;
  // final String password;
  //
  // const EditUserScreen({
  //   required this.username,
  //   required this.nic,
  //   required this.contact,
  //   required this.password,
  // });
  const PasscodeScreen({Key? key}) : super(key: key);


  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  final FocusNode _pwdNode = FocusNode();
  final FocusNode _newPwdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _newPwdNode.unfocus();
        _pwdNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: const Color.fromRGBO(253,198,13,1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title: const Text(
            'Change Passcode',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Card(
              color: Color.fromRGBO(196, 196, 196, 0.35),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: ResetPasscodeForm(
                passcode: _pwdNode,
                newPasscode: _newPwdNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
