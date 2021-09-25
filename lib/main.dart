import 'package:boc_smart_passbook/screens/fund_transfer/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'BOC_Smart_Passbook',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(236,240,250,5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    fixedSize: Size(150,50),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FundMenu(),
                      ),
                    );
                  },
                  child: Text('Transaction'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    fixedSize: Size(150,50),
                  ),
                  onPressed: (){},
                  child: Text('Bill Payment'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    fixedSize: Size(150,50),
                  ),
                  onPressed: (){},
                  child: Text('Apply Loan'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    fixedSize: Size(150,50),
                  ),
                  onPressed: (){},
                  child: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



