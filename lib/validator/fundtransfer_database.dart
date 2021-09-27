import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('bank');

class FundTransferDatabase {
  static String? userId;

  static Future<void> addBeneficiary({
    required String name,
    required String bank,
    required String accountNo,
    required String email,
    required String description,
  }) async{
    DocumentReference documentReference = _mainCollection.doc('1').collection('beneficiary').doc();

    Map<String,dynamic> data = <String, dynamic>{
      "name" : name,
      "bank" : bank,
      "accountNo" : accountNo,
      "email" : email,
      "description" : description,
    };

    await documentReference.set(data).whenComplete(() => print("Note beneficiary inserted to the database")).catchError((e) => print(e));
  }

  static Future<void> addFundTransfer({
    required String amount,
    required String description,
  }) async{
    DocumentReference documentReference = _mainCollection.doc('1').collection('transaction').doc();
    Map<String,dynamic> data = <String, dynamic>{
      "amount" : amount,
      "description" : description,
      "date" :  DateFormat.yMMMd().format(DateTime.now()),
    };

    await documentReference.set(data).whenComplete(() => print("Note transfer inserted to the database")).catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readBeneficiary(){
    CollectionReference bankBeneficiaryCollection = _mainCollection.doc('1').collection('beneficiary');
    return bankBeneficiaryCollection.snapshots();
  }

}