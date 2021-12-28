import 'point_colors.dart';
import 'point_colors.dart';
import 'point_bottom_app_bar_button.dart';
import 'package:flutter/material.dart';
import 'light_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  // BOTTOM APPBAR PROPERTIES
  static const double height = 75.0;
  static const double borderRadius = 15.0;
  static const double blurRadius = 25.0;

  // BUTTONS PROPERTIES
  // HOME
  static const String homeTitle = 'HOME';
  static const String homeImageOn = 'assets/images/home_on.png';
  static const String homeImageOff = 'assets/images/home_off.png';
  // CART
  static const String cartTitle = 'CART';
  static const String cartImageOn = 'assets/images/c'
      'art_on.png';
  static const String cartImageOff = 'assets/images/cart_off.png';
  // ADD
  static const String addImage = 'assets/images/add.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: LightColors.kLighterGreen,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          topLeft: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: blurRadius),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAppBarButton(
            index: 0,
            title: homeTitle,
            imageActivated: homeImageOn,
            imageDeactivated: homeImageOff,
          ),
          BottomAppBarButton(
            index: 1,
            title: '',
            imageActivated: addImage,
            imageDeactivated: addImage,
          ),
          BottomAppBarButton(
            index: 2,
            title: cartTitle,
            imageActivated: cartImageOn,
            imageDeactivated: cartImageOff,
          ),
        ],
      ),
    );
  }
}
