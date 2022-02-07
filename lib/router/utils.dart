import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;

bool redirect(String routeName) {
  final authController = Get.find<AuthController>();
  // final sideBarProvider = Get.find<SideBarProvider>();
  print("Ruta: $routeName");
  if (authController.authStatus.value == AuthStatus.notAuthenticated) {
    print("true");
    // html.window.history.replaceState(null, 'none', '#/${routeName}');
    return true;
  } else {
    print("false");
    // sideBarProvider.setCurrentPageUrl(routeName);
    return false;
  }
}
