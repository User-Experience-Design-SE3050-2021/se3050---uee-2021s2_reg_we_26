import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/screens/billPayments/bills_screen.dart';
import 'package:boc_smart_passbook/screens/billPayments/custom_form_field_forward_bill.dart';
import 'package:boc_smart_passbook/screens/billPayments/payment_confirm_preview_screen.dart';
import 'package:boc_smart_passbook/validators/bill_payment_database.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {

  final String currentBill;

  final FocusNode billFocusNode;
  final FocusNode accountFocusNode;
  final FocusNode amountFocusNode;
  final FocusNode remarksFocusNode;

  const PaymentForm({
    required this.currentBill,
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

  final List<String> ownAccount = ['Account 1 - 423434564','Account 2 - 2354545'];
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
                    SizedBox(height: 35.0),
                    const Text(
                      'Select Bill',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize : 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormForwardFieldBill(
                      initialValue: widget.currentBill,
                      isLabelEnabled: false,
                      controller: _billController,
                      focusNode: widget.billFocusNode,
                      keyboardType: TextInputType.none,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select a Bill';
                        }
                        getBill = value;
                      },
                      label:'Select Bill',
                      hint: 'Select a Bill',

                    ),
                    SizedBox(height: 24.0),
                    const Text(
                      'Select Account',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize : 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // CustomFormField(
                    //   initialValue: "",
                    //   isLabelEnabled: false,
                    //   controller: _accountController,
                    //   focusNode: widget.accountFocusNode,
                    //   keyboardType: TextInputType.text,
                    //   inputAction: TextInputAction.next,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please Select an Account';
                    //     }
                    //     getAccount = value;
                    //   },
                    //   label:'Select Account',
                    //   hint: 'Select Account',
                    // ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(
                            color: Colors.grey
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => getAccount = val.toString());
                      },
                      hint: Text('Select Account'),
                     // value: getAccount.isEmpty ? 'Isira - 423434564' : getAccount,
                      validator: (val) {
                        if(val == null || val.toString().isEmpty){
                          return 'Please select an account';
                        }
                       // getAccountNo = val.toString();
                      },
                      items: ownAccount.map((account) {
                        return DropdownMenuItem(
                          child: Text(account),
                          value: account,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24.0),
                    const Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize : 19.0,
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
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter an Amount';
                        }
                        getAmount = value;
                      },
                      label:'Amount',
                      hint: 'LKR 0.00',
                    ),
                    SizedBox(height: 24.0),
                    const Text(
                      'Remarks',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize : 19.0,
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
                        getRemarks = value;
                      },
                      label:'Remarks',
                      hint: 'Remarks',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _isProcessing
                        ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                      ),
                    ) : SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(253,198,13,1)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                        ),
                        onPressed: () async{
                          widget.billFocusNode.unfocus();
                          widget.accountFocusNode.unfocus();
                          widget.amountFocusNode.unfocus();
                          widget.remarksFocusNode.unfocus();

                          if(_addItemFormKey.currentState!.validate()){
                            setState(() {
                              _isProcessing = true;
                            });
                              await BillPaymentDatabase.payBill(amount: getAmount,description:getBill);
                            setState(() {
                              _isProcessing = false;
                            });
                          //Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaymentConfirmScreen(),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
