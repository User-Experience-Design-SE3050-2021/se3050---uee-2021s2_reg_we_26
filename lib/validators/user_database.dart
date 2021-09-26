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
    DocumentReference documentReference = _mainCollection.doc(userId).collection('users').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "nic": nic,
      "contact": contact,
      "password": password,
    };

    await documentReference.set(data).whenComplete(() => print("Successfully registered")).catchError((e) => print(e));
  }

  static Future<void> updateUser({
    required String username,
    required String nic,
    required String contact,
    required String password,
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc(userId).collection('users').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "nic": nic,
      "contact": contact,
      "password": password,
    };

    await documentReference.set(data).whenComplete(() => print("User data updated")).catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems(){
    CollectionReference notesItemCollection = _mainCollection.doc(userId).collection('users');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc(userId).collection('users').doc(docId);

    await documentReference.delete().whenComplete(() =>  print("Successfully Deactivated")).catchError((e) => print(e));
  }
}