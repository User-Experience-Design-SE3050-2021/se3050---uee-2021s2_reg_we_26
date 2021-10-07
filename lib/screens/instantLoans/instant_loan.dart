import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_loan_screen.dart';
import 'loan_screen.dart';

class LoanMenu extends StatelessWidget {
  const LoanMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 198, 13, 1),
        title: const Text(
          'Instant Loan',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/theme2.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                    child: Text(
                      "            Get the money you need,                               "
                      "Whenever you need it!!!!!!!!,  Enjoy the most easiest and fastest loans "
                      " up-to LKR 400 000 with the lowest "
                      "interest. We provide the best services for you.",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  tileColor: Color.fromRGBO(253, 198, 13, 1),
                ),
                Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/instantLoan.png',
                      height: 1400,
                    )),
                FlatButton(
                    textColor: Colors.white,
                    height: 30.0,
                    minWidth: 150,
                    color: Colors.cyan,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddLoanScreen(),
                        ),
                      );
                    },
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    child: Row(
                      children: [
                        Text(
                          'EMAIL',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                    // ),
                    ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    fixedSize: Size(350, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoanScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'My Loans',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
