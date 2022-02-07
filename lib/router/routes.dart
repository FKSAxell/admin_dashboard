import 'package:admin_dashboard/bindings/login_binding.dart';
import 'package:admin_dashboard/bindings/register_binding.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:admin_dashboard/router/utils.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Routes {
  //root
  static const String ROOTROUTE = '/';

  //auth
  static const String LOGINROUTE = '/auth/login';
  static const String REGISTERROUTE = '/auth/register';

  //dashboard
  static const String DASHBOARDROUTE = '/dashboard';

  //No Page Found
  static const String NOPAGEFOUND = "/nopagefound";
  static List rutas = ['/', '/auth/login', '/auth/register', '/dashboard'];

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: LOGINROUTE,
      page: AdminHandlers.login,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
      // binding: LoginBinding(),
    ),
    GetPage(
      name: REGISTERROUTE,
      page: AdminHandlers.register,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
      // binding: RegisterBinding(),
    ),
    GetPage(
      name: DASHBOARDROUTE,
      page: DashboardHandlers.dashboard,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
      // binding: RegisterBinding(),
    ),
    GetPage(
      name: ROOTROUTE,
      page: () {
        if (rutas.contains(Get.currentRoute)) {
          return AdminHandlers.login();
        }
        return NoPageFoundView();
      },
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
      // binding: LoginBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: NOPAGEFOUND,
    page: NoPageFoundHandlers.noPageFound,
    transition: Transition.noTransition,
    transitionDuration: 0.milliseconds,
  );
}
