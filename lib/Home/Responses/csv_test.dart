import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

List<List<dynamic>> data_ = [];

class CsvRead extends StatefulWidget {
  const CsvRead({Key? key}) : super(key: key);

  @override
  State<CsvRead> createState() => _CsvReadState();
}

class _CsvReadState extends State<CsvRead> {
  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/test.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      data_ = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
      onPressed: (() {
        _loadCSV();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PageResponse()));
      }),
      child: const Icon(Icons.play_arrow),
    ));
  }
}
