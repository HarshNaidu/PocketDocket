import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocketdocket/Providers/ValidationProvider.dart';
import 'package:pocketdocket/User/login.dart';
import 'package:pocketdocket/User/signup.dart';
import 'package:provider/provider.dart';

class PhAuth extends StatefulWidget {
  const PhAuth({Key? key}) : super(key: key);
  @override
  _PhAuthState createState() => _PhAuthState();
}

class _PhAuthState extends State<PhAuth> {
  TextEditingController phNoInputController = TextEditingController();
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidationProvider> (context);
    double widthBtn = ((MediaQuery.of(context).size.width) / 2) - 80;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: const Text(
                  "Sign In using Phone Number",
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
                          "Phone Number",
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
                                                provider.phNoValError.toString(),
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                          child: TextField(
                            controller: phNoInputController,
                            decoration: const InputDecoration(
                              hintText: "Enter Your Phone Number",
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
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Color(0xffFFFFFF)),
                            onChanged: (val){
                              provider.phoneNumberValidity(val);}
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                            },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: const Text(
                            "Submit OTP",
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
                margin: const EdgeInsets.fromLTRB(0, 350, 0, 0),
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
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF303030),
    );
  }
}
