import 'package:flutter/material.dart';
class ValidationProvider with ChangeNotifier {
  bool nameVal = true;
  String nameValError = "";
  bool emailVal = true;
  String emailValError = "";
  bool? passVal;
  String passValError = "";
  bool? cpVal;
  String cpValError = "";
  bool? phNoVal;
  String phNoValError = "";
  bool? validate;
  String validateError = "";
  nameValidity (String name){
    name.length < 4 ? nameValError = "Name should be atleast 4 characters long!" : nameValError = "" ;
      notifyListeners();
  }
  emailValidity (String email){
    emailVal = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    emailVal ? emailValError = "" : emailValError = "Enter a valid email address!" ;
      notifyListeners();
  }
  passwordValidity (String password){
    password.length < 8 ? passValError = "Password should be atleast 8 characters long!": passValError = "";
      notifyListeners();
  }
  confirmPasswordValidity (String password,String confirmPassword){
    password != confirmPassword ? cpValError = "The passwords do not match!" : cpValError = "";
      notifyListeners();
  }
  phoneNumberValidity (String phNo){
    phNo.length > 10 ? phNoValError = "The phone number is too long!" : phNoValError = "";
    notifyListeners();
  }
  regButtonValidity (String name,String email, String password, String confirmPassword){
    emailVal = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(name.length < 4 || emailVal == false || password.length < 8 || password!=confirmPassword){
      validateError = "Please enter the details correctly!";
      notifyListeners();
      return false;
    }else{
      validateError = "";
      notifyListeners();
      return true;
    }
  }
} 