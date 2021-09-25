import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/validator/fundtransfer_database.dart';
import 'package:boc_smart_passbook/validator/fundtransfer_validator.dart';
import 'package:flutter/material.dart';

class AddBeneficiaryForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode accountNoFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode descriptionFocusNode;

  const AddBeneficiaryForm({
   required this.nameFocusNode,
   required this.accountNoFocusNode,
   required this.emailFocusNode,
   required this.descriptionFocusNode,
  });

  @override
  _AddBeneficiaryFormState createState() => _AddBeneficiaryFormState();
}

class _AddBeneficiaryFormState extends State<AddBeneficiaryForm> {
  final _addBeneficiaryFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String getName = "";
  String getAccountNo = "";
  String getEmail = "";
  String getDescription = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addBeneficiaryFormKey,
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
                    "Beneficiary Name",
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
                    controller: _nameController,
                    focusNode: widget.nameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Name',
                    hint: 'Write the beneficiary name',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This name cannot be empty.';
                      }
                      getName = value;
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
                    controller: _accountNoController,
                    focusNode: widget.accountNoFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'AccountNo',
                    hint: 'Write the account no',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This account no cannot be empty.';
                      }
                      getAccountNo = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Beneficiary Email",
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
                    controller: _emailController,
                    focusNode: widget.emailFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Email',
                    hint: 'Write the beneficiary email',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This email cannot be empty.';
                      }
                      getEmail = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Description",
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
                    maxLines: 4,
                    isLabelEnabled: false,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Description',
                    hint: 'Write a description',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This description cannot be empty.';
                      }
                      getDescription = value;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black12),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 180.0,),
                  _isProcessing
                      ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                  ) : Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(),
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
                            widget.nameFocusNode.unfocus();
                            widget.accountNoFocusNode.unfocus();
                            widget.emailFocusNode.unfocus();
                            widget.descriptionFocusNode.unfocus();
                            if(_addBeneficiaryFormKey.currentState!.validate()){
                              setState(() {
                                _isProcessing = true;
                              });
                              await FundTransferDatabase.addBeneficiary(name: getName,accountNo: getAccountNo,email: getEmail, description: getDescription);
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
