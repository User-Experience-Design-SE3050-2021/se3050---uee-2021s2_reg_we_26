import 'package:boc_smart_passbook/validators/user_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditUserForm extends StatefulWidget {
  final FocusNode username;
  final FocusNode nic;
  final FocusNode contact;

  const EditUserForm({
    Key? key,
    required this.username,
    required this.nic,
    required this.contact,
  }) : super(key: key);

  @override
  _EditUserFormState createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  bool _isProcessing = false;

  @override
  void initState() {
    getUserNIC();
    getUsrName();
    getUserContact();
  }

  String getUserName = "";
  String getNIC = "";
  String getContact = "";

  final _EditFormKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  getUserNIC() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bank')
        .doc('user')
        .collection('users')
        .where('nic', isEqualTo: '951242300V')
        .get();

    setState(() {
      _nicController.text =
          querySnapshot.docs.map((doc) => doc.get('nic')).toList()[0];
      print(querySnapshot.docs.map((doc) => doc.get('nic')).toList()[0]);
    });
  }

  getUsrName() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bank')
        .doc('user')
        .collection('users')
        .where('nic', isEqualTo: '951242300V')
        .get();

    setState(() {
      _usernameController.text =
          querySnapshot.docs.map((doc) => doc.get('username')).toList()[0];
    });
  }

  getUserContact() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bank')
        .doc('user')
        .collection('users')
        .where('nic', isEqualTo: '951242300V')
        .get();

    setState(() {
      _contactController.text =
          querySnapshot.docs.map((doc) => doc.get('contact')).toList()[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _EditFormKey,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 18.0, top: 20.0),
              child: Column(
                children: [
                  Icon(
                    Icons.person_pin,
                    color: Colors.black,
                    size: 100.0,
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    enabled: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field can not be empty.';
                      }
                      getUserName = value;
                    },
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter username here',
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    enabled: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you NIC number';
                      } else if (value.length < 10) {
                        return 'Please enter a valid NIC number';
                      } else if (value.length == 10 &&
                          value.characters.last != 'V') {
                        return 'Please enter letter "V" in uppercase';
                      } else if (value.length > 12) {
                        return 'Maximum characters for NIC number is 12';
                      }
                      getNIC = value;
                    },
                    controller: _nicController,
                    decoration: InputDecoration(
                      labelText: 'NIC Number',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter NIC here',
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    style: TextStyle(color: Colors.grey),
                    enabled: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact number';
                      } else if (value.length < 10) {
                        return 'Please enter a valid contact number';
                      } else if (value.length > 12) {
                        return 'Please enter a locally used mobile number';
                      }
                      getContact = value;
                    },
                    keyboardType: TextInputType.phone,
                    controller: _contactController,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter contact number here',
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  _isProcessing
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orangeAccent),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(251, 215, 78, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () async {
                                widget.username.unfocus();
                                widget.nic.unfocus();
                                widget.contact.unfocus();

                                if(_EditFormKey.currentState!.validate()) {
                                  setState((){
                                    _isProcessing = true;
                                  });

                                  await Database.updateUser(
                                      username: getUserName,
                                      nic: getNIC,
                                      contact: getContact,
                                      docId: 'kCR18BtjqBKvFxNKGBeM',
                                  );

                                  setState((){
                                    _isProcessing = false;
                                  });

                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
