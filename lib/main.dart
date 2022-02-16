import 'package:bibliotheque/screens/home_screen.dart';
import 'package:bibliotheque/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication.initializeFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.route,
        routes: {
          LoginScreen.route: (context) => LoginScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          RegisterScreen.route: (context) => RegisterScreen(),
          // '/sign-out': (context) => null, // Sign-out route
          // '/item/:id': (context) => null, // Description item screen
          // '/item/add': (context) => null, // Add item
        });
  }
}

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }
}
