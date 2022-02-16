import 'package:bibliotheque/auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(AuthenticationHelper().isLogin()
                  ? AuthenticationHelper().user.email.toString()
                  : ''),
            ),
            ElevatedButton(
                onPressed: () => _disconnect(), child: Text("Déconnexion"))
          ],
        ));
  }

  void _disconnect() {
    AuthenticationHelper().signOut();
    Navigator.of(context).pushReplacementNamed(LoginScreen.route);
  }
}
