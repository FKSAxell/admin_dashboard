import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            "Blank View",
            style: CustomLabels.h1,
          ),
          WhiteCard(
            title: "Sales Statistics",
            child: Text("Hola Mundo"),
          )
        ],
      ),
    );
  }
}
