import 'package:ayurveda/Home/Responses/responses.dart';
import 'package:ayurveda/Home/drawer.dart';
import 'package:ayurveda/Home/progress/fetch_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../audios_/audio_play.dart';
import 'p_scoreboard.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];
  List<String> numofQs = [];
  int q = 1;
  int size = 15;
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .collection('Questions')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              //print(element.reference);
              if (q <= 15) {
                docIDs.add(element.reference.id);
                numofQs.add("$q");
                q += 1;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    if (a < 15) {
      size = a;
    }
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
              'Progress',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            SizedBox(
              width: screenwidth * 0.25,
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
      body: a != 0
          ? Center(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        itemCount: size,
                        itemBuilder: ((context, index) {
                          return Card(
                              child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              child: Text(
                                numofQs[index],
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Text(docIDs[index]),
                            subtitle:
                                GetUserResponse(documentId: docIDs[index]),
                            //trailing: const Icon(Icons.more_vert),
                            trailing: FutureBuilder<DocumentSnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(user.uid)
                                    .collection('Questions')
                                    .doc(docIDs[index])
                                    .get(),
                                builder: ((context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;

                                    return IconButton(
                                      icon: const Icon(
                                        Icons.navigate_next_sharp,
                                        color: Colors.greenAccent,
                                      ),
                                      tooltip: 'Score Board',
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PScoreBoard(
                                                      question_: docIDs[index],
                                                      v: data['Vata'],
                                                      p: data['Pitta'],
                                                      k: data['Kapha'],
                                                    )),
                                          );
                                        });
                                      },
                                    );
                                  }
                                  return const Text('wait...');
                                })),
                          ));
                        }));
                  }),
            )
          : const Center(
              child: Text('Submit questions first to see your progress'),
            ),
    );
  }
}
