import 'package:enroute/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 90.0,
                color: Color(0XFF117C12),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 14.0,
          height: 15.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF06630b),
                  fontSize: 20.0,
                  fontFamily: "Bryndan"
              ),
            ),
          ],
        ),
      ],
    );
  }
}
