import 'package:flutter/material.dart';

class BeneficiaryList extends StatelessWidget {
  const BeneficiaryList({Key? key}) : super(key: key);

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
              onPressed: () {},
            ),
          ],
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Beneficiaries',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
