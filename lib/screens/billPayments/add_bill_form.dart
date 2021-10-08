import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/screens/billPayments/bills_screen.dart';
import 'package:boc_smart_passbook/validators/bill_payment_database.dart';
import 'package:boc_smart_passbook/validators/bill_payment_validator.dart';
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

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('New Bill Added',style: TextStyle(fontWeight: FontWeight.w600),),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You have successfully added "'  + getBillName + '" as a new bill'),
                  const SizedBox(height: 20,),
                  const Text('Would you like to continue?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Continue'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BillsScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return SingleChildScrollView(
      child: Form(
          key: _addItemFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0,right: 8.0,bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35.0),
                    const Text(
                      'Bill Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _billNameController,
                      focusNode: widget.billNameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Bill Name';
                        }
                        else if(value.length <= 5){
                          return 'Bill Name should be greater than 5 characters';
                        }
                       // return null;
                        getBillName = value;
                      },
                      label:'Bill Name',
                      hint: 'Enter Bill Name',
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Account Number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize : 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _billNameController,
                      focusNode: widget.billNameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an Account Number';
                        }
                        else if(value.length <= 5){
                          return 'Account Number should be greater than 5 characters';
                        }
                        getAccountNumber = value;
                      },
                      label:'Account Number',
                      hint: 'Enter Account Number',
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
                          widget.billNameFocusNode.unfocus();
                          widget.accountNumberFocusNode.unfocus();

                          if(_addItemFormKey.currentState!.validate()){
                            setState(() {
                              _isProcessing = true;
                            });
                            await BillPaymentDatabase.addBill(billName: getBillName, accountNumber: getAccountNumber);
                            setState(() {
                              _isProcessing = false;
                            });
                            _showMyDialog();
                          // Navigator.of(context).pop();

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
