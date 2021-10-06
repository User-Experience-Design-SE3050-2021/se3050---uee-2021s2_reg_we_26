import 'package:boc_smart_passbook/screens/billPayments/payment_form.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {

  final String currentBill;

  final FocusNode _billFocusNode = FocusNode();
  final FocusNode _accountFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _remarksFocusNode = FocusNode();
  final FocusNode _checkFocusNode = FocusNode();

  PaymentScreen({
    required this.currentBill,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _billFocusNode.unfocus();
        _accountFocusNode.unfocus();
        _amountFocusNode.unfocus();
        _remarksFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title:const Text(
            'Bill Payment',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/theme2.png"),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
            child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                  child: PaymentForm(
                    currentBill:  currentBill,
                    billFocusNode : _billFocusNode,
                    accountFocusNode : _accountFocusNode,
                    amountFocusNode : _amountFocusNode,
                    remarksFocusNode : _remarksFocusNode,
                    chekFocusNode : _checkFocusNode,
                  ),
            )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
