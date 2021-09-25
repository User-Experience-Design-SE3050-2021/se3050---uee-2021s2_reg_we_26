import 'package:boc_smart_passbook/screens/billPayments/add_bill_form.dart';
import 'package:flutter/material.dart';

class AddBillScreen extends StatelessWidget {
  //const AddBillScreen({Key? key}) : super(key: key);

  final FocusNode _billNameFocusNode = FocusNode();
  final FocusNode _accountNumberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _billNameFocusNode.unfocus();
        _accountNumberFocusNode.unfocus();
      },
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title:const Text(
            'Add Bill',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: AddBillForm(
                billNameFocusNode : _billNameFocusNode,
                accountNumberFocusNode : _accountNumberFocusNode
            ),
          ),
        ),
      ),
    );
  }
}
