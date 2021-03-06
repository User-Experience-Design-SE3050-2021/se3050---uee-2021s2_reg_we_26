import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/screens/billPayments/custom_form_field_forward_bill.dart';
import 'package:boc_smart_passbook/screens/billPayments/payment_confirm_preview_screen.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  final String currentBill;

  final FocusNode billFocusNode;
  final FocusNode accountFocusNode;
  final FocusNode amountFocusNode;
  final FocusNode remarksFocusNode;
  final FocusNode chekFocusNode;

  const PaymentForm({
    required this.currentBill,
    required this.billFocusNode,
    required this.accountFocusNode,
    required this.amountFocusNode,
    required this.remarksFocusNode,
    required this.chekFocusNode,
  });

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  final List<String> ownAccount = [
    'Account 1 - 423434564',
    'Account 2 - 2354545'
  ];
  bool _isProcessing = false;

  final TextEditingController _billController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  bool isChecked = false;

  String getBill = '';
  String getAccount = '';
  String getAmount = '';
  String getRemarks = '';

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.grey;
    }

    return SingleChildScrollView(
      child: Form(
          key: _addItemFormKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35.0),
                    const Text(
                      'Select Bill',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
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
                      label: 'Select Bill',
                      hint: 'Select a Bill',
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Select Account',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.grey),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )),
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
                      hint: const Text('Select Account'),
                      // value: getAccount.isEmpty ? 'Isira - 423434564' : getAccount,
                      validator: (val) {
                        if (val == null || val.toString().isEmpty) {
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
                    const SizedBox(height: 24.0),
                    const Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
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
                      label: 'Amount',
                      hint: 'LKR 0.00',
                    ),
                    const SizedBox(height: 24.0),
                    Row(children: const [
                      Text(
                        'Remarks',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '(Optional)',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ))
                    ]),
                    const SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      maxLines: 2,
                      isLabelEnabled: false,
                      controller: _remarksController,
                      focusNode: widget.remarksFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        getRemarks = value;
                      },
                      label: 'Remarks',
                      hint: 'Remarks',
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          focusNode: widget.chekFocusNode,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I here by confirm that the above information is true and correct",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.orangeAccent),
                            ),
                          )
                        : SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(253, 198, 13, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                              ),
                              onPressed: () async {
                                widget.billFocusNode.unfocus();
                                widget.accountFocusNode.unfocus();
                                widget.amountFocusNode.unfocus();
                                widget.remarksFocusNode.unfocus();
                                widget.chekFocusNode.unfocus();

                                if (_addItemFormKey.currentState!.validate() &&
                                    isChecked == true) {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  //   await BillPaymentDatabase.payBill(amount: getAmount,description:getBill);
                                  setState(() {
                                    _isProcessing = false;
                                  });
                                  //Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentConfirmScreen(
                                        bill: getBill,
                                        amount: getAmount,
                                        remarks: getRemarks,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(top: 16.0, bottom: 16.0),
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
          )),
    );
  }
}
