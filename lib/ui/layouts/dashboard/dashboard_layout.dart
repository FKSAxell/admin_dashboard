import 'package:admin_dashboard/controllers/sidemenu_controller.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  @override
  void initState() {
    super.initState();
    SideMenuController.menuController =
        new AnimationController(vsync: this, duration: 300.milliseconds);
  }

  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              //TODO: ESTO DEPENDE SI ES MAS DE 700PX
              if (size.width >= 700) SideBar(),

              Expanded(
                child: Column(
                  children: [
                    NavBar(),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuController.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SideMenuController.isOpen)
                    Opacity(
                      opacity: SideMenuController.opacity.value,
                      child: GestureDetector(
                        onTap: () => SideMenuController.closeMenu(),
                        child: Container(
                          color: Colors.black26,
                          width: size.width,
                          height: size.height,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuController.movement.value, 0),
                    child: SideBar(),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
