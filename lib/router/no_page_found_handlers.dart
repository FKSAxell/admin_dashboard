import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:flutter/material.dart';

class NoPageFoundHandlers {
  static Widget Function() noPageFound = () {
    print("nofound");
    return NoPageFoundView();
  };
}
