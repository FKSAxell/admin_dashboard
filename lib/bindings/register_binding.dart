import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:admin_dashboard/controllers/register_form_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterFormController());
  }
}
