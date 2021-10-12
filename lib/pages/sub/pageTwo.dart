import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class pageTwo extends StatefulWidget {
  //const index({Key key}) : super(key: key);

  @override
  _pageTwoState createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat'),),
      body: Center(
        child: Text('Chat', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}