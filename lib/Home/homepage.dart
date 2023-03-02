import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:ayurveda/Home/drawer.dart';
import 'package:flutter/material.dart';
import '../audios_/audio_play.dart';
import '../config/palette.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //first time enter page
    if (firstplay == 1) {
      AudioPlay(audi);
      audi = false;
      firstplay = 0;
    }
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            SizedBox(
              width: screenwidth * 0.27,
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
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.green[500],
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   iconSize: 28.0,
        //   onPressed: () {},
        // ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(screenHeight),
            _buildStartTest(screenHeight),
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Palette.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Ayurveda',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Crowd Sourcing',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Contribute to our crowd sourcing for understanding ayurveda with modern technology',
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 15.0),
                  )
                ],
              )
            ]),
      ),
    );
  }

  SliverToBoxAdapter _buildStartTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green.shade200, Palette.primaryColor]),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/survey-icon.png'),
            Column(
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const ResponsePage()));
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.teal,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30.0)),
                //   ),
                //   child: const Text("Let's Get Started"),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
