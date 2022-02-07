import 'package:admin_dashboard/services/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:universal_html/html.dart' as html;

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthController extends GetxController {
  RxString _token = "".obs;
  Rx<AuthStatus> authStatus = AuthStatus.checking.obs;

  @override
  void onInit() {
    super.onInit();
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: PETICION HTTP
    _token.value = "ASDASDASDADA";
    LocalStorage.storage.write('token', _token.value);
    authStatus.value = AuthStatus.authenticated;
    html.window.history.replaceState(null, 'none', '#${Routes.DASHBOARDROUTE}');
    //TODO: NAVEGAR AL DASHBOARD
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.storage.read('token');
    print("isLoggedIn $token");
    if (token == null) {
      authStatus.value = AuthStatus.notAuthenticated;

      return false;
    }

    //TODO: ir al backend await this.logout();
    await Future.delayed(1000.milliseconds);
    authStatus.value = AuthStatus.authenticated;

    return true;
  }

  Future logout() async {
    return await LocalStorage.storage.remove('token');
  }
}
