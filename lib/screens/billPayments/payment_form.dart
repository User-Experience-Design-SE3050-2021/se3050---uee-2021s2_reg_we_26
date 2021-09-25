import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/custom_form_forward_field.dart';
import 'package:boc_smart_passbook/screens/billPayments/bills_screen.dart';
import 'package:boc_smart_passbook/screens/billPayments/custom_form_field_forward_bill.dart';
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
    return SingleChildScrollView(
      child: Form(
          key: _addItemFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0),
                    Text(
                      'Select Bill',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormForwardFieldBill(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _billController,
                      focusNode: widget.billFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Select Bill',
                      hint: 'Select a Bill',

                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Select Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _accountController,
                      focusNode: widget.accountFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Select Account',
                      hint: 'Select Account',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _amountController,
                      focusNode: widget.amountFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Amount',
                      hint: 'LKR 0.00',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Remarks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      maxLines: 2,
                      isLabelEnabled: false,
                      controller: _remarksController,
                      focusNode: widget.remarksFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Remarks',
                      hint: 'Remarks',
                    ),
                  ],
                ),
              ),
              _isProcessing
                  ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                ),
              ) : Container(
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
                      // widget.billNameFocusNode.unfocus();
                      // widget.accountNumberFocusNode.unfocus();
                      //
                      // if(_addItemFormKey.currentState!.validate()){
                      //   setState(() {
                      //     _isProcessing = true;
                      //   });
                      //
                      //   await Database.addItem(title: getTitle, description: getDescription);
                      //
                      //   setState(() {
                      //     _isProcessing = false;
                      //   });
                      //
                      //   Navigator.of(context).pop();
                      // }

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                      child: Text(
                        'Pay',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
