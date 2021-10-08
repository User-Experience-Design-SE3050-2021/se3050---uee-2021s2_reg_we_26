import 'package:boc_smart_passbook/validators/user_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readTransactions(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text("Something went wrong");
        } else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var transactionInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docID = snapshot.data!.docs[index].id;
              String date = transactionInfo['date'];
              String amount = transactionInfo['amount'];
              String description = transactionInfo['description'];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        date,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        description,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        amount,
                      ),
                    ],
                  )
                ],
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
