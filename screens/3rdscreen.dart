import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_buttons/social_buttons.dart';
import 'package:enroute/components/social_theme.dart';
import 'package:enroute/components/social_main.dart';
import 'package:flutter/material.dart';
import 'package:popup_box/popup_box.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:enroute/components/buttom_botton.dart';
import 'package:enroute/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:share_content_facebook/share_content_facebook.dart';
import 'package:enroute/components/light_colors.dart';




class MealsListView extends StatefulWidget {
  const MealsListView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _MealsListViewState createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }
  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  ScreenshotController screenshotController = ScreenshotController();

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 216,
              width: 50,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {

                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / 5) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: ()  {

                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: SizedBox(
                                  width: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, left: 8, right: 8, bottom: 16),
                                        child: GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    offset: const Offset(1.1, 4.0),
                                                    blurRadius: 8.0),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0XFF1877F2),
                                                  Colors.white,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 54, left: 16, right: 16, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Facebook",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Bryndan",
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      color: FitnessAppTheme.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 8, bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Post on profile",
                                                            style: TextStyle(
                                                              fontFamily: FitnessAppTheme.fontName,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                              color: FitnessAppTheme.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FitnessAppTheme.nearlyWhite,
                                                      shape: BoxShape.circle,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: FitnessAppTheme.nearlyBlack
                                                                .withOpacity(0.4),
                                                            offset: Offset(8.0, 8.0),
                                                            blurRadius: 8.0),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: HexColor('#FFFFFF'),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 8,
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset('assets/icons/facebook.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onDoubleTap: () async {
                          await PopupBox.showPopupBox(context: context,
                            willDisplayWidget: Column(
                              children: <Widget>[
                          RaisedButton(
                          onPressed: _launchURL,
                            child: Text('Make a Facebook Post', style:
                            TextStyle(
                              fontFamily: "Bryndan",
                              color: LightColors.kMyFavGreen,
                            ),),),

                              ],
                            ),
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: LightColors.kMyFavGreen,
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 15,
                                fontFamily: "Bryndan"),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: ()  {
                          PopupBox.showPopupBox(
                            context: context,
                            button: ButtonBar(),
                            willDisplayWidget: Column(
                              children: <Widget>[
                              ],
                            ),
                          );
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: SizedBox(
                                  width: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, left: 8, right: 8, bottom: 16),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    offset: const Offset(1.1, 4.0),
                                                    blurRadius: 8.0),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Colors.white,
                                                  Color(0XFFC13584),
                                                  Color(0XFF833AB4),
                                                  Color(0XFF5851DB),
                                                  Color(0XFFFD1D1D),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 54, left: 16, right: 16, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Instagram",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Bryndan",
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      color: FitnessAppTheme.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 8, bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Story on profile",
                                                            style: TextStyle(
                                                              fontFamily: FitnessAppTheme.fontName,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                              color: FitnessAppTheme.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FitnessAppTheme.nearlyWhite,
                                                      shape: BoxShape.circle,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: FitnessAppTheme.nearlyBlack
                                                                .withOpacity(0.4),
                                                            offset: Offset(8.0, 8.0),
                                                            blurRadius: 8.0),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: HexColor('#FFFFFF'),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 8,
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset('assets/icons/Instagram.png.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onDoubleTap: () async {
                          await PopupBox.showPopupBox(context: context,
                            willDisplayWidget: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed:_launchURL1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Post an Instagram Story",
                                      style: TextStyle(
                                        color: LightColors.kMyFavGreen,
                                        fontFamily: "Bryndan",
                                      ),),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: LightColors.kMyFavGreen,
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 15,fontFamily: "Bryndan"),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: ()  {
                          PopupBox.showPopupBox(
                            context: context,
                            button: ButtonBar(),
                            willDisplayWidget: Column(
                              children: <Widget>[
                              ],
                            ),
                          );
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: SizedBox(
                                  width: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, left: 8, right: 8, bottom: 16),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    offset: const Offset(1.1, 4.0),
                                                    blurRadius: 8.0),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0XFF1DA1F2),
                                                  Colors.white,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 54, left: 16, right: 16, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Twitter",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Bryndan",
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      color: FitnessAppTheme.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 8, bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Tweet",
                                                            style: TextStyle(
                                                              fontFamily: FitnessAppTheme.fontName,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                              color: FitnessAppTheme.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FitnessAppTheme.nearlyWhite,
                                                      shape: BoxShape.circle,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: FitnessAppTheme.nearlyBlack
                                                                .withOpacity(0.4),
                                                            offset: Offset(8.0, 8.0),
                                                            blurRadius: 8.0),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: HexColor('#FFFFFF'),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 8,
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset('assets/icons/twitter.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onDoubleTap: () async {
                          await PopupBox.showPopupBox(context: context,
                            willDisplayWidget: Column(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('Share on Twitter', style: TextStyle(
                                    fontFamily: "Bryndan",
                                    color: LightColors.kMyFavGreen,
                                  ),),
                                  onPressed: _launchURL2,
                                ),
                              ],
                            ),
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: LightColors.kMyFavGreen,
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 15,
                                fontFamily: "Bryndan",
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: ()  {
                          PopupBox.showPopupBox(
                            context: context,
                            button: ButtonBar(),
                            willDisplayWidget: Column(
                              children: <Widget>[
                              ],
                            ),
                          );
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: SizedBox(
                                  width: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, left: 8, right: 8, bottom: 16),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    offset: const Offset(1.1, 4.0),
                                                    blurRadius: 8.0),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0XFF25D366),
                                                  Color(0XFF075E54)

                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 54, left: 16, right: 16, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "What'sapp",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Bryndan",
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      color: FitnessAppTheme.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 8, bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Send a message",
                                                            style: TextStyle(
                                                              fontFamily: FitnessAppTheme.fontName,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                              color: FitnessAppTheme.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FitnessAppTheme.nearlyWhite,
                                                      shape: BoxShape.circle,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: FitnessAppTheme.nearlyBlack
                                                                .withOpacity(0.4),
                                                            offset: Offset(8.0, 8.0),
                                                            blurRadius: 8.0),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: HexColor('#FFFFFF'),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 8,
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset('assets/icons/what.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onDoubleTap: () async {
                          await PopupBox.showPopupBox(context: context,
                            willDisplayWidget: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: _launchURL3,
                                  child: Text("Send a message on What'sapp",style: TextStyle(
                                    color: LightColors.kMyFavGreen,
                                    fontFamily:"Bryndan"
                                  ),),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: LightColors.kMyFavGreen,
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 15,
                                fontFamily:"Bryndan"
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: ()  {
                          PopupBox.showPopupBox(
                            context: context,
                            button: ButtonBar(),
                            willDisplayWidget: Column(
                              children: <Widget>[
                              ],
                            ),
                          );
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: SizedBox(
                                  width: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, left: 8, right: 8, bottom: 16),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    offset: const Offset(1.1, 4.0),
                                                    blurRadius: 8.0),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.red,
                                                  Colors.white,

                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 54, left: 16, right: 16, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "System",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Bryndan",
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      color: FitnessAppTheme.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 8, bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Share!",
                                                            style: TextStyle(
                                                              fontFamily: FitnessAppTheme.fontName,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                              color: FitnessAppTheme.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FitnessAppTheme.nearlyWhite,
                                                      shape: BoxShape.circle,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: FitnessAppTheme.nearlyBlack
                                                                .withOpacity(0.4),
                                                            offset: Offset(8.0, 8.0),
                                                            blurRadius: 8.0),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: HexColor('#FFFFFF'),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 8,
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset('assets/icons/share_icon.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onDoubleTap: () async {
                          await PopupBox.showPopupBox(context: context,
                            willDisplayWidget: Column(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('Choose a place to share',style: TextStyle(
                                    fontFamily:"Bryndan",
                                    color: LightColors.kMyFavGreen,
                                  ),),
                                  onPressed: () async {
                                    var response = await FlutterShareMe().shareToSystem(msg: "I saved 10 kg carbon footprint with EnRoute");
                                    if (response == 'success') {
                                      print('navigate success');
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: LightColors.kMyFavGreen,
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 15,
                                fontFamily: "Bryndan",
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

_launchURL() async {
  const url = 'https://www.facebook.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  const url = 'https://www.instagram.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://twitter.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://www.whatsapp.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}