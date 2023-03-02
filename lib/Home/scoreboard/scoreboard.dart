import 'dart:html';

import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:ayurveda/Home/drawer.dart';
import 'package:flutter/material.dart';
import '../../audios_/audio_play.dart';

class ScoreBoard extends StatefulWidget {
  final String question_;
  const ScoreBoard({Key? key, required this.question_}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: const DrawerPage(),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Score Board',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(
                width: screenwidth * 0.20,
              ),
              IconButton(
                onPressed: (() {
                  setState(() {
                    if (audi == true) {
                      AudioPlay(audi);
                      audi = false;
                    } else if (audi == false) {
                      AudioPlay(audi);
                      audi = true;
                    }
                  });
                }),
                icon: audi == true
                    ? const Icon(Icons.volume_off)
                    : const Icon(Icons.volume_up),
                iconSize: screenHeight * 0.03,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.green[500],
        ),
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: screenHeight * 0.3,
                  color: Colors.green[400],
                ),
              ],
            ),
            const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Overall',
                ),
                Tab(
                  text: 'Vata',
                ),
                Tab(
                  text: 'Pitta',
                ),
                Tab(
                  text: 'Kapha',
                ),
              ],
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xffff6468),
            ),
            TabBarView(children: <Widget>[
              SizedBox(
                height: screenHeight * 0.02,
                child: Row(children: const <Widget>[
                  Text('4'),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/yti/AHXOFjWP3vWc-6GAKML22SRlaw5dueT4FxrVg-VnSf7STg=s88-c-k-c0x00ffffff-no-rj-mo'),
                  ),
                ]),
              )
            ])
          ],
        ));
  }
}
