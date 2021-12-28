import 'package:flutter/cupertino.dart';

import 'drawer.dart';
import 'header.dart';
import 'home-slider.dart';
import 'custom_colors.dart';
import 'custom_text.dart';
import 'menu.dart';
import 'responsive.dart';
import 'package:flutter/material.dart';
import 'footer.dart';
import 'shop_login.dart';
import 'package:enroute/components/light_colors.dart';

class LargeHomePage extends StatefulWidget {
  @override
  _LargeHomePageState createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();

  LargeHomePage() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kLighterGreen,
      ),
      key: keyScaffold,
      endDrawer: ResponsiveLayout.isSmallScreen(context)
          ? null
          : null,
      body: Builder(builder: (context) {
        return ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                HomeSlider(context),
              ],
            ),
            gridProductSection(context),
          ],
        );
      }),
    );
  }

  gridProductSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome Climate Hero! Use your well-deserved points.",
            style: TextStyle(
              fontFamily: "Bryndan",
              color: LightColors.kMyFavGreen,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            height: 2,
            width: 100,
            color: LightColors.kMyFavGreen,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getGridCount(context),
                      childAspectRatio: 1.3),
                  itemBuilder: (context, position) {
                    return gridProductItem();
                  },
                  itemCount: 8,
                  shrinkWrap: true,
                  primary: false,
                ),
                flex: 80,
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  getGridCount(context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return 1;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  gridProductItem() {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage("banner/bike.jpg"),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Ride a bike",
                  style: CustomTextStyle.boldTextStyle,
                ),
                margin: EdgeInsets.only(left: 8),
              ),
              Container(
                child: Text("5 points", style: CustomTextStyle.regularTextStyle),
                margin: EdgeInsets.only(right: 8),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Eco-travel agency",
              style: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.grey, fontSize: 14),
            ),
            margin: EdgeInsets.only(left: 8),
          ),
        ],
      ),
    );
  }
}
