import 'package:flutter/material.dart';
import 'package:enroute/components/style.dart';
import 'package:enroute/components/get_task_Details.dart';
import 'package:enroute/components/get_priority_dask.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:enroute/components/get_completed_Task.dart';
import 'package:enroute/components/crud.dart';
import 'package:enroute/components/fadein_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  static String tag = "home";
  final String added;
  Home({Key key, this.added}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  crudMedthods crudObj = new crudMedthods();
  var tasks;

  @override

  void initState() {
    super.initState();
    userInfo();
  }

  var userName, email, photoUrl, uid, emailVerified;
  var fbUser, fbEmail, fbProfile, fbId;
  var twUser, twId;
  var loginType;

  userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginType = prefs.getString('loginType');
    });
    print("logintype ...................$loginType");
    if(loginType == 'fb'){
      setState(() {
        fbUser = prefs.getString('fbUser');
        fbEmail = prefs.getString('fbEmail');
        fbId = prefs.getString('fbId');
        fbProfile = prefs.getString('fbProfile');
      });
      print('fbbuser $fbUser $fbProfile, $fbEmail, $fbId');
    }else if(loginType == 'tw'){
      setState(() {
        twUser = prefs.getString('twUser');
        twId = prefs.getString('twId');
      });
      print('twuser $twUser $twId');
    }else if(loginType == 'fs') {
      final FirebaseUser userProfile = await FirebaseAuth.instance.currentUser;
      if (userProfile != null) {
        userName = userProfile.displayName;
        email = userProfile.email;
//      photoUrl = userProfile.photoURL;
//      emailVerified = userProfile.emailVerified;
        uid = userProfile.uid;
      }
      print('user name ....................$userName $email $uid');
    }

    getData();

  }

  getData() async{
    print("loginType 4444...................$loginType");
    crudObj.getData(loginType == 'fs'? uid : loginType == 'fb' ? fbId : twId).then((results) {
      if(mounted){
        setState(() {
          tasks = results;
        });
      }
    });
  }

  String dateNow = DateFormat('d MMM yyyy').format(DateTime.now());

  int _currentIndex = 0;
  final List<Widget> _children = [
    TaskInProgress(),
    TaskCompleted(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgGrey,
      body: Container(
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            Container(
              decoration: BoxDecoration
                ( borderRadius: BorderRadius.circular(10.0),),
              height: 80.0,
              child: BottomNavigationBar(
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 32.0,
                unselectedFontSize: 24.0,
                backgroundColor: Color(0xFF06630b),
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: darkGrey,
                    icon: Text("Active", style: smallAddressWhite2SR(),),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset("images/today.png", height: 25.0, width: 25.0,color: Color(0xFFD0FFBC),),
//                      Text(dateNow, style: subTitleWhiteSR()),
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: darkGrey,
                    icon: Text("Completed", style: smallAddressWhite2SR(),),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset("images/completed.png", height: 25.0, width: 25.0, color: Color(0xFFD0FFBC),),
//                      Text("2/10", style: subTitleWhiteSR()),
                    ),
                  )
                ],
              ),
            ),
            _children[_currentIndex],
          ],
        ),
      ),
    );
  }
}


class TaskInProgress extends StatefulWidget {
  @override
  _TaskInProgressState createState() => _TaskInProgressState();
}

class _TaskInProgressState extends State<TaskInProgress> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          Divider(
            height: 5.0,
            color: Colors.green,
          ),
          TaskDetails(),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 14.0, bottom: 12.0, start: 15.0),
            child: Text(
              "Flexible Activities",
              style: primaryTextUnderline(),
            ),
          ),
          PriorityTaskDetails(),
        ],
      ),
    );
  }
}


class TaskCompleted extends StatefulWidget {
  @override
  _TaskCompletedState createState() => _TaskCompletedState();
}

class _TaskCompletedState extends State<TaskCompleted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          Divider(
            height: 4.0,
            color: bgGrey,
          ),
          CompletedTaskDetails(),
        ],
      ),
    );
  }
}


