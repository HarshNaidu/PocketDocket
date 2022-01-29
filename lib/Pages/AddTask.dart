import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/Pages/TaskDisplay.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  DateTime? picked;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  Future AddTaskDB(String TaskName, bool isCompleted) {
    DocumentReference documentReference =
        usersCollection.doc(userModel.useruid).collection('Tasks').doc();
    return documentReference.set({
      'task': TaskName,
      'created': DateTime.now(),
      'deadline': picked,
      'id': documentReference.id,
      'Status': isCompleted
    });
  }

  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            color: Color(0xff000000),
            margin: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffa9a9a9),
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: "Enter Your Task",
                hintStyle: TextStyle(
                  color: Color(0xffe9e0cf),
                ),
                fillColor: Color(0xff212121),
                filled: true,
                prefixIcon: Icon(
                  Icons.task,
                  color: Color(0xffe9e0cf),
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
              style: TextStyle(color: Color(0xffffffff)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              child: const Text(
                'Add Date and Time',
              ),
              onPressed: () async {
                // ignore: unused_local_variable
                picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2035),
                    initialDatePickerMode: DatePickerMode.day);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>((const Color(0xFF000000))),
                overlayColor:
                    MaterialStateProperty.all<Color>((const Color(0xFFffffff))),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Add Task',
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            onPressed: () async {
              await AddTaskDB(taskController.text, false);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TaskList()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>((const Color(0xFF000000))),
              overlayColor:
                  MaterialStateProperty.all<Color>((const Color(0xFFffffff))),
            ),
          )
        ],
      )),
      backgroundColor: Color(0xff303030),
    );
  }
}
