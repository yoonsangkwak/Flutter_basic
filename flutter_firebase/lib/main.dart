import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget liveData = StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('test')
          .doc('test1')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return Text(snapshot.data['name']);
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('firebase'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text('documentGets'),
                onPressed: () {
                  documentGets();
                },
              ),
              RaisedButton(
                child: Text('documentSets1'),
                onPressed: () {
                  documentSets1();
                },
              ),
              RaisedButton(
                child: Text('documentSets2'),
                onPressed: () {
                  documentSets2();
                },
              ),
              RaisedButton(
                child: Text('documentRemoves'),
                onPressed: () {
                  documentRemoves();
                },
              ),
            ],
          ),
        ));
  }

  // Document
  documentGets() {
    FirebaseFirestore.instance.collection('test').get().then((value) {
      for (DocumentSnapshot doc in value.docs) {
        print(doc.id);
      }
      print('Done documentGets');
    });
  }

  documentSets1() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test3')
        .set({'type': 'user info'}).then((value) {
      print('Done documentSets1');
    });
  }

  documentSets2() {
    FirebaseFirestore.instance
        .collection('test')
        .add({'type': 'user info'}).then((value) {
      print('Done documentSets2');
    });
  }

  documentRemoves() {
    FirebaseFirestore.instance
        .collection('test')
        .doc('test1')
        .delete()
        .then((value) {
      print('Done documentRemoves');
    });
  }

  fieldGets() {
    FirebaseFirestore.instance
    .collection('test2')
    .doc('test1')
  }
}
