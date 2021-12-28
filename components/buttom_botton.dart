import 'package:flutter/material.dart';
import '../constants.dart';

class ButtomBotton extends StatelessWidget {

  ButtomBotton({this.label, this.onTap});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(


        padding: EdgeInsets.only(bottom:1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color(0xFF06630b),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        child: Center(
          child: Text(label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: "Bryndan"
            ),
            ),
          ),
        ),
      );
  }
}
