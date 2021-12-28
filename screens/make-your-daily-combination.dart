import 'package:enroute/components/add_task.dart';
import 'package:enroute/components/task_expended.dart';
import 'package:enroute/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:enroute/components/light_colors.dart';
import 'package:enroute/components/calendar_dates.dart';
import 'package:enroute/components/dates_list.dart';
import 'package:enroute/components/task_container.dart';
import 'package:o_popup/o_popup.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:enroute/components/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:enroute/components/landing.dart';


class CalendarPage extends StatelessWidget {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------------------------------------------------------------------------',
        maxLines: 1,
        style:
        TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } ,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              OPopupTrigger(
                triggerWidget: Text('Click here first', style:
                  TextStyle(
                    fontFamily: "Bryndan",
                    fontSize: 10,
                  ),),
                popupHeader: OPopupContent.standardizedHeader('Dear hero, thank you for using the EnRoute MVP. '
                    'Keep in mind that this page is just a demo and it displays how your combination would look like in the official version.', ),
                popupContent: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Dear hero, here is your daily combination!',
                        style: TextStyle(
                            fontSize: 18.2, fontFamily: "Bryndan", color: Color(0xFF06630b) ),
                      ),
                    ]),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'January, 2021',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Bryndan"),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 58.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 1 ? LightColors.kMyFavGreen : Colors.black54,
                      dateColor:
                      index == 1 ? LightColors.kMyFavGreen : Colors.black,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${time[index]} ${time[index] > 6 ? 'PM' : 'AM'}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        fontFamily: "Bryndan"
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15.0),
                            padding: EdgeInsets.all(20.0),

                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Going to work',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Bryndan"
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'Using the bus; Producing 2.45 kg CO2 emissions.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black54,
                                        fontFamily: "Bryndan",
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title: Text("Going to work", style: TextStyle(
                                      fontFamily: "Bryndan"
                                    ),),
                                    content: Text("Walk for 5 minutes. Take the bus from Bus Station 14.",style:
                                      TextStyle(fontFamily:"Bryndan")
                                      ,),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                        child: Text("Buy tickets", style: TextStyle(fontFamily: "Bryndan"),),
                                        onPressed: () {
                                          showDialog(context: context,
                                          builder: (_) => CupertinoAlertDialog(
                                            title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                            content: Text("This is how you would be able to buy tickets.",style: TextStyle(
                                              fontFamily: "Bryndan",
                                            ),),
                                          ),
                                          );
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: Text("Navigate", style: TextStyle(fontFamily: "Bryndan"),),
                                        onPressed: () {
                                          showDialog(context: context,
                                          builder: (_) => CupertinoAlertDialog(
                                            title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                            content: Text("This is how you would be able to navigate.",style: TextStyle(
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
                            decoration: BoxDecoration(
                                color: LightColors.kLightYellow2,
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                              _dashedText(),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0),
                                padding: EdgeInsets.all(20.0),

                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Going to supermarket',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Bryndan"
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Using the bus; Producing 1.25 kg CO2 emissions.',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54,
                                            fontFamily: "Bryndan",
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CupertinoAlertDialog(
                                        title: Text("Going to supermarket", style: TextStyle(
                                            fontFamily: "Bryndan"
                                        ),),
                                        content: Text("Take the bus from bus station 23 to bus station 31.",style:
                                        TextStyle(fontFamily:"Bryndan")
                                          ,),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text("Buy tickets", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to buy tickets.",style: TextStyle(
                                                    fontFamily: "Bryndan",
                                                  ),),
                                                ),
                                              );
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: Text("Navigate", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to navigate.",style: TextStyle(
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
                                decoration: BoxDecoration(
                                    color: LightColors.kLightYellow2,
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0),
                                padding: EdgeInsets.all(20.0),

                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Going home',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Bryndan"
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Walking; Producing 0 kg CO2 emissions.',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54,
                                            fontFamily: "Bryndan",
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CupertinoAlertDialog(
                                        title: Text("Going home", style: TextStyle(
                                            fontFamily: "Bryndan"
                                        ),),
                                        content: Text("Walk for 10 minutes. Enjoy the sunny day.",style:
                                        TextStyle(fontFamily:"Bryndan")
                                          ,),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text("Navigate", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to navigate.",style: TextStyle(
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
                                decoration: BoxDecoration(
                                    color: LightColors.kLighterGreen,
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0),
                                padding: EdgeInsets.all(20.0),

                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Going to a birthday party',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Bryndan"
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Using a car; Producing 15 kg CO2 emissions.',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54,
                                            fontFamily: "Bryndan",
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CupertinoAlertDialog(
                                        title: Text("Going to a birthday party", style: TextStyle(
                                            fontFamily: "Bryndan"
                                        ),),
                                        content: Text("Ride for 10 minutes.",style:
                                        TextStyle(fontFamily:"Bryndan")
                                          ,),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text("Reserve parking", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to reserve a parking slot.",style: TextStyle(
                                                    fontFamily: "Bryndan",
                                                  ),),
                                                ),
                                              );
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: Text("Navigate", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to navigate.",style: TextStyle(
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
                                decoration: BoxDecoration(
                                    color: LightColors.kRed,
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0),
                                padding: EdgeInsets.all(20.0),

                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Coming back home',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Bryndan"
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Using a car; Producing 15 kg CO2 emissions.',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54,
                                            fontFamily: "Bryndan",
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CupertinoAlertDialog(
                                        title: Text("Coming back home", style: TextStyle(
                                            fontFamily: "Bryndan"
                                        ),),
                                        content: Text("Riding back for 10 minutes.",style:
                                        TextStyle(fontFamily:"Bryndan")
                                          ,),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text("Navigate", style: TextStyle(fontFamily: "Bryndan"),),
                                            onPressed: () {
                                              showDialog(context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                                  content: Text("This is how you would be able to navigate.",style: TextStyle(
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
                                decoration: BoxDecoration(
                                    color: LightColors.kRed,
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              _dashedText(),
                              _dashedText(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
_onAlertButtonPressed(context) {
  Alert(
    context: context,
    type: AlertType.none,
    title: "Going to work",
    desc: "Walk 5 minutes, then take the bus, from Bus Station 14",
    buttons: [
      DialogButton(
        color: Color(0xFF06630b),
        child: Text(
          "Buy ticket",
          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Bryndan"),
        ),
        onPressed: () => _onCustomAnimationAlertPressed(context),
        width: 120,
      ),
      DialogButton(
        color: Color(0xFFD0FFBC),
        child: Text(
          "Navigate",
          style: TextStyle(color:Color(0xFF06630b), fontSize: 15, fontFamily: "Bryndan"),
        ),
        onPressed: () => _onCustomAnimationAlertPressed(context),
        width: 120,
      ),
    ],
  ).show();
}
_onCustomAnimationAlertPressed(context) {
  Alert(context: context,
      title: "Thank you for showing ",
      desc: "Flutter is awesome.").show();
}