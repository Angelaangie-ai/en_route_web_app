import 'package:enroute/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:enroute/screens/welcome_screen.dart';
import 'package:enroute/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'components/activity_data.dart';
import 'screens/combination_screen.dart';
import 'screens/combo_screen.dart';
import 'screens/combinatioon_screen.dart';
import 'screens/3rdscreen.dart';
import 'screens/Login.dart';
import 'screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/firebase.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder
      (
          future: _initialization,
          builder: (context, snapshot)
          {
            if (snapshot.connectionState == ConnectionState.done)
            // ignore: missing_return
            {
              // ignore: missing_return
              return ChangeNotifierProvider(
                  create: (context) =>ActivityData(),
                // ignore: missing_return, missing_return
                child: MaterialApp(
                  initialRoute: WelcomeScreen.id,
                  routes: {
                    WelcomeScreen.id:(context) => WelcomeScreen(),
                    LoginScreen.id:(context)=> LoginScreen(),
                    RegistrationScreen.id:(context) => RegistrationScreen(),
                    CombinationScreen.id:(context) => CombinationScreen(),
                    Home.id:(context) => Home(),
                    HomePage.id:(context)=>HomePage(),
                  },
                  theme: ThemeData.light().copyWith(
                    primaryColor: Color(0XFF117C12),
                    scaffoldBackgroundColor: Color(0XFFF2F2F2),
                  ),
                  home: Home(),
                ),
              );
            }
          },
    );
  }
}






