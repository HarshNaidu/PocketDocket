import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/Providers/ValidationProvider.dart';
import 'package:pocketdocket/User/PhoneAuth.dart';
import 'package:pocketdocket/User/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthBtn = ((MediaQuery.of(context).size.width) / 2) - 80;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xffe8e5de),
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 7),
                        child: const Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        width: double.infinity,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                            controller: emailInputController,
                            decoration: const InputDecoration(
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(
                                color: Color(0xffe8e5de),
                              ),
                              fillColor: Color(0xff212121),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xffe8e5de),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            style: TextStyle(color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 7),
                        child: const Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        width: double.infinity,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                            controller: passwordInputController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(
                                color: Color(0xffe8e5de),
                              ),
                              fillColor: Color(0xff212121),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: Color(0xffe8e5de),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            style: TextStyle(color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        width: double.infinity,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: passwordInputController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } catch (e) {
                            // ignore: avoid_print
                            print(e.toString());
                            const Text(
                              "Email or Password is incorrect",
                              style: TextStyle(color: Colors.red),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: widthBtn),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: Color(0xffe8e5de),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              (const Color(0xFF000000))),
                          overlayColor: MaterialStateProperty.all<Color>(
                              (const Color(0xFFffffff))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                margin: const EdgeInsets.fromLTRB(0, 200, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(
                        color: Color(0xffe9e0cf),
                        fontSize: 14,
                      ),
                    ),
                    // ignore: unnecessary_const
                    RichText(
                      text: TextSpan(
                          text: "  Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeNotifierProvider(
                                        create: (BuildContext context)=> ValidationProvider(),
                                        child: const Signup(),
                                        )
                                      )
                                      ); 
                            },
                          style: const TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ],
                ),
                width: double.infinity,
              ),
              RichText(
                      text: TextSpan(
                          text: "Sign-in using Phone Number",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeNotifierProvider(
                                        create: (BuildContext context)=> ValidationProvider(),
                                        child: const PhAuth(),
                                        )
                                      )
                                      ); 
                          style: const TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          );
                          }),
                    ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF303030),
    );
  }
}
