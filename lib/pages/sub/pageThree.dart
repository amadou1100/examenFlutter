import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class pageThree extends StatefulWidget {
  //const index({Key key}) : super(key: key);

  @override
  _pageThreeState createState() => _pageThreeState();
}

class _pageThreeState extends State<pageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Options'),),
      body: Center(
        child: Text('Options', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}