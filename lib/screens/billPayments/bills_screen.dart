import 'package:boc_smart_passbook/screens/billPayments/add_bill_screen.dart';
import 'package:boc_smart_passbook/screens/billPayments/bill_list.dart';
import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  _BillsScrrenState createState() => _BillsScrrenState();
}

class _BillsScrrenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Bill List',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddBillScreen(),
              )
          );
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: BillList(),
        ),
      ),
    );
  }
}
