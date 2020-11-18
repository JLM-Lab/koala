
import 'package:flutter/material.dart';

class ApprovalPage extends StatefulWidget {
  ApprovalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ApprovalPageState createState() => ApprovalPageState();
}

class ApprovalPageState extends State<ApprovalPage> {
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