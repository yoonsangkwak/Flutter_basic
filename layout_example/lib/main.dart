import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool star = true;
  int count = 41;

  @override
  Widget build(BuildContext context) {
    Widget imageSection = Image.network(
      'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      height: 200,
      width: 400,
      fit: BoxFit.cover,
    );

    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Floating boat on lake next cliff',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pragser Wildsee, Italy',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: star ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red,
            onPressed: () {
              setState(() {
                if (star) {
                  star = !star;
                  count -= 1;
                } else {
                  star = !star;
                  count += 1;
                }
              });
            },
          ),
          Text('$count'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              'CALL',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.near_me,
              color: Colors.blue,
            ),
            Text(
              'ROUTE',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.share,
              color: Colors.blue,
            ),
            Text(
              'SHARE',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ],
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Example'),
      ),
      body: ListView(
        children: [
          imageSection,
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
