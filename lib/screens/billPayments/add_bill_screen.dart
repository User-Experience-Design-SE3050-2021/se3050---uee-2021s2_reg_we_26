import 'package:boc_smart_passbook/screens/billPayments/add_bill_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddBillScreen extends StatelessWidget {
  //const AddBillScreen({Key? key}) : super(key: key);

  final FocusNode _billNameFocusNode = FocusNode();
  final FocusNode _accountNumberFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _billNameFocusNode.unfocus();
        _accountNumberFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color.fromRGBO(253, 198, 13, 1),
          title: const Text(
            'Add Bill',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/theme2.png"),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder(
                            future: _initializeFirebase(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text(
                                    'Error Initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AddBillForm(
                                  billNameFocusNode: _billNameFocusNode,
                                  accountNumberFocusNode:
                                      _accountNumberFocusNode,
                                );
                              }
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orangeAccent),
                              );
                            }),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
