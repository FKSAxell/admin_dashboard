import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:flutter/material.dart';

class AdminHandlers {
  static Widget Function() login = () {
    return LoginView();
  };
  static Widget Function() register = () {
    return RegisterView();
  };
}
