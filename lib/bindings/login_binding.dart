import 'package:admin_dashboard/controllers/login_form_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginFormController());
  }
}
