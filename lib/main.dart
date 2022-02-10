import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:admin_dashboard/bindings/main_binding.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await LocalStorage.configureStorage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: "/",
      unknownRoute: Routes.unknownRoute,
      getPages: Routes.pages,
      navigatorKey: Get.key,
      initialBinding: MainBinding(),
      builder: (_, child) {
        AuthController authCtrl = Get.find<AuthController>();
        return Obx(
          () {
            if (authCtrl.authStatus.value == AuthStatus.checking) {
              return SplashLayout();
            }
            if (authCtrl.authStatus.value == AuthStatus.authenticated) {
              return DashboardLayout(child: child!);
            } else {
              return AuthLayout(child: child!);
            }
          },
        );
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
