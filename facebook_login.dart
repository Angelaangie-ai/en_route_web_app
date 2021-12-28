import 'package:flutter/material.dart';

class FacebookButton extends StatefulWidget {
  @override
  _FacebookButtonState createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  bool isLoggedIn = true;
  Map userProfile;
  _logout () {

  }
  _loginwithFB () {

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Color(0XFF3C5A98),
        child: isLoggedIn ? Column(
          children: <Widget>[
            Image.network("http://placehold.it/50x50",height: 50.0,width: 50.0,),
            Text(""),
            MaterialButton(
              child: Text("Logout"),
              onPressed: () {
                _logout();
              },
            )
          ],
        )
            : MaterialButton(
          onPressed: () {
            _loginwithFB();
          },
          minWidth: 200.0,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('images/fbicon.png'),
                width: 40.0,
                height: 40.0,),
              Text(
                "Log In with Facebook", style:
              TextStyle(
                color: Colors.white,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

