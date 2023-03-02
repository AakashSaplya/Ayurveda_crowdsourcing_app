import 'package:ayurveda/Home/Progress/kaphascore.dart';
import 'package:ayurveda/Home/Progress/pittascore.dart';
import 'package:ayurveda/Home/Progress/vatascore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarModel {
  String change;
  int value;
  final charts.Color color;
  BarModel(this.change, this.value, this.color);
}

class PScoreBoard extends StatefulWidget {
  final String question_;
  final String v;
  final String p;
  final String k;

  const PScoreBoard({
    Key? key,
    required this.question_,
    required this.v,
    required this.p,
    required this.k,
  }) : super(key: key);

  @override
  State<PScoreBoard> createState() => _PScoreBoardState();
}

class _PScoreBoardState extends State<PScoreBoard> {
  @override
  Widget build(BuildContext context) {
    //final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Score Board"),
          centerTitle: true,
          backgroundColor: Colors.green[500],
          leading: IconButton(
            icon: const Icon(Icons.navigate_before_sharp),
            iconSize: 28.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(width: 0.1),
                ),
                child: Text(
                  widget.question_,
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                'Vata',
                style: TextStyle(fontSize: 15),
              ),
              VataScore(
                question_: widget.question_,
              ),
              Text(
                'Your Vata Response: ${widget.v}',
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                'Pitta',
                style: TextStyle(fontSize: 15),
              ),
              PittaScore(
                question_: widget.question_,
              ),
              Text(
                'Your Pitta Response: ${widget.p}',
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                'Kapha',
                style: TextStyle(fontSize: 15),
              ),
              KaphaScore(
                quesion_: widget.question_,
              ),
              Text(
                'Your Kapha Response: ${widget.k}',
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
            ],
          ),
        )));
  }
}
