import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = '';
  var password = '';

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else {
      email = value;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else {
      password = value;
    }
    return null;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      if (email == 'insee' && password == 'insee') {
        // TODO: Add login logic here

        // Navigate to the home page after successful login
        Get.offAllNamed('/home');
      } else {
        // Show an error message if the email or password is incorrect
        Get.showSnackbar(const GetSnackBar(
          title: 'Error',
          message: 'Invalid email or password',
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
}
