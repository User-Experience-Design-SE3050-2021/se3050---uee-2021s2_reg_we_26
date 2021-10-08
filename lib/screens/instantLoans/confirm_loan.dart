import 'package:boc_smart_passbook/screens/instantLoans/loan_list.dart';
import 'package:boc_smart_passbook/screens/instantLoans/loan_screen.dart';
import 'package:boc_smart_passbook/validators/loan_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanConfirmScreen extends StatefulWidget {
  //const LoanConfirmScreen({Key? key}) : super(key: key);
  final String amount;
  final String period;
  final String emi;
  final String totalInterest;
  final String totalPayment;


  const LoanConfirmScreen({
    required this.amount,
    required this.period,
    required this.emi,
    required this.totalInterest,
    required this.totalPayment,
  });


  @override
  _LoanConfirmScreenState createState() => _LoanConfirmScreenState();
}

class _LoanConfirmScreenState extends State<LoanConfirmScreen> {

  bool _isProcessing = false;
  bool isChecked = false;

  late final FocusNode chekFocusNode;

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

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Created Loan Successfully',style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black45),),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You have successfully got Rs. ' + widget.amount + ' for ' + widget.period +'Month Installment'),
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
                      builder: (context) => LoanScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
    return
      Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color.fromRGBO(253,198,13,1),
          title: const Text(
            'Confirm Loan',
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
                              children:  [
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Loan Amount (Rs.)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                     widget.totalPayment,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
                                      'Loan Period     (In Months)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      widget.period,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
                                      'Interest Per Year',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '2%',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
                                      'Monthly EMI',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      widget.emi,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
                                      'Total Payment',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      widget.totalPayment,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      DateFormat.yMMMd().format(DateTime.now()),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
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
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor:
                    MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "I here by confirm that I am agree to continue my payments according to the above conditions.",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
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
                                // setState(() {
                                //   _isProcessing = true;
                                // });
                                // await LoanDatabase.addLoan(loanAmount: widget.amount, loanPeriod: widget.period);
                                // setState(() {
                                //   _isProcessing = false;
                                // });
                               // _showMyDialog();
                                if(isChecked == true) {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  //   await BillPaymentDatabase.payBill(amount: getAmount,description:getBill);
                                  setState(() {
                                    _isProcessing = false;
                                  });
                                  //Navigator.of(context).pop();
                                  await LoanDatabase.addLoan(loanAmount: widget.amount, loanPeriod: widget.period);
                                  _showMyDialog();
                                }
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
      );
  }

}
