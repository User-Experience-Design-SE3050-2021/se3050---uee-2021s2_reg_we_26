import 'package:boc_smart_passbook/validator/fundtransfer_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BeneficiaryListView extends StatelessWidget {
  const BeneficiaryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FundTransferDatabase.readBeneficiary(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text("Something went wrong");
        }else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            padding: const EdgeInsets.only(top:20.0),
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var bankInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docId = snapshot.data!.docs[index].id;
              String name = bankInfo['name'];
              String description = bankInfo['description'];
              String accountNo = bankInfo['accountNo'];
              String bank = bankInfo['bank'];

              return Ink(
                height: 100,
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(253, 221, 167, 1.0),
                  color: const Color.fromRGBO(253, 241, 133, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // onTap: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => EditScreen(
                  //       currentTitle: title,
                  //       currentDescription: description,
                  //       documentId: docId,
                  //     ),
                  //   ),
                  // ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 25.0),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account No  :  $accountNo",
                        maxLines: 1,
                        overflow:  TextOverflow.ellipsis,
                      ),
                      Text(
                        "$bank Bank",
                        maxLines: 1,
                        overflow:  TextOverflow.ellipsis,
                      ),
                    ],
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
