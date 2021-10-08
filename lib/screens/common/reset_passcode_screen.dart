import 'package:boc_smart_passbook/screens/common/reset_passcode_form.dart';
import 'package:flutter/material.dart';

class PasscodeScreen extends StatefulWidget {
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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
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
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/theme2.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Card(
                  color: Color.fromRGBO(229, 229, 229, 0.7),
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
          ],
        ),
      ),
    );
  }
}
