import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        _DesktopBody()
        //Desktop

        //Mobile

        //Links
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          //Twitter Background
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),

          //View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            // child: , //TODO: lA VISTA
          )
        ],
      ),
    );
  }
}
