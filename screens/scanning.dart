import 'package:enroute/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:enroute/components/light_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enroute/components/scale_route.dart';
import 'package:enroute/screens/make-your-daily-combination.dart';
import 'package:animated_button/animated_button.dart';
import 'scan_main.dart';
import 'package:o_popup/o_popup.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ScanPage(),
));

class ScanPage extends StatefulWidget {
  @override
  ScanPageState createState() {
    return new ScanPageState();
  }
}

class ScanPageState extends State<ScanPage> {
  String result = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kMyFavGreen,
        title: Text("Is it sustainable?",style: TextStyle(
          fontFamily: "Bryndan",
          color: LightColors.kLighterGreen,
        ),),
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          OPopupTrigger(
            triggerWidget: Text('For more information, click here first', style:
            TextStyle(
              fontFamily: "Bryndan",
              fontSize: 10,
            ),),
            popupHeader: OPopupContent.standardizedHeader('Dear hero, thank you for using the EnRoute MVP. '
                'In this page you can see the scanning process in the Scan Barcode button, and see an example of the page in see result tab!', ),
            popupContent: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 500,),
          AnimatedButton(
            color: Color(0xFFD0FFBC),
            width: 200,
            height: 50,
            child: Text(
              'See result',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF06630b),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Bryndan"
              ),
            ),
            onPressed: () {
              Navigator.push(context, ScaleRoute(page: MyApp()));
            },
          ),
          SizedBox(height: 12,),
          FloatingActionButton.extended(
            icon: Icon(Icons.web,color: LightColors.kLighterGreen,),
            label: Text("Enter a link",
              style: TextStyle(
                fontFamily: "Bryndan",
                fontSize: 20,
                color: LightColors.kLighterGreen,
              ),
            ),
            onPressed: () {
              showDialog(context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title:Text("Here you would be able to scan the barcode or insert a link of the item.",style: TextStyle(fontFamily: "Bryndan"),),
                  ),
              );
            },
            backgroundColor: LightColors.kMyFavGreen,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}