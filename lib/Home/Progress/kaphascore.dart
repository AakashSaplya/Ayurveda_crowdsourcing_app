import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'p_scoreboard.dart';

class KaphaScore extends StatefulWidget {
  final String quesion_;
  const KaphaScore({super.key, required this.quesion_});

  @override
  State<KaphaScore> createState() => _KaphaScoreState();
}

class _KaphaScoreState extends State<KaphaScore> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection("QuestScore")
          .doc('Q')
          .collection('Questions')
          .doc(widget.quesion_)
          .collection('kapha')
          .doc('kapha')
          .get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          final List<BarModel> dataK = [
            BarModel("-2", data['-2'],
                charts.ColorUtil.fromDartColor(Colors.blueGrey)),
            BarModel(
                "-1", data['-1'], charts.ColorUtil.fromDartColor(Colors.green)),
            BarModel(
                "0", data['0'], charts.ColorUtil.fromDartColor(Colors.yellow)),
            BarModel(
                "1", data['1'], charts.ColorUtil.fromDartColor(Colors.pink)),
            BarModel("2", data['2'],
                charts.ColorUtil.fromDartColor(Colors.lightBlue)),
          ];
          List<charts.Series<BarModel, String>> seriesK = [
            charts.Series(
              id: 'count',
              data: dataK,
              domainFn: (BarModel series, _) => series.change,
              measureFn: (BarModel series, _) => series.value,
              colorFn: (BarModel series, _) => series.color,
            )
          ];

          return Container(
            height: screenHeight * 0.30,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: charts.BarChart(seriesK, animate: true),
          );
        }
        return Container(
          height: screenHeight * 0.30,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text('Kapha Score loading....'),
        );
      }),
    );
  }
}
