
import 'package:flutter/material.dart';

class CostPage extends StatefulWidget {
  CostPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CostPageState createState() => CostPageState();
}

class CostPageState extends State<CostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}