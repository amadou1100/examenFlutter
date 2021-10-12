import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogiii/pages/sub/pageOne.dart';
import 'package:ogiii/pages/sub/pageTwo.dart';
import 'package:ogiii/pages/sub/pageThree.dart';
import 'package:ogiii/pages/sub/pageFour.dart';
import 'package:ogiii/pages/formulaire.dart';
class navBar extends StatefulWidget {

  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int currentTab=0;
  final List<Widget> screens = [
    pageOne(),
    pageTwo(),
    pageThree(),
    pageFour(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = pageOne();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>formulaire()));
      },
    ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen= pageOne();
                        currentTab=0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab==0? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Acceuil', style: TextStyle(color:currentTab==0 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen= pageTwo();
                        currentTab=1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab==1? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Chat', style: TextStyle(color:currentTab==0 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen= pageThree();
                        currentTab=2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab==2? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Options', style: TextStyle(color:currentTab==2 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen= pageFour();
                        currentTab=3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab==3? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Guide', style: TextStyle(color:currentTab==3 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}