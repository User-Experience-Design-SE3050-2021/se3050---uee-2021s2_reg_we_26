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
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/background.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
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
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(196, 196, 196, 0.35),
                            borderRadius: BorderRadius.circular(8.0),
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
                        Text(
                          "Problems in Login? Tap here",
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Don't have an account? Sign Up here",
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
