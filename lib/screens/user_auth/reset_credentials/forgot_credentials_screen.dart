import 'package:boc_smart_passbook/screens/user_auth/reset_credentials/forgot_credentials_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotCredentialsScreen extends StatefulWidget {
  const ForgotCredentialsScreen({Key? key}) : super(key: key);

  @override
  _ForgotCredentialsScreenState createState() =>
      _ForgotCredentialsScreenState();
}

class _ForgotCredentialsScreenState extends State<ForgotCredentialsScreen> {
  final FocusNode _nicFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _nicFocusNode.unfocus(),
        _contactFocusNode.unfocus(),
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
              bottom: 100.0,
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
                  child: FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error Initializing Firebase');
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return ForgotCredentialsForm(
                              nicFocusNode: _nicFocusNode,
                              contactFocusNode: _contactFocusNode);
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orangeAccent),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
