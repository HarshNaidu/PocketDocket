import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBS {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  Future updateUserData(
      String name, String email, String password, String uid) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
    });
  }
}

class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String useruid;

  UserModel({
    required this.email,
    required this.password,
    required this.useruid,
    required this.fullName,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      email: doc['email'],
      password: doc['password'],
      useruid: doc['uid'],
      fullName: doc['name'],
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signOut() async {
  await _auth.signOut();
}
