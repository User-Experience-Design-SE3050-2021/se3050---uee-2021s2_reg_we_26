import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddThirdPartyForm extends StatefulWidget {
  final FocusNode payFocusNode;
  final FocusNode accountNoFocusNode;
  final FocusNode sourceFocusNode;
  final FocusNode amountFocusNode;
  final FocusNode chekFocusNode;
  final FocusNode descriptionFocusNode;


  const AddThirdPartyForm({
    required this.payFocusNode,
    required this.accountNoFocusNode,
    required this.sourceFocusNode,
    required this.amountFocusNode,
    required this.chekFocusNode,
    required this.descriptionFocusNode,
  });

  @override
  _AddThirdPartyFormState createState() => _AddThirdPartyFormState();
}

class _AddThirdPartyFormState extends State<AddThirdPartyForm> {
  final _addThirdPartyFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController _payFocusNode = TextEditingController();
  final TextEditingController _accountNoFocusNode = TextEditingController();
  final TextEditingController _sourceFocusNode = TextEditingController();
  final TextEditingController _amountFocusNode = TextEditingController();
  final TextEditingController _chekFocusNode = TextEditingController();
  final TextEditingController _descriptionFocusNode = TextEditingController();

  String getPay = "";
  String getAccountNo = "";
  String getSource = "";
  String getAmount = "";
  String getCheck = "";
  String getDescription = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addThirdPartyFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.0),
                  const Text(
                    "Pay",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initialValue: "",
                    isLabelEnabled: false,
                    controller: _descriptionFocusNode,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Description',
                    hint: 'Write the remark',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This name cannot be empty.';
                      }
                      getPay = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Account No",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initialValue: "",
                    isLabelEnabled: false,
                    controller: _accountNoFocusNode,
                    focusNode: widget.accountNoFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Account No',
                    hint: '',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This account no can not be empty.';
                      }
                      getAccountNo = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Ammount",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initialValue: "",
                    isLabelEnabled: false,
                    controller: _accountNoFocusNode,
                    focusNode: widget.accountNoFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Amount',
                    hint: 'Write the amount',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This amount can not be empty.';
                      }
                      getAmount = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Remark",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 19.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initialValue: "",
                    isLabelEnabled: false,
                    controller: _accountNoFocusNode,
                    focusNode: widget.accountNoFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Remark',
                    hint: 'Write the remark',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This remark can not be empty.';
                      }
                      getAccountNo = value;
                    },
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
                        widget.payFocusNode.unfocus();
                        widget.accountNoFocusNode.unfocus();
                        widget.amountFocusNode.unfocus();
                        widget.chekFocusNode.unfocus();
                        widget.sourceFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();
                        if(_addThirdPartyFormKey.currentState!.validate()){
                          setState(() {
                            _isProcessing = true;
                          });
                          // await FundTransferDatabase.addBeneficiary(name: getName,accountNo: getAccountNo,email: getEmail, description: getDescription);
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
                            fontSize: 18,
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
        ),
      ),
    );
  }
}
