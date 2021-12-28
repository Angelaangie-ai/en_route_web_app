import 'package:enroute/components/light_colors.dart';
import 'package:enroute/screens/scanning.dart';
import 'package:flutter/material.dart';
import 'package:enroute/components/constants_scan.dart';
import 'package:enroute/components/scan_home_components_body.dart';
import 'home_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: LightColors.kMyFavGreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Body(),
    );
  }
}
