import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'scale_route.dart';
import 'style.dart';
import 'add_task.dart';
import 'package:intl/intl.dart';
import 'package:enroute/screens/combination_landing.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nice_button/nice_button.dart';
import 'package:animated_button/animated_button.dart';
import 'package:enroute/screens/make-your-daily-combination.dart';
import 'light_colors.dart';
import 'picture_combo.dart';

class Landing extends StatefulWidget {
  static String tag = "landing";
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {

  int currentTab = 0;
  Home pageOne = new Home();
  AddTask pageTwo = new AddTask();
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = [
      pageOne,
      pageTwo,
    ];
    currentPage = pageOne;
  }

  Widget appBarTitle = Text('${DateFormat('d MMM yyyy').format(DateTime.now())}',
    style:  smallAddressWhite(),
  );
  Icon actionIcon = new Icon(Icons.search);
  final key = new GlobalKey<ScaffoldState>();
//  bool _IsSearching;
//  String _searchText = "";


//  void _searchPressed() {
//
//    setState(() {
//      if (this.actionIcon.icon == Icons.search) {
//        this.actionIcon = new Icon(Icons.close);
//        this.appBarTitle = new TextField(
//          style: new TextStyle(
//            color: Colors.white,
//          ),
//          decoration: new InputDecoration(
//              prefixIcon: new Icon(Icons.search, color: Colors.white, size: 14.0,),
//              hintText: "Search...",
//              hintStyle: subTitleWhite(),
//          ),
//        );
//        _handleSearchStart();
//      }
//      else {
//        _handleSearchEnd();
//      }
//    });
//  }

//  void _handleSearchStart() {
//    setState(() {
//      _IsSearching = true;
//    });
//  }
//
//  void _handleSearchEnd() {
//    setState(() {
//      this.actionIcon = new Icon(Icons.search, color: Colors.white,);
//      this.appBarTitle =
//          Text('${DateFormat('d MMM yyyy').format(DateTime.now())}',
//            style:  smallAddressWhite(),
//          );
//      _IsSearching = false;
//      _searchQuery.clear();
//    });
//  }


  Widget buildBar(BuildContext context) {
    return AppBar(
        title:  appBarTitle,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFD0FFBC),
        actions: <Widget>[
//           IconButton(
//             icon: Icon(FontAwesomeIcons.search, color: Colors.white, size: 14.0,),
//             onPressed: _searchPressed,
//           ),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
      backgroundColor: bgGrey,
      body: currentPage,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: LightColors.kMyFavGreen,
              ),
            ),
            child: Center(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon (Icons.monetization_on, color: LightColors.kMyFavGreen,),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("Claim your point", style: TextStyle(
                              fontFamily: "Bryndan"
                          ),),
                          content: Text("After performing the combination, this is how you would be able to claim your point.",style:
                          TextStyle(fontFamily:"Bryndan")
                            ,),
                          actions: <Widget>[

                            CupertinoDialogAction(
                              child: Text("Receive my point", style: TextStyle(fontFamily: "Bryndan"),),
                              onPressed: () {
                                showDialog(context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                    content: Text("Your point is active in the EnRoute Online Shop.",style: TextStyle(
                                      fontFamily: "Bryndan",
                                    ),),
                                  ),
                                );
                              },

                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedButton(
            color: Color(0xFFD0FFBC),
            width: 250,
            height: 60,
            child: Text(
              'Make your daily combination',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF06630b),
                fontWeight: FontWeight.w500,
                fontFamily: "Bryndan"
              ),
            ),
            onPressed: () {
              Navigator.push(context, ScaleRoute(page: CalendarPage()));
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
              elevation: 6.0,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 26.0,
              ),
              backgroundColor: Color(0xFF06630b),
              mini: false,
              highlightElevation: 16.0,
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: YoutubeApp()));
//            Navigator.of(context).pushNamed(AddTask.tag);
              }),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: currentTab,
//        onTap: (int numTab) {
//          setState(() {
//            print("Current tab: " + numTab.toString());
//            currentTab = numTab;
//            currentPage = pages[numTab];
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text("Home"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.add_circle),
//            title: Text("Add Task"),
//          ),
//        ],
//      ),
    );
  }
}
