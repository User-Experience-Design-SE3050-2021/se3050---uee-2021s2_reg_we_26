import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('bank');

class BillPaymentDatabase{
  static String? userId;

  static Future<void> addBill({

    required String billName,
    required String accountNumber
  })async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('bill').doc();

    Map<String, dynamic> data = <String , dynamic>{
      'billName' : billName,
      'accountNumber': accountNumber,
    };

    await documentReference.set(data).whenComplete(() => print('Note item inserted to the database')).catchError((e)=> print(e));
  }

  static Future<void> updateBill({

    required String billName,
    required String accountNumber,
    required String docId,
  })  async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('bill').doc(docId);

    Map<String, dynamic> data = <String , dynamic>{
      'billName' : billName,
      'accountNumber': accountNumber,
    };

    await documentReference.set(data).whenComplete(() => print('Note item updated in the database')).catchError((e)=> print(e));

  }

  static Stream<QuerySnapshot> readBills(){
    CollectionReference notesItemCollection = _mainCollection.doc("1").collection('bill');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteBill({
    required String docId,
  }) async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('bill').doc(docId);
    await documentReference.delete().whenComplete(() => print("Note item deleted from the database")).catchError((e) => print(e));
  }

  static Future<void> payBill({

    required String amount,
    required String description,
    required String date,

  })async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('').doc();

    Map<String, dynamic> data = <String , dynamic>{
      'amount' : amount,
      'description': description,
      'date': date,
    };

    await documentReference.set(data).whenComplete(() => print('Note item inserted to the database')).catchError((e)=> print(e));
  }
}


