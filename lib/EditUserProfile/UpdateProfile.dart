import 'package:flutter/material.dart';
import 'package:pocketdocket/EditUserProfile/EditEmail.dart';
import 'package:pocketdocket/EditUserProfile/EditName.dart';
import 'package:flutter/gestures.dart';
import 'package:pocketdocket/EditUserProfile/EditPassword.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/User/Auth.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xff202020),
              margin: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffa9a9a9),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffe9e0cf),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xff212121),
              child: Text(
                userModel.fullName,
                style: TextStyle(color: Color(0xffffffff), fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: RichText(
                text: TextSpan(
                    text: "  Edit",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditName()));
                      },
                    style: const TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffe9e0cf),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xff212121),
              child: Text(
                userModel.email,
                style: TextStyle(color: Color(0xffffffff), fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  text: "  Edit",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => EditEmail()));
                    },
                  style: const TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffe9e0cf),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  text: "  Edit",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPassword()));
                    },
                  style: const TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          )
        ]),
      ),
      backgroundColor: Color(0xff303030),
    );
  }
}
