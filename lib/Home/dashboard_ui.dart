import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:ayurveda/Home/homepage.dart';
import 'Progress/progress.dart';
import 'package:ayurveda/Home/scoreboard/scoreboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Responses/csv_test.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool audi = true;
  int firstplay = 1;

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    //home elements dashboard, progress, profile, score board
    const Home(),
    const CsvRead(),
    const Progress(),
    const ScoreBoard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.green.shade500,
          animationDuration: const Duration(milliseconds: 300),
          index: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            const FaIcon(
              FontAwesomeIcons.home,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.play,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.barsProgress,
              color: Colors.white,
            ),
            FaIcon(
              Icons.leaderboard,
              color: Colors.white,
            ),
          ]),
    );
  }
}
