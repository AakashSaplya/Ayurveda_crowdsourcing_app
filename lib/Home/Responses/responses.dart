import 'dart:async';
import 'package:ayurveda/Home/Responses/selectResp.dart';
import 'package:ayurveda/Home/drawer.dart';
import 'package:ayurveda/Home/profile_screen.dart';
import 'package:ayurveda/audios_/audio_play.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../animations/animchange.dart';
import '../../animations/vpk_change.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ayurveda/Home/Responses/csv_test.dart';

var selectedVataType = '0';
var selectedKaphaType = '0';
var selectedPittaType = '0';
int a = 0;
int b = 0;
bool audi = true;
int v = 1;
int firstplay = 1;

class PageResponse extends StatefulWidget {
  const PageResponse({super.key});

  @override
  State<PageResponse> createState() => _PageResponseState();
}

class _PageResponseState extends State<PageResponse> {
  List<String> _dosha = <String>['-2', '-1', '0', '1', '2'];
  AudioPlayer player = AudioPlayer();

  Color? _color1 = Colors.grey[100]; //declare bacKground color here
  Color? _color2 = Colors.amberAccent[200];
  String value1 = '0', value2 = '0', value3 = '0';
  int V = 0;
  int P = 0;
  int K = 0;

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
    var fnt = screenHeight * 0.075;
    return Scaffold(
        backgroundColor: _color1,
        drawer: const DrawerPage(),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          //toolbarHeight: screenHeight * 0.07,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Solve Questions',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(
                width: screenwidth * 0.15,
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
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    //color: Colors.green[300],
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 2.0,
                    ),
                    height: fnt,
                    width: screenwidth * 100,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Text(
                          data_[a][1],
                          //questions[a].question!,
                          style: TextStyle(
                              fontSize: fnt / 2.5,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                SizedBox(
                  //width: 400.0,
                  height: screenHeight * 0.30,
                  child: AnimChange(b: b),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //for Vata
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('Vata'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                          child: DropdownButton(
                            items: _dosha
                                .map((value) => DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          V = int.parse(value);
                                          P = 0;
                                          K = 0;
                                          _color1 = Colors.indigo[200];
                                          value1 = value;
                                        });
                                      },
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (selectedV) {
                              setState(() {
                                selectedVataType = selectedV!;
                              });
                            },
                            value: value1,
                            isExpanded: false,
                            hint: Text(
                              '0',
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              setState(() {
                                _color1 = Colors.blue[200];
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    //for pitta
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Pitta'),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                          child: DropdownButton(
                              items: _dosha
                                  .map((value) => DropdownMenuItem(
                                        onTap: () {
                                          setState(() {
                                            V = 0;
                                            P = int.parse(value);
                                            K = 0;
                                            _color1 = Colors.red[200];

                                            value2 = value;
                                          });
                                        },
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedP) {
                                setState(() {
                                  selectedPittaType = selectedP!;
                                });
                              },
                              value: value2,
                              isExpanded: false,
                              hint: Text(
                                '0',
                                style: TextStyle(color: Colors.black),
                              ),
                              onTap: () {
                                setState(() {
                                  _color1 = Colors.orange[200];
                                });
                              }),
                        ),
                      ],
                    ),
                    // for kapha
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Kapha'),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                          child: DropdownButton(
                              items: _dosha
                                  .map((value) => DropdownMenuItem(
                                        onTap: () {
                                          setState(() {
                                            V = 0;
                                            P = 0;
                                            K = int.parse(value);
                                            _color1 = Colors.green[100];
                                          });
                                          value3 = value;
                                        },
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedK) {
                                setState(() {
                                  selectedKaphaType = selectedK!;
                                });
                              },
                              value: value3,
                              isExpanded: false,
                              hint: Text(
                                '0',
                                style: TextStyle(color: Colors.black),
                              ),
                              onTap: () {
                                setState(() {
                                  _color1 = Colors.yellow[200];
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),

                /*SizedBox(
                        height: screenHeight * 0.04,
                        child: Text('$V, $P, $K'),
                      ),*/
                SizedBox(
                  //width: 400.0,
                  height: screenHeight * 0.25,
                  child: vpkChange(
                    V: V,
                    P: P,
                    K: K,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        minimumSize:
                            Size(screenwidth * 100, screenHeight * 0.05)),
                    onPressed: () {
                      setState(() {
                        if (b == 3) {
                          b = 0;
                        } else {
                          b = b + 1;
                        }
                        _color1 = Colors.grey[200];
                        value1 = '0';
                        value2 = '0';
                        value3 = '0';
                        V = 0;
                        P = 0;
                        K = 0;

                        if (a == 22) {
                          a = 0;
                        } else {
                          a = a + 1;
                        }
                      });
                      ResPonse();
                      //questScorev(a);
                      //questScorek(a);
                      //questScorep(a);
                      incquestScorev(a, selectedVataType);
                      incquestScorep(a, selectedPittaType);
                      incquestScorek(a, selectedKaphaType);
                      selectedKaphaType = '0';
                      selectedPittaType = '0';
                      selectedVataType = '0';
                      Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                SizedBox(
                  height: screenHeight * 0.025,
                )
              ]),
        ));
  }
}

// ignore: non_constant_identifier_names
Future ResPonse() async {
  FirebaseFirestore.instance
      .collection("Users")
      .doc(user.uid)
      .collection('Questions')
      .doc(data_[a][1])
      .set({
    'Vata': selectedVataType,
    'Kapha': selectedKaphaType,
    'Pitta': selectedPittaType
  });
}
