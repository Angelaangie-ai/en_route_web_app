import 'package:enroute/components/light_colors.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final text;
  final bool isCart;
  HeaderText({this.text, this.isCart = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 45, 30, 30),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Bryndan",
          color: LightColors.kLighterGreen,
        ),
      ),
    );
  }
}
