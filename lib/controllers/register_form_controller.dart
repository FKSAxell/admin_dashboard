import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String name = "";
  String email = "";
  String password = "";

  validateForm() {
    print("$name  $email  $password");
    if (formKey.currentState!.validate()) {}
  }
}
