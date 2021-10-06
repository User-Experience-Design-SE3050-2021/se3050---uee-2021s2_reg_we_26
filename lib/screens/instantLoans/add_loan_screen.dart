import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_loan_form.dart';

class AddLoanScreen extends StatelessWidget {
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _periodFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _amountFocusNode.unfocus();
        _periodFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title:const Text(
            'Add Instant Loan',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 20.0
                  ),
                  child:  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder(
                          future: _initializeFirebase(),
                          builder: (context,snapshot){
                            if(snapshot.hasError){
                              return Text('Error Initializing Firebase');
                            }
                            else if(snapshot.connectionState == ConnectionState.done){
                              return AddLoanForm(
                                amountFocusNode: _amountFocusNode,
                                periodFocusNode: _periodFocusNode,
                              );
                            }
                            return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                            );
                          }

                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}