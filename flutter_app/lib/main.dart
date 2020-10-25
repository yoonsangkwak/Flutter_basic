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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContainerWidget(),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Example'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Health'),
            subtitle: Text('건강을 찾아보세요'),
            trailing: Icon(Icons.directions_bike),
          ),
          ListTile(
            title: Text('Study'),
            subtitle: Text('책읽는 습관을 길러보세요'),
            trailing: Icon(Icons.book),
          ),
          ListTile(
            title: Text('Food'),
            subtitle: Text('건강한 식단을 계획해보세요'),
            trailing: Icon(Icons.no_food),
            onTap: () {
              print('Tap');
            },
          ),
          ListTile(
            title: Text('Financial'),
            subtitle: Text('체계적으로 자산을 관리해보세요'),
            trailing: Icon(Icons.attach_money),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('123');
        },
        child: Icon(Icons.stop),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
