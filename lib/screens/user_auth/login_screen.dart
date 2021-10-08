import 'package:boc_smart_passbook/screens/user_auth/register_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/reset_credentials/forgot_credentials_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _nicFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _nicFocusNode.unfocus(),
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
              padding:  const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Image.asset('assets/logo.png',height: 150,)
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Color.fromRGBO(196, 196, 196, 0.35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),

                    child: FutureBuilder(
                        future: _initializeFirebase(),
                        builder: (context, snapshot){
                          if(snapshot.hasError){
                            return Text('Error Initializing Firebase');
                          }
                          else if(snapshot.connectionState == ConnectionState.done){
                            return LoginForm(
                              nicFocusNode: _nicFocusNode,
                              pwdFocusNode: _pwdFocusNode,
                            );
                          }
                          return const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                          );
                        }
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotCredentialsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Problems in Login? Tap here",
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign Up here",
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
