import 'package:flutter/material.dart';

class FundMenu extends StatelessWidget {
  const FundMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
            'Fund Transfer',
            style: TextStyle(
              color: Colors.black54,
            ),
        ),
      ),
    );
  }
}
