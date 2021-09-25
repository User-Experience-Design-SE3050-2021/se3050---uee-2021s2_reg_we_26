import 'package:flutter/material.dart';

class AddBillForm extends StatefulWidget {
  //const AddBillForm({Key? key}) : super(key: key);

  final FocusNode billNameFocusNode;
  final FocusNode accountNumberFocusNode;

  const AddBillForm({
    required this.billNameFocusNode,
    required this.accountNumberFocusNode,
  });


  @override
  _AddBillFormState createState() => _AddBillFormState();
}

class _AddBillFormState extends State<AddBillForm> {

  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _billNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  String getBillName = '';
  String getAccountNumber = '';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
