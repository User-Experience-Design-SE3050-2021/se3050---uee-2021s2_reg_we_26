import 'package:boc_smart_passbook/screens/common/settings_screen.dart';
import 'package:boc_smart_passbook/screens/user_auth/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                      ),
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(253, 198, 13, 1),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: Container(
          color: Color.fromRGBO(253, 198, 13, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      scale: 8.0,
                    ),
                  ),
                  child: SizedBox(),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(children: [
                        Icon(
                          Icons.dashboard_rounded,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black54),
                        )
                      ]),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.connect_without_contact_rounded,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Fund Transfers',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.payments_rounded,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Bill Payments',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Instant Loans',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.65),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "SIGN OUT",
                            style: TextStyle(
                                letterSpacing: 2.2, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
