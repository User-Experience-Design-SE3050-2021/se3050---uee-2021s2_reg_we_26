import 'package:boc_smart_passbook/screens/user_auth/login_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/register_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _nicFocusNode = FocusNode();
  final FocusNode _contactNumberFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _usernameFocusNode.unfocus(),
        _nicFocusNode.unfocus(),
        _contactNumberFocusNode.unfocus(),
        _pwdFocusNode.unfocus(),
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
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Image.asset(
                        'assets/logo.png',
                        height: 100,
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
                          return RegisterForm(
                            usernameFocusNode: _usernameFocusNode,
                            nicFocusNode: _nicFocusNode,
                            contactFocusNode: _contactNumberFocusNode,
                            pwdFocusNode: _pwdFocusNode,
                          );
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(253, 198, 13, 1)),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Already have an account? Sign In here",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
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
