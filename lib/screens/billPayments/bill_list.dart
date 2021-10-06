import 'package:boc_smart_passbook/screens/billPayments/payment_screen.dart';
import 'package:boc_smart_passbook/validators/bill_payment_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:boc_smart_passbook/validators/bill_payment_database.dart';

class BillList extends StatelessWidget {
  const BillList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: BillPaymentDatabase.readBills(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("Something went wrong");
        }else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            padding: const EdgeInsets.only(top:20.0),
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var noteInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docId = snapshot.data!.docs[index].id;
              String billName = noteInfo['billName'];
              String accountNumber = noteInfo['accountNumber'];

              return Ink(
               // height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(253, 241, 133, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: ()=> Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        currentBill: billName,
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 25.0),
                    child: Text(
                      billName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "Account No  :  $accountNumber",
                    maxLines: 1,
                    overflow:  TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
