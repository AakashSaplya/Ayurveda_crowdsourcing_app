import 'package:cloud_firestore/cloud_firestore.dart';
import '../../questions/questions_list.dart';

/*
Future graph(a) async {
  print("test case 1");
  DocumentSnapshot<Map<String, dynamic>> Graph_ = await FirebaseFirestore
      .instance
      .collection('Graph')
      .doc(questions[a - 1].question)
      .get();
  print(Graph_);
  print('test case 3');
  FirebaseFirestore.instance
      .collection('Graph')
      .doc(questions[a - 1].question)
      .collection('vata')
      .doc('vata')
      .update(
    {"-2": FieldValue.increment(1)},
  );
  FirebaseFirestore.instance
        .collection('Graph')
        .doc(questions[a - 1].question)
        .collection('vata')
        .doc('vata')
        .set({'-2': 0, '-1': 0, '0': 0, '1': 0, '2': 0}); // create the document
  */

//--------------------------------------------------------------
//For set all values to 0
Future questScorev(a) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('vata')
      .doc('vata')
      .set({'-2': 0, '-1': 0, '0': 0, '1': 0, '2': 0});
}

Future questScorep(a) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('pitta')
      .doc('pitta')
      .set({'-2': 0, '-1': 0, '0': 0, '1': 0, '2': 0});
}

Future questScorek(a) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('kapha')
      .doc('kapha')
      .set({'-2': 0, '-1': 0, '0': 0, '1': 0, '2': 0});
}

//--------------------------------------------------------------
//to increament set values by 1 for every submit
Future incquestScorev(a, String v) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('vata')
      .doc('vata')
      .update(
    {
      if (v == '-2')
        '-2': FieldValue.increment(1)
      else if (v == '-1')
        '-1': FieldValue.increment(1)
      else if (v == '0')
        '0': FieldValue.increment(1)
      else if (v == '1')
        '1': FieldValue.increment(1)
      else
        '2': FieldValue.increment(1)
    },
  );
}

Future incquestScorep(a, String p) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('pitta')
      .doc('pitta')
      .update(
    {
      if (p == '-2')
        '-2': FieldValue.increment(1)
      else if (p == '-1')
        '-1': FieldValue.increment(1)
      else if (p == '0')
        '0': FieldValue.increment(1)
      else if (p == '1')
        '1': FieldValue.increment(1)
      else
        '2': FieldValue.increment(1)
    },
  );
}

Future incquestScorek(a, String k) async {
  await FirebaseFirestore.instance
      .collection("QuestScore")
      .doc('Q')
      .collection('Questions')
      .doc(questions[a - 1].question)
      .collection('kapha')
      .doc('kapha')
      .update(
    {
      if (k == '-2')
        '-2': FieldValue.increment(1)
      else if (k == '-1')
        '-1': FieldValue.increment(1)
      else if (k == '0')
        '0': FieldValue.increment(1)
      else if (k == '1')
        '1': FieldValue.increment(1)
      else
        '2': FieldValue.increment(1)
    },
  );
}

//-----------------------------------------------------
