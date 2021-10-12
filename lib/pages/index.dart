import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogiii/pages/formulaire.dart';
import 'package:ogiii/pages/navBar.dart';

class index extends StatefulWidget {
  //const index({Key key}) : super(key: key);

  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Administrations"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(child: GridView(children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>navBar()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.red,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home,size: 50,color: Colors.white,),
                  Text("Mairie", style: TextStyle(color: Colors.white, fontSize: 30),)
                ],),
            ),
          ),
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.yellow,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,size: 50,color: Colors.white,),
                Text("Police", style: TextStyle(color: Colors.white, fontSize: 30),)
              ],),
          ),
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.green,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,size: 50,color: Colors.white,),
                Text("Justice", style: TextStyle(color: Colors.white, fontSize: 30),)
              ],),
          ),
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.grey,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,size: 50,color: Colors.white,),
                Text("ONT", style: TextStyle(color: Colors.white, fontSize: 30),)
              ],),
          ),
        ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),),
      ),
    );
  }
}
