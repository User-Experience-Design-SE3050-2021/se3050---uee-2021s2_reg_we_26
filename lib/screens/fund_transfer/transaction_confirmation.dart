import 'package:boc_smart_passbook/screens/fund_transfer/menu.dart';
import 'package:boc_smart_passbook/validator/fundtransfer_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionConfirmation extends StatefulWidget {
  final String pay;
  final String source;
  final String amount;
  final String description;

  const TransactionConfirmation({
    required this.pay,
    required this.source,
    required this.amount,
    required this.description,
  });

  @override
  _TransactionConfirmationState createState() => _TransactionConfirmationState();
}

class _TransactionConfirmationState extends State<TransactionConfirmation> {
  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Transaction Completed.',style: TextStyle(fontWeight: FontWeight.w600),),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You have successfully transfer Rs. ' + widget.amount + ' to the ' + widget.pay),
                  SizedBox(height: 20,),
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
                      builder: (context) => const FundMenu(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }


    bool _isProcessing = false;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Confirm Transaction',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/theme2.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color.fromRGBO(229, 229, 229, 0.7),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20.0,top: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'From',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.source,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'To',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.pay,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Amount',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.amount,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Remark',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.description,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16.0,top: 40.0,bottom: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 140,height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black12),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
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
                    _isProcessing ?
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                      ),
                    ) :
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 140,height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(253,198,13,1)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isProcessing = true;
                              });
                              await FundTransferDatabase.addFundTransfer(
                                  description: widget.description,
                                  amount: widget.amount
                              );
                              setState(() {
                                _isProcessing = false;
                              });
                              _showMyDialog();
                            },
                            child: const Text(
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
                  ],
                )
            ),
          ],
        ),
      ),
    );;
  }
}

