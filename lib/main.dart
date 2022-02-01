import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: AppPages.ROOTROUTE,
      unknownRoute: AppPages.unknownRoute,
      getPages: AppPages.pages,
      navigatorKey: Get.key,
      builder: (_, child) {
        return AuthLayout();
      },
    );
  }
}
