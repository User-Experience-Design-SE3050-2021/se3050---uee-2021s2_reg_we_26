import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('bank');

class Database{
  static String? userId;

  static Stream<QuerySnapshot> readTransactions(){
    CollectionReference notesItemCollection = _mainCollection.doc(userId).collection('transactions');

    return notesItemCollection.snapshots();
  }

}