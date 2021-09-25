import 'package:flutter/material.dart';

class LoanMenu extends StatelessWidget {
  const LoanMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Instant Loan',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
