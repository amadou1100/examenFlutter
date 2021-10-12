import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class pageOne extends StatefulWidget {
  //const index({Key key}) : super(key: key);

  @override
  _pageOneState createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acceuil'),),
      body: Center(
        child: Text('Acceuil', style: TextStyle(fontSize: 40)),
      ),
    );
  }
  }