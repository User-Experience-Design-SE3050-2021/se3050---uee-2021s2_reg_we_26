import 'package:boc_smart_passbook/validators/loan_database.dart';
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

  final List<String> periods = ['10 Months','12 Months','24 Months', '36 Months'];

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();

  String getAmount = "";
  String getPeriod = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addLoanFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 24.0),
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
                        fontWeight: FontWeight.bold
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
                    label:'Amount(Rs)',
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
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0),
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
            setState(() => getPeriod = val.toString());
          },
          hint: Text('Select Loan Period'),
          validator: (val) {
            if(val == null || val.toString().isEmpty){
              return 'Please select Loan Period';
            }
            // getAccountNo = val.toString();
          },
          items: periods.map((account) {
            return DropdownMenuItem(
              child: Text(account),
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
                        widget.amountFocusNode.unfocus();
                        widget.periodFocusNode.unfocus();

                        if(_addLoanFormKey.currentState!.validate()){
                          setState(() {
                            _isProcessing = true;
                          });
                          await LoanDatabase.addLoan(loanAmount: getAmount, loanPeriod: getPeriod);
                          setState(() {
                            _isProcessing = false;
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                        child: Text(
                          'Save',
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