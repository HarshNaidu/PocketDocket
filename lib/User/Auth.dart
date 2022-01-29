import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocketdocket/User/login.dart';
import 'package:pocketdocket/User/signup.dart';

class DBS {
  final String uid;
  DBS({required this.uid});

  // ignore: non_constant_identifier_names
  final CollectionReference UserDB =
      FirebaseFirestore.instance.collection('Users');

  // ignore: non_constant_identifier_names
  Future AddUsers(String name, String email, String password) async {
    return await UserDB.add({
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
    });
  }
}

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  _UserAuthstate createState() => _UserAuthstate();
}

class _UserAuthstate extends State<UserAuth> {
  @override
  initState() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Signup()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())
            // ignore: avoid_print
            ).catchError((err) => print(err));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const Text("Loading..."),
        ),
      ),
    );
  }
}
