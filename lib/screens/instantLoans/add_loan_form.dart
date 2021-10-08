import 'package:boc_smart_passbook/screens/instantLoans/confirm_loan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../custom_form_field.dart';

class AddLoanForm extends StatefulWidget {
  final FocusNode amountFocusNode;
  final FocusNode periodFocusNode;

  const AddLoanForm({
    required this.amountFocusNode,
    required this.periodFocusNode,
  });

  @override
  _AddLoanFormState createState() => _AddLoanFormState();
}

class _AddLoanFormState extends State<AddLoanForm> {
  final _addLoanFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final List<int> periods = [10, 12, 24, 36];

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();

  String getAmount = "";
  var getPeriod;
  var totalInterest = 0.00, totalPayment = 0.00;
  double emi = 0.00;
  double monthlyemi = 0.00,
      totalInterestDouble = 0.00,
      totalPaymentDouble = 0.00;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Form(
        key: _addLoanFormKey,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.0),
                  Text(
                    "Amount(Rs)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initialValue: "",
                    isLabelEnabled: false,
                    controller: _amountController,
                    focusNode: widget.amountFocusNode,
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    label: 'Amount(Rs)',
                    hint: 'Enter Amount',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the loan amount';
                      }
                      getAmount = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    "Period(In Months)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.yellowAccent),
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
                      setState(() => getPeriod = val.toString());
                    },
                    hint: Text('Select Loan Period'),
                    validator: (val) {
                      if (val == null || val.toString().isEmpty) {
                        return 'Please select Loan Period';
                      }
                    },
                    items: periods.map((account) {
                      return DropdownMenuItem(
                        child: Text('$account'),
                        value: account,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 152,
                        height: 55,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black12),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _isProcessing
                      ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orangeAccent),
                          ),
                        )
                      : Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 155,
                              height: 55,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(253, 198, 13, 1)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                ),
                                onPressed: () async {
                                  widget.amountFocusNode.unfocus();
                                  widget.periodFocusNode.unfocus();

                                  if (_addLoanFormKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    print(getAmount);
                                    print(getPeriod);
                                    var amount = int.parse(getAmount);
                                    var period = int.parse(getPeriod);
                                    setState(() {
                                      emi = (amount * 0.12) / 12 +
                                          (amount / period);
                                      monthlyemi = double.parse(
                                          (emi).toStringAsFixed((2)));
                                    });
                                    setState(() {
                                      totalInterest =
                                          (amount * 0.12) * (period / 12);
                                      totalInterestDouble = double.parse(
                                          (totalInterest).toStringAsFixed((2)));
                                    });
                                    setState(() {
                                      totalPayment = amount +
                                          ((amount * 0.12) * (period / 12));
                                      totalPaymentDouble = double.parse(
                                          (totalPayment).toStringAsFixed((2)));
                                    });
                                  }
                                },
                                child: const Text(
                                  'Calculate',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 40.0),
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromRGBO(229, 229, 229, 0.7),
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 20.0, top: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Center(
                                    child: Text(
                                      'Loan Summary',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: 20.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Monthly EMI',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    monthlyemi.toString(),
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Total Interest',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    totalInterestDouble.toString(),
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Total Payment',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    totalPaymentDouble.toString(),
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ]),
                      ])))),
      const SizedBox(height: 40),
      Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 40.0, bottom: 40.0),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 152,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _isProcessing
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                      ),
                    )
                  : Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 155,
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(253, 198, 13, 1)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            onPressed: () async {
                              widget.amountFocusNode.unfocus();
                              widget.periodFocusNode.unfocus();

                              if (_addLoanFormKey.currentState!.validate()) {
                                setState(() {
                                  _isProcessing = true;
                                });
                                setState(() {
                                  _isProcessing = false;
                                });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LoanConfirmScreen(
                                      amount: getAmount,
                                      period: getPeriod.toString(),
                                      monthlyemi: monthlyemi.toString(),
                                      totalInterest: totalInterest.toString(),
                                      totalPayment: totalPayment.toString(),
                                      totalPaymentDouble:
                                          totalPaymentDouble.toString(),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Apply Loan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    ]));
  }
}
