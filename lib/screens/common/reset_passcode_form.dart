import 'package:boc_smart_passbook/screens/dashboard/dashboard_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/custom_auth_form_field.dart';
import 'package:boc_smart_passbook/validators/user_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResetPasscodeForm extends StatefulWidget {
  final FocusNode passcode;
  final FocusNode newPasscode;

  const ResetPasscodeForm({
    Key? key,
    required this.passcode,
    required this.newPasscode,
  }) : super(key: key);

  @override
  _ResetPasscodeFormState createState() => _ResetPasscodeFormState();
}

class _ResetPasscodeFormState extends State<ResetPasscodeForm> {
  @override
  void initState() {
    getUserCode();
  }

  getUserCode() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bank')
        .doc('1')
        .collection('otp')
        .where('code', isEqualTo: '12345')
        .get();

    setState(() {
      _passcodeController.text =
          querySnapshot.docs.map((doc) => doc.get('code')).toList()[0];
    });
  }

  bool _isProcessing = false;
  final _PasscodeFormKey = GlobalKey<FormState>();

  final TextEditingController _passcodeController = TextEditingController();
  final TextEditingController _newPasscodeController = TextEditingController();

  String getCurrent = "";
  String getNew = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _PasscodeFormKey,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 18.0, top: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black54),
                    enabled: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field can not be empty.';
                      }
                      getCurrent = value;
                    },
                    controller: _passcodeController,
                    decoration: InputDecoration(
                      labelText: 'Current Passcode',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter current passcode here',
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                            width: 2,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _newPasscodeController,
                    focusNode: widget.newPasscode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'New Passcode',
                    hint: 'Enter your new passcode',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field can not be empty.';
                      }
                      getNew = value;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomAuthFormField(
                    isObscure: true,
                    initialValue: "",
                    controller: _newPasscodeController,
                    focusNode: widget.newPasscode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Re-Type New Passcode',
                    hint: 'Enter your new passcode',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please re-type your password';
                      } else if (value != getNew) {
                        return 'Does not match with the password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  _isProcessing
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(251, 215, 78, 1)),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () {
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
                                  )),
                              onPressed: () async {
                                widget.passcode.unfocus();
                                widget.newPasscode.unfocus();

                                if (_PasscodeFormKey.currentState!.validate()) {
                                  setState(() {
                                    _isProcessing = true;
                                  });

                                  await Database.updatePasscode(
                                      passcode: getNew, docId: 'codeID');

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Passcode Changed"),
                                    backgroundColor:
                                        Color.fromRGBO(253, 198, 13, 1),
                                  ));

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen(),
                                    ),
                                  );
                                }
                              },
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
