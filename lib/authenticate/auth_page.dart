//import 'package:ayurveda/login_view.dart';
import 'package:ayurveda/login/login_page.dart';
//import 'package:ayurveda/signUp_view.dart';
import 'package:ayurveda/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return SignUpClass(showLoginPage: toggleScreens);
    }
  }
}
