import 'package:enroute/components/task_expended.dart';
import 'package:flutter/material.dart';
import 'package:enroute/components/light_colors.dart';


class SocialChallenges extends StatefulWidget {
  @override
  _SocialChallengesState createState() => _SocialChallengesState();
}

class _SocialChallengesState extends State<SocialChallenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social challenges",style:
          TextStyle(
            fontFamily: "Bryndan",
            color: LightColors.kLighterGreen,
          ),),
      ) ,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: <Widget>[
            Text("Heroes love challenges, search for your next one here!",style: TextStyle(
              color: LightColors.kMyFavGreen,
              fontFamily: "Bryndan",
              fontSize: 20,
            ),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: LightColors.kBlue,
              ),
              child: Text("Hi"),
            ),
          ],
        ),
      ),
    );
  }
}

