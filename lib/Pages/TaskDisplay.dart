import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Pages/AddTask.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        title: const Text(
          "Tasks",
          style: TextStyle(color: Color(0xffe8e5de)),
        ),
      ),
      backgroundColor: const Color(0xff303030),
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(userModel.useruid)
              .collection("Tasks")
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData) {
              if (snapshot.data.docs.length > 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topRight: const Radius.circular(40),
                                  topLeft: const Radius.circular(40),
                                )),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    color: Color(0xff212121),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: snapshot.data.docs[index]
                                                    ['Status'],
                                                onChanged: (val) async {
                                                  FirebaseFirestore.instance
                                                      .collection('Users')
                                                      .doc(userModel.useruid)
                                                      .collection("Tasks")
                                                      .doc(snapshot.data
                                                          .docs[index]['id'])
                                                      .update(({
                                                        'Status': snapshot.data
                                                                    .docs[index]
                                                                ['Status']
                                                            ? false
                                                            : true
                                                      }));
                                                }),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Task : ' +
                                                  snapshot.data.docs[index]
                                                      ['task'],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: snapshot.data.docs[index]
                                                        ['Status']
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Created on : ' +
                                                  formatTimestamp(snapshot.data
                                                      .docs[index]['created']
                                                      .toDate()),
                                              style: TextStyle(
                                                  color: Color(0xffe8e5de),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Deadline : ' +
                                                  formatTimestamp(snapshot.data
                                                      .docs[index]['deadline']
                                                      .toDate()),
                                              style: TextStyle(
                                                  color: Color(0xffe8e5de),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Text("Data doesn't exist");
              }
            } else {
              return const Text("No data found");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff000000),
        splashColor: const Color(0xffffffff),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Color(0xffe8e5de),
        ),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
      ),
    );
  }

  String formatTimestamp(DateTime date) {
    String returnData =
        "${date.day.toString()}-${date.month.toString()}-${date.year.toString()} ${date.hour.toString()}:${date.minute.toString()}";
    return returnData;
  }
}

class Task extends StatelessWidget {
  final int TaskNo;
  Task(this.TaskNo);
  @override
  Widget build(BuildContext context) {
    CollectionReference TaskDB = FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.useruid)
        .collection('Tasks');

    return FutureBuilder<DocumentSnapshot>(
      future: TaskDB.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const Text("loading");
      },
    );
  }
}
