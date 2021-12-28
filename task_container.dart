import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class TaskContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color boxColor;
  final Function onTap;

  TaskContainer({
    this.title, this.subtitle, this.boxColor,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.all(20.0),

      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                fontFamily: "Bryndan"
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                subtitle,
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
        onTap: () => _onAlertButtonPressed(context),
      ),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
_onAlertButtonPressed(context) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "RFLUTTER ALERT",
    desc: "Flutter is more awesome with RFlutter Alert.",
    buttons: [
      DialogButton(
        child: Text(
          "COOL",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => _onCustomAnimationAlertPressed(context),
        width: 120,
      )
    ],
  ).show();
}
_onCustomAnimationAlertPressed(context) {
  Alert(
    context: context,
    title: "RFLUTTER ALERT",
    desc: "Flutter is more awesome with RFlutter Alert.",
    alertAnimation: FadeAlertAnimation,
  ).show();
}

Widget FadeAlertAnimation(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
