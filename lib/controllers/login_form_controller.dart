import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginFormController extends GetxController {
  late GlobalKey<FormState> formKey;

  String email = "";
  String password = "";
  @override
  void onInit() {
    super.onInit();
    formKey = new GlobalKey<FormState>();
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      print("$email  $password");

      return true;
    } else {
      return false;
    }
  }
}
