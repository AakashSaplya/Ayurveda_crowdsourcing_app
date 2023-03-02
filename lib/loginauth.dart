import 'package:ayurveda/authenticate/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home/dashboard_ui.dart';

class Loginauth extends StatelessWidget {
  const Loginauth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const DashBoard();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
