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
    return Scaffold(
      appBar: AppBar(
        title: Text('Votes'),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text('C'),
                trailing: Text('20'),
              ),
            ),
            Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text('C'),
                trailing: Text('20'),
              ),
            ),
            Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text('C'),
                trailing: Text('20'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
