import 'package:flutter/material.dart';

import 'edit_user_form.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final FocusNode _userNode = FocusNode();
  final FocusNode _nicNode = FocusNode();
  final FocusNode _contactNode = FocusNode();
  final FocusNode _pwdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _userNode.unfocus();
        _nicNode.unfocus();
        _contactNode.unfocus();
        _pwdNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: const Color.fromRGBO(253,198,13,1),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
          elevation: 0,
          backgroundColor: const Color.fromRGBO(253, 198, 13, 1),
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/theme2.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Card(
                  color: Color.fromRGBO(229, 229, 229, 0.7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: EditUserForm(
                    username: _userNode,
                    nic: _nicNode,
                    contact: _contactNode,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
