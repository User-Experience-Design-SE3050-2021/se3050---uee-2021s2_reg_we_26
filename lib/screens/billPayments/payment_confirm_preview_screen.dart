//import 'package:boc_smart_passbook/screens/billPayments/payment_confirm_preview_form.dart';
import 'package:boc_smart_passbook/screens/billPayments/payment_screen.dart';
import 'package:boc_smart_passbook/validators/bill_payment_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class PaymentConfirmScreen extends StatefulWidget {
  //const PaymentConfirmScreen({Key? key}) : super(key: key);
  final String bill;
  final String amount;
  final String remarks;


  const PaymentConfirmScreen({
    required this.bill,
    required this.amount,
    required this.remarks,
  });

  @override
  _PaymentConfirmScreenState createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {

  @override
  Widget build(BuildContext context) {
    bool _isProcessing = false;
    return
      Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: const Color.fromRGBO(253,198,13,1),
        title: const Text(
          'Confirm Payment',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/theme2.png"),
        //       fit: BoxFit.cover,
        //     )
        // ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: const Color.fromRGBO(229, 229, 229, 0.7),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20.0,top: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Ref No',
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
                                    '123',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Bill',
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
                                    widget.bill,
                                    style: const TextStyle(
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
                              const Expanded(
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
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Remarks',
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
                                    widget.remarks,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
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
                                    style: const TextStyle(
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
                             await BillPaymentDatabase.payBill(amount: widget.amount,description:widget.remarks);
                              setState(() {
                                _isProcessing = false;
                              });

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(currentBill: ''),
                                ),
                              );
                            },
                            child: const Text(
                              'Confirm',
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
