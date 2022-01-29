import 'package:flutter/material.dart';
import 'package:pocketdocket/EditUserProfile/UpdateProfile.dart';
import 'package:pocketdocket/Pages/AddTask.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/Pages/TaskDisplay.dart';
import 'package:pocketdocket/User/AddUser.dart';
import 'package:pocketdocket/User/login.dart';

class Appdrawer extends StatefulWidget {
  const Appdrawer({Key? key}) : super(key: key);

  @override
  _AppdrawerState createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            // width: (MediaQuery.of(context).size.height),
            color: const Color(0xff121212),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 45, 0, 0),
                    width: 300,
                    child: GestureDetector(
                      child: Text(userModel.fullName,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xffe8e5de),
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateProfile()));
                      },
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 7, 0, 20),
                  width: 300,
                  child: Text(userModel.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffe9e0cf),
                      ),
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 0.5,
                  width: 300,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xffe8e5de)),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(
                        width: 13,
                      ),
                      const Icon(
                        Icons.account_circle,
                        color: Color(0xff7f7f7f),
                        size: 30,
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        'Profile',
                        style: const TextStyle(
                            color: Color(0xff7f7f7f), fontSize: 18),
                      ),
                    ]),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProfile()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(
                        width: 13,
                      ),
                      const Icon(
                        Icons.task,
                        color: Color(0xff7f7f7f),
                        size: 30,
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        'Tasks',
                        style: const TextStyle(
                            color: Color(0xff7f7f7f), fontSize: 18),
                      ),
                    ]),
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TaskList()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(
                        width: 13,
                      ),
                      const Icon(
                        Icons.add_task,
                        color: Color(0xff7f7f7f),
                        size: 30,
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        'Add Task',
                        style: const TextStyle(
                            color: Color(0xff7f7f7f), fontSize: 18),
                      ),
                    ]),
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddTask()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Color(0xff7f7f7f),
                      size: 30,
                    ),
                    title: const Text(
                      'Sign Out',
                      style: TextStyle(color: Color(0xff7f7f7f), fontSize: 18),
                    ),
                    onTap: () async {
                      await signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                  ),
                )
              ],
            )));
  }
}
