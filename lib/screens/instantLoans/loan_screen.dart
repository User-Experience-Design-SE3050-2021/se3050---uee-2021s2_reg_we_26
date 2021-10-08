import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_loan_screen.dart';
import 'loan_list.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(right:double.infinity),
              child: Icon(Icons.add,size: 30.0,),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddLoanScreen(),
                  )
              );
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Instant Loan List',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),

        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Text('Error Initializing Firebase');
              }else if(snapshot.connectionState == ConnectionState.done){
                return SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/theme2.png"),
                            fit: BoxFit.cover,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20.0,top: 20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color.fromRGBO(229, 229, 229, 1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20.0),
                            child: LoanList(),
                          ),
                        ),
                      ),
                    ),
                );
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              );
            }

            )
    );
  }
}

