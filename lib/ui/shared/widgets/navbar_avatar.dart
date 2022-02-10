import 'package:flutter/material.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
          "https://media-exp1.licdn.com/dms/image/C4D03AQH-KYpCgtnIVw/profile-displayphoto-shrink_800_800/0/1627017375163?e=1649894400&v=beta&t=u-vaZMPd6Njc_vAgby6BxNsezEyzxAfkv6UCn1Kqa8A",
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
