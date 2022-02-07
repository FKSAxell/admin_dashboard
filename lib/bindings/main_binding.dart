import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:admin_dashboard/controllers/login_form_controller.dart';
import 'package:admin_dashboard/controllers/register_form_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => LoginFormController(), fenix: true);
    Get.lazyPut(() => RegisterFormController(), fenix: true);
  }
}
