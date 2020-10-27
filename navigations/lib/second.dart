import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('back'),
              onPressed: () {
                Navigator.pop(context, 'ok');
              },
            )
          ],
        ),
      ),
    );
  }
}
