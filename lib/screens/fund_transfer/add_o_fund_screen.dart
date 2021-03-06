import 'package:boc_smart_passbook/screens/fund_transfer/add_o_fund_form.dart';
import 'package:boc_smart_passbook/screens/fund_transfer/add_t_fund_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddOwnAccountScreen extends StatelessWidget {

  final FocusNode _accountNoFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _chekFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _accountNoFocusNode.unfocus(),
        _amountFocusNode.unfocus(),
        _chekFocusNode.unfocus(),
        _descriptionFocusNode.unfocus(),
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title: const Text(
            'Own Account Transfers',
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
                  child: AddOwnAccountForm(
                      amountFocusNode: _amountFocusNode,
                      chekFocusNode: _chekFocusNode,
                      descriptionFocusNode: _descriptionFocusNode
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
