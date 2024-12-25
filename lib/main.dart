import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp3/pages/authentification.dart';
import 'package:tp3/pages/detail.dart';
import 'package:tp3/pages/gallery.dart';
import 'package:tp3/pages/home.dart';
import 'package:tp3/pages/inscription.dart';
import 'package:tp3/pages/chat.dart';
import 'package:tp3/pages/message.dart';
import 'package:tp3/pages/parametres.dart';
import 'package:tp3/pages/pays.page.dart';
import 'package:tp3/pages/pays_details.dart';
import 'package:tp3/pages/welcome.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {
    '/inscription': (context) => loginScreen(),
    '/authentification': (context) => SignUpScreen(),
    '/gallery': (context) => gallery(),
    '/parametres': (context) => parametres(),
    '/chat': (context) => ChatPage(),
    '/PaysPage': (context) => PaysPage(),
    '/PaysDetails': (context) => PaysDetails(pays: '',),
    '/DetailPage': (context) => DetailPage(),
    '/MessagesScreen': (context) => MessagesScreen(),

  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefsSnapshot) {
        if (prefsSnapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (prefsSnapshot.hasError) {
          // Handle errors if SharedPreferences fails to load.
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('Error loading SharedPreferences'),
              ),
            ),
          );
        } else {
          SharedPreferences? prefs = prefsSnapshot.data;
          bool conn = prefs?.getBool("connecte") ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: routes,
            home: conn ? ChatPage() : WelcomeScreen(),
          );
        }
      },
    );
  }
}
