import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Pages/HomeScreen.dart';
import 'package:pocketdocket/Providers/ValidationProvider.dart';
import 'package:pocketdocket/User/AddUser.dart';
import 'package:pocketdocket/User/login.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController = TextEditingController();

  @override
  void initState() {
    nameInputController = TextEditingController();
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
    confirmPasswordInputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidationProvider> (context);
    double widthBtn = ((MediaQuery.of(context).size.width) / 2) - 80;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: const Text(
                  "Sign Up",
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
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: const Text(
                          "Full Name",
                          style: TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        width: double.infinity,
                                              ),
                      Container(
                                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: Text(
                                                provider.nameValError.toString(),
                                                style: const TextStyle(
                                                  color: Color(0xff800000),
                                                  fontSize: 13,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
              ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: nameInputController,
                            decoration: const InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                color: Color(0xffe8e5de),
                              ),
                              fillColor: Color(0xff212121),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person_outline_outlined,
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
                            style: const TextStyle(color: Color(0xffffffff)),
                            onChanged: (val){
                              provider.nameValidity(val);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(45, 15, 0, 0),
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
                      Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                            provider.emailValError.toString(),
                            style: const TextStyle(
                            color: Color(0xff800000),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                            style: const TextStyle(color: Color(0xffffffff)),
                            onChanged: (val){
                              provider.emailValidity(val);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(45, 15, 10, 0),
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
                      Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                            provider.passValError.toString(),
                            style: const TextStyle(
                            color: Color(0xff800000),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: passwordInputController,
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
                            style: const TextStyle(color: Color(0xffffffff)),
                            onChanged: (val){
                              provider.passwordValidity(val);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                        child: const Text(
                          "Confirm Password",
                          style: TextStyle(
                            color: Color(0xffe9e0cf),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        width: double.infinity,
                      ),
                      Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                            provider.cpValError.toString(),
                            style: const TextStyle(
                            color: Color(0xff800000),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 45),
                          child: TextField(
                            controller: confirmPasswordInputController,
                            decoration: const InputDecoration(
                              hintText: "Confirm Password",
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
                            style: const TextStyle(color: Color(0xffffffff)),
                            onChanged: (val){
                              provider.confirmPasswordValidity(passwordInputController.text, val);
                            },
                          ),
                        ),
                      ),
                      Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                            provider.validateError.toString(),
                            style: const TextStyle(
                            color: Color(0xff800000),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (provider.regButtonValidity(nameInputController.text,emailInputController.text,passwordInputController.text,confirmPasswordInputController.text)){
                            UserCredential user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: passwordInputController.text);
                            await DBS().updateUserData(
                                nameInputController.text,
                                emailInputController.text,
                                passwordInputController.text,
                                user.user!.uid.toString());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: widthBtn - 4),
                          child: const Text(
                            "Register",
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
                      ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have an Account?",
                      style: TextStyle(
                        color: Color(0xffe9e0cf),
                        fontSize: 14,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "  Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
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
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF303030),
    );
  }
}
