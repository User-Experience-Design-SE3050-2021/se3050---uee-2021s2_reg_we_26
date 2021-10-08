import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('bank');

class Database{
  static String? userId;

  static Future<void> registerUser({
    required String username,
    required String nic,
    required String contact,
    required String password,
  }) async {
    DocumentReference documentReference = _mainCollection.doc('user').collection('users').doc('1');

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "nic": nic,
      "contact": contact,
      "password": password,
    };

    await documentReference.set(data).whenComplete(() => print("Successfully registered")).catchError((e) => print(e));
  }

  static Future<void> loginUser({
    required String nic,
    required String password,
  }) async {
    DocumentReference documentReference = _mainCollection.doc('user').collection('users').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nic": nic,
      "password": password,
    };

    await documentReference.set(data).whenComplete(() => print("Successfully registered")).catchError((e) => print(e));
  }

  static Future<void> updateUser({
    required String username,
    required String nic,
    required String contact,
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc('user').collection('users').doc('1');

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "nic": nic,
      "contact": contact,
      "password": '12345',
    };

    await documentReference.set(data).whenComplete(() => print("User data updated")).catchError((e) => print(e));
  }

  static Future<void> updatePasscode({
    required String passcode,
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc('1').collection('passcode').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "code": passcode,
    };

    await documentReference.set(data).whenComplete(() => print("User data updated")).catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readTransactions(){
    CollectionReference transactionsItemCollection = _mainCollection.doc("1").collection("transaction");

    return transactionsItemCollection.snapshots();
  }

  static Future<void> deleteUser({
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc('user').collection('users').doc(docId);

    await documentReference.delete().whenComplete(() =>  print("Successfully Deactivated")).catchError((e) => print(e));
  }

}