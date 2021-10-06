import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('bank');

class LoanDatabase{
  static String? userId;

  static Future<void> addLoan({

    required String loanAmount,
    required String loanPeriod,

  })async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('loan').doc();

    Map<String, dynamic> data = <String , dynamic>{
      'loanAmount' : loanAmount,
      'loanPeriod': loanPeriod,
    };

    await documentReference.set(data).whenComplete(() => print('Loan has successfully registered')).catchError((e)=> print(e));
  }

  static Future<void> updateLoan({

    required String loanAmount,
    required String loanPeriod,
    required String loanId,
  })  async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('bill').doc(loanId);

    Map<String, dynamic> data = <String , dynamic>{
      'loanAmount' : loanAmount,
      'loanPeriod': loanPeriod,
    };
    await documentReference.set(data).whenComplete(() => print('Note loan updated in the database')).catchError((e)=> print(e));
  }

  static Stream<QuerySnapshot> readLoans(){
    CollectionReference notesItemCollection = _mainCollection.doc("1").collection('loan');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteLoans({
    required String loanId,
  }) async{
    DocumentReference documentReference = _mainCollection.doc("1").collection('loan').doc(loanId);
    await documentReference.delete().whenComplete(() => print("Note is successfully deleted from the database")).catchError((e) => print(e));
  }

}

