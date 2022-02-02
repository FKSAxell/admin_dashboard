import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:flutter/cupertino.dart';
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

  static final pages = [
    GetPage(
      name: ROOTROUTE,
      page: AdminHandlers.login,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
    ),
    GetPage(
      name: LOGINROUTE,
      page: AdminHandlers.login,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
    ),
    GetPage(
      name: REGISTERROUTE,
      page: AdminHandlers.register,
      transition: Transition.fade,
      transitionDuration: 250.milliseconds,
    ),
  ];

  static final unknownRoute = GetPage(
    name: NOPAGEFOUND,
    page: NoPageFoundHandlers.noPageFound,
    transition: Transition.noTransition,
    transitionDuration: 0.milliseconds,
  );
}
