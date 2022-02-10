import 'package:admin_dashboard/controllers/sidemenu_controller.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //TODO: ICONO DEL MENU
          if (size.width < 700)
            IconButton(
                onPressed: () => SideMenuController.openMenu(),
                icon: Icon(Icons.menu_outlined)),

          SizedBox(width: 5),
          //SEARCH INPUT
          if (size.width > 390)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),
          Spacer(),
          NotificationIndicator(),
          SizedBox(width: 10),
          NavBarAvatar(),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 5),
    ]);
  }
}
