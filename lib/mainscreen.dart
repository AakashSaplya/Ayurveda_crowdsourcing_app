//import 'package:ayurveda/signUp_view.dart';
import 'package:flutter/material.dart';
import 'loginauth.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logo01.png'), fit: BoxFit.cover)),
          child: Align(
            alignment: const Alignment(0, 0.8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginauth()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 83, 231, 14),
                ),
                child: const Text(
                  'Play',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )),
    );
  }
}
