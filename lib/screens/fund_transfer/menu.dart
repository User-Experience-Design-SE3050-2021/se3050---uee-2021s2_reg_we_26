import 'package:boc_smart_passbook/screens/fund_transfer/add_t_fund_screen.dart';
import 'package:boc_smart_passbook/screens/fund_transfer/beneficiary_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundMenu extends StatelessWidget {
  const FundMenu({Key? key}) : super(key: key);

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
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
            'Fund Transfer',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,top: 20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.black38,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(253, 241, 133, 1.0),
                              fixedSize: const Size(double.maxFinite,150),
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BeneficiaryList(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  'Beneficiaries',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                const SizedBox(width: 35.0,),
                                SizedBox(
                                  height: double.infinity,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      size: 70.0,
                                      color: Colors.black45,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 150.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // primary: const Color.fromRGBO(253, 221, 167, 1.0),
                                        primary: const Color.fromRGBO(253, 241, 133, 1.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:  BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => AddThirdPartyScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Third Party Transfer',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0,),
                              Expanded(
                                child: SizedBox(
                                  height: 150.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // primary: const Color.fromRGBO(253, 221, 167, 1.0),
                                        primary : const Color.fromRGBO(253, 241, 133, 1.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:  BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => const FundMenu(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Own Account Transfer',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            );
          }),
    );
  }
}
