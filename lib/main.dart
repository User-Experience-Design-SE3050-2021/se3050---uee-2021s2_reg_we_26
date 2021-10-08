import 'package:boc_smart_passbook/screens/common/settings_screen.dart';
import 'package:boc_smart_passbook/screens/dashboard/dashboard_screen.dart';
import 'package:boc_smart_passbook/screens/billPayments/payment_screen.dart';
import 'package:boc_smart_passbook/screens/fund_transfer/menu.dart';
import 'package:boc_smart_passbook/screens/user_auth/login_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/register_screen.dart';
import 'package:boc_smart_passbook/screens/instantLoans/instant_loan.dart';
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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/welcome_page.png"),
            fit: BoxFit.cover,
          )),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
