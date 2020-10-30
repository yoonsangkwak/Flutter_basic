import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    Widget liveData = StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('test')
          .doc('test2')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return Text(snapshot.data['name']);
      },
    );

    Widget getData = Center(
      child: Column(
          children: data
              .map((function) => RaisedButton(
                  child: Text(
                      (RegExp(r"['](.*?)[']").stringMatch(function.toString()))
                          .replaceAll("'", "")),
                  onPressed: () => function.call()))
              .toList()),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('firebase'),
        ),
        body: getData);
  }

  List<Function> data = [
    documentGets,
    documentSets1,
    documentSets2,
    documentRemoves,
    fieldGets,
    fieldAdds,
    fieldRemoves
  ];

  // Document
  static documentGets() {
    FirebaseFirestore.instance.collection('test').get().then((value) {
      for (DocumentSnapshot doc in value.docs) {
        print(doc.id);
      }
      print('Done documentGets');
    });
  }

  static documentSets1() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test3')
        .set({'type': 'user info'}).then((value) {
      print('Done documentSets1');
    });
  }

  static documentSets2() {
    FirebaseFirestore.instance
        .collection('test')
        .add({'type': 'user info'}).then((value) {
      print('Done documentSets2');
    });
  }

  static documentRemoves() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test1')
        .delete()
        .then((value) {
      print('Done documentRemoves');
    });
  }

  static fieldGets() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test2')
        .get()
        .then((value) {
      print(value.data());
    });
  }

  static fieldAdds() {
    FirebaseFirestore.instance.collection('test').doc('test2').update({
      'type': 'user info',
    }).then((_) {
      print('Done fieldAdds');
    });
  }

  static fieldRemoves() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test2')
        .update({'type': FieldValue.delete()}).then((_) {
      print('Done fieldRemoves');
    });
  }
}
