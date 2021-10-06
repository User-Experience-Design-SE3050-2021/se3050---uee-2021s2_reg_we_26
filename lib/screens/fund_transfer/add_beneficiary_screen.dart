import 'package:boc_smart_passbook/screens/fund_transfer/add_beneficiary_form.dart';
import 'package:flutter/material.dart';

class AddBeneficiaryScreen extends StatelessWidget {

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _accountNoFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _nameFocusNode.unfocus(),
        _accountNoFocusNode.unfocus(),
        _emailFocusNode.unfocus(),
        _descriptionFocusNode.unfocus(),
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title: const Text(
            'Add Beneficiary',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/theme2.png"),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AddBeneficiaryForm(
                      nameFocusNode: _nameFocusNode,
                      accountNoFocusNode: _accountNoFocusNode,
                      emailFocusNode: _emailFocusNode,
                      descriptionFocusNode: _descriptionFocusNode,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



