import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  InvoicePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  InvoicePageState createState() => InvoicePageState();
}

class InvoicePageState extends State<InvoicePage> {
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