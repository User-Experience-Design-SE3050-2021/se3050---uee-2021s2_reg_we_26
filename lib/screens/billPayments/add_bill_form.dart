import 'package:boc_smart_passbook/custom_form_field.dart';
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
                      'Bill Name',
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
                      controller: _billNameController,
                      focusNode: widget.billNameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Bill Name',
                      hint: 'Enter Bill Name',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Account Number',
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
                      controller: _billNameController,
                      focusNode: widget.billNameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        // Validator.validateField(
                        //   value: value,
                        // );
                        //
                        // getTitle = value;
                      },
                      label:'Account Number',
                      hint: 'Enter Account Number',
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
                        'Save',
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
