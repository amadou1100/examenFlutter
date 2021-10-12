import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class pageFour extends StatefulWidget {
  //const index({Key key}) : super(key: key);

  @override
  _pageFourState createState() => _pageFourState();
}

class _pageFourState extends State<pageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guide'),),
      body: Center(
        child: Text('Guide', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}