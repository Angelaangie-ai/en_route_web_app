import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:enroute/components/navigation_bloc.dart';
import 'package:enroute/screens/combination_landing.dart';
import 'package:enroute/screens/combo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'package:enroute/constants.dart';
import '../components/reusable_card.dart';
import '../components/buttom_botton.dart';
import '../components/round_icon_button.dart';
import 'package:enroute/calculator_brain.dart';
import '2ndscreen.dart';
import 'package:enroute/screens/registration_screen.dart';
import '3rdscreen.dart';
import '4thscreen.dart';
import 'targets_screen.dart';
import 'shop_screen.dart';
import 'combinatioon_screen.dart';
import 'package:enroute/screens/combination_landing.dart';
import 'package:enroute/components/landing.dart';
import 'package:enroute/screens/scanning.dart';
import 'social_challenges.dart';
import 'package:enroute/components/social_home_screen.dart';
import 'restaurant_page.dart';
import 'edu-screen.dart';
import 'point_shop.dart';
import 'package:enroute/online_shop/shop_home.dart';


class HomePage extends StatefulWidget {
  String name;
  HomePage({this.name});
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState(name);
}

class _HomePageState extends State<HomePage> {
  String name;
  _HomePageState(this.name);
  int height = 180;
  int weight = 60;
  int age = 13;


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height:40.0),
          Text("Hi there, Planet Hero!",
            style: TextStyle(
              color: Color(0xFF06630b),
                fontSize: 30.0,
              fontFamily: "Bryndan"
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text("How do you want to help Planet Earth?",
              style: TextStyle(
                color: Color(0xFF06630b),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Bryndan"
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(120.0,0,120.0,0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Landing()),
                        );
                      },
                      colour: kActiveClassColour,
                      cardChild: IconContent(
                          icon: Icons.directions_bike,
                        label: ("Make your daily combination"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScanPage()),
                        );
                      },
                      colour: kActiveClassColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.shoppingBag,
                          label: "Sustainable clothes",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(120.0,0,120.0,0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FitnessAppHomeScreen()),
                        );
                      },
                      colour:kActiveClassColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.twitter,
                        label: "Social Challenges",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      colour: kActiveClassColour,
                      cardChild: IconContent(
                          icon: Icons.fastfood,
                          label: "Sustainable Food",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(120.0,0,120.0,0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EduApp()),
                        );
                      },
                      colour: kActiveClassColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.book,
                        label: "Climate-Action Education",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeS()),
                        );
                      },
                      colour: kActiveClassColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.store,
                          label: "EnRoute Online Shop",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
