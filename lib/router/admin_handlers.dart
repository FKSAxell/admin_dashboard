import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:admin_dashboard/router/utils.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/router/routes.dart';

class AdminHandlers {
  static Widget Function() login = () {
    return Obx(() => redirect("") ? LoginView() : DashboardView());
  };
  static Widget Function() register = () {
    return Obx(() => redirect("") ? RegisterView() : DashboardView());
  };
}
