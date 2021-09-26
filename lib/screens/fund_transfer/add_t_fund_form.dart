import 'package:boc_smart_passbook/custom_form_field.dart';
import 'package:boc_smart_passbook/validator/fundtransfer_database.dart';
import 'package:flutter/material.dart';

class AddThirdPartyForm extends StatefulWidget {
  final FocusNode accountNoFocusNode;
  final FocusNode amountFocusNode;
  final FocusNode chekFocusNode;
  final FocusNode descriptionFocusNode;


  const AddThirdPartyForm({
    required this.accountNoFocusNode,
    required this.amountFocusNode,
    required this.chekFocusNode,
    required this.descriptionFocusNode,
  });

  @override
  _AddThirdPartyFormState createState() => _AddThirdPartyFormState();
}

class _AddThirdPartyFormState extends State<AddThirdPartyForm> {
  final _addThirdPartyFormKey = GlobalKey<FormState>();
  final List<String> beneficiaries = ['Isira','Kasuni','Nishan','Tarushika','Sankha'];

  final List<String> ownAccount = ['Isira - 423434564','Isira 2 - 2354545'];
  bool _isProcessing = false;

  final TextEditingController _accountNoFocusNode = TextEditingController();
  final TextEditingController _amountFocusNode = TextEditingController();
  final TextEditingController _chekFocusNode = TextEditingController();
  final TextEditingController _descriptionFocusNode = TextEditingController();
  bool isChecked = false;

  String getPay = "";
  String getAccountNo = "";
  String getSource = "";
  String getAmount = "";
  String getCheck = "";
  String getDescription = "";

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
        key: _addThirdPartyFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 24.0),
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
                      setState(() => getPay = val.toString());
                        if(getPay == "Isira") {
                          setState(() {
                            _accountNoFocusNode.text = "3434535";
                          });
                        }else if(getPay == "Kasuni"){
                          setState(() {
                            _accountNoFocusNode.text = "45454545";
                          });
                        }else if(getPay== "Tharushika"){
                          setState(() {
                            _accountNoFocusNode.text = "56565654";
                          });
                        } else if(getPay == "Sankha"){
                          setState(() {
                            _accountNoFocusNode.text = "21323133";
                          });
                        }else if(getPay== "Nishan"){
                          setState(() {
                            _accountNoFocusNode.text = "8564646";
                          });
                        }
                    },
                    // value: getPay.isEmpty ? 'Isira' : getPay,
                    validator: (val) {
                      if(val == null || val.toString().isEmpty){
                        return 'This pay can not be empty.';
                      }
                      getAccountNo = val.toString();
                    },
                    items: beneficiaries.map((beneficiary) {
                      return DropdownMenuItem(
                        child: Text(beneficiary),
                        value: beneficiary,
                      );
                    }).toList(),
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
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    enabled: false,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This accountNo can not be empty.';
                      }
                      getAccountNo = value;
                    },
                    controller: _accountNoFocusNode,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Colors.grey
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      disabledBorder: OutlineInputBorder(
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
                    ),
                  ),
                  SizedBox(height: 24.0),
                  const Text(
                    "Source",
                    style: TextStyle(
                        color: Colors.black45,
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
                      setState(() => getSource = val.toString());
                    },
                    value: getSource.isEmpty ? 'Isira - 423434564' : getSource,
                    validator: (val) {
                      if(val == null || val.toString().isEmpty){
                        return 'This source can not be empty.';
                      }
                      getAccountNo = val.toString();
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
                    "Transfer",
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
                    controller: _amountFocusNode,
                    focusNode: widget.amountFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Amount',
                    hint: 'Rs.0.00',
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
                    maxLines: 4,
                    controller: _descriptionFocusNode,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label:'Remark',
                    hint: 'Write the remark',
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'This remark can not be empty.';
                      }
                      getDescription = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        focusNode: widget.chekFocusNode,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          "I here by confirm that the above information is true and correct",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                        widget.accountNoFocusNode.unfocus();
                        widget.amountFocusNode.unfocus();
                        widget.chekFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();
                        if(_addThirdPartyFormKey.currentState!.validate() && isChecked == true){
                          setState(() {
                            _isProcessing = true;
                          });
                          await FundTransferDatabase.addFundTransfer(
                              description: getDescription,
                              amount: getAmount
                          );
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
