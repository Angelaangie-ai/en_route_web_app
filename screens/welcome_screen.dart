import 'package:enroute/components/rounded_button.dart';
import 'package:enroute/screens/home_page.dart';
import 'package:enroute/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_screen.dart';
import 'package:enroute/components/facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart'as http;
import 'profile_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id ='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.white, end: Color(0XFF117C12)).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  loginUser () {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text("EnRoute",
              style: TextStyle(
                fontSize: 60.0,
                fontFamily: 'Pacifico',
                color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundedButton(colour: Colors.green,
              text: "Log In",
              onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(colour: Colors.green,
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 1,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Material(
                elevation: 5.0,
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    signInWithGoogle().whenComplete(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    });
                  },
                  minWidth: 200.0,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage('images/google_green.png'),
                        width: 40.0,
                        height: 40.0,),
                      SizedBox(width: 20.0),
                      Text(
                        "Log In with Google", style:
                      TextStyle(
                        color: Colors.white,
                        fontFamily: "Bryndan",
                        fontSize: 20.0,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}
