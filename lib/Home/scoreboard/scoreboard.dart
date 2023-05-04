import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:ayurveda/Home/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../audios_/audio_play.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarModel2 {
  String change;
  int value;
  final charts.Color color;
  BarModel2(this.change, this.value, this.color);
}

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  List<String> topusers = [];
  List<String> numofUsers = [];
  int q_ = 1;
  int size_ = 5;
  Future getUserId() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              //print(element.reference);
              if (q_ <= 5) {
                topusers.add(element.reference.id);
                numofUsers.add("$q_");
                q_ += 1;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<BarModel2> dataScore = [
      BarModel2(
          "Total Qs.",
          50,
          charts.ColorUtil.fromDartColor(
              const Color.fromARGB(255, 48, 215, 165))),
      BarModel2(
          "Vata Sc.",
          30,
          charts.ColorUtil.fromDartColor(
              const Color.fromARGB(255, 33, 122, 166))),
      BarModel2(
          "Pitta Sc.",
          15,
          charts.ColorUtil.fromDartColor(
              const Color.fromARGB(255, 163, 148, 17))),
      BarModel2(
          "Kapha Sc.",
          25,
          charts.ColorUtil.fromDartColor(
              const Color.fromARGB(255, 53, 148, 57))),
    ];
    List<charts.Series<BarModel2, String>> seriesScore = [
      charts.Series(
        id: 'count',
        data: dataScore,
        domainFn: (BarModel2 series, _) => series.change,
        measureFn: (BarModel2 series, _) => series.value,
        colorFn: (BarModel2 series, _) => series.color,
      )
    ];
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenwidth * 1,
                height: screenHeight * 0.25,
                color: Colors.green[400],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'User Id: Aakash110',
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: screenHeight * 0.025),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Total Questions: 50',
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: screenHeight * 0.025),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Your Score: 70',
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: screenHeight * 0.025),
                        textAlign: TextAlign.start,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Vata: 30',
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: screenHeight * 0.025),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Pitta: 25',
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: screenHeight * 0.025),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Kapha: 15',
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: screenHeight * 0.025),
                              textAlign: TextAlign.start,
                            )
                          ]),
                    ]),
              ),
              SizedBox(
                height: screenHeight * 0.3,
                child: charts.BarChart(
                  seriesScore,
                  animate: true,
                ),
              ),
              Container(
                  height: screenHeight * 0.60,
                  width: screenwidth * 0.95,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                        child: const Text(
                          'Top Users ',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.52,
                        width: screenwidth * 0.90,
                        child: FutureBuilder(
                            future: getUserId(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: ((context, index) {
                                    return Card(
                                        child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.greenAccent,
                                        child: Text(
                                          numofUsers[index],
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                      title: Text(topusers[index]),
                                      subtitle: const Text('score: 70'),
                                    ));
                                  }));
                            }),
                      )
                    ],
                  )),
              const SizedBox(
                height: 50,
                child: Text(
                    'Solve more questions and with correct submissions to get more score.'),
              ),
            ],
          ),
        ));
  }
}
