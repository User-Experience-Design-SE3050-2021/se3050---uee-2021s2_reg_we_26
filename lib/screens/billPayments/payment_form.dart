import 'package:boc_smart_passbook/screens/billPayments/bills_screen.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {


  final FocusNode billFocusNode;
  final FocusNode accountFocusNode;
  final FocusNode amountFocusNode;
  final FocusNode remarksFocusNode;

  const PaymentForm({
    required this.billFocusNode,
    required this.accountFocusNode,
    required this.amountFocusNode,
    required this.remarksFocusNode,
  });

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {

  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _billController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  String getBill = '';
  String getAccount = '';
  String getAmount = '';
  String getRemarks = '';


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BillsScreen(),
              ),
            );

          },
          child: Padding(
            padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
            child: Text(
              'Add Bill',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                letterSpacing: 2,
              ),
            ),
          ),
        )
    );
  }
}
