import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/User/AddUser.dart';
import 'package:pocketdocket/User/Auth.dart';

class EditName extends StatelessWidget {
  EditName({Key? key}) : super(key: key);
  TextEditingController NameController = TextEditingController();

  final CollectionReference UserDB =
      FirebaseFirestore.instance.collection('Users');

  Future UpdateUserName() async {
    return await UserDB.doc(userModel.useruid).update(({
      'name': NameController.text,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 60),
            child: Text(
              'Update Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffe9e0cf),
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: NameController,
                decoration: const InputDecoration(
                  hintText: "Enter New Name",
                  hintStyle: TextStyle(
                    color: Color(0xffe8e5de),
                  ),
                  fillColor: Color(0xff212121),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Color(0xffe8e5de),
                  ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: TextStyle(color: Color(0xff7f7f7f)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Color(0xffa9a9a9),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      (const Color(0xFF000000))),
                  overlayColor: MaterialStateProperty.all<Color>(
                      (const Color(0xFF202020))),
                ),
                onPressed: () async {
                  if (NameController.text.isNotEmpty) {
                    await UpdateUserName();
                  }
                }),
          )
        ],
      )),
      backgroundColor: Color(0xff303030),
    );
  }
}
