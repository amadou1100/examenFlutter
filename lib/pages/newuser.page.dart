import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.page.dart';
import 'package:http/http.dart' as http;

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();


  Future register() async{
    var url = "http://localhost:3306/ogii/register_user.php";
    var response = await http.post(Uri.parse(url),body:{
      "email" : email.text,
      'password': pass.text,
    });

    var data = json.decode(response.body);
    if(data== "Erreur"){
      Fluttertoast.showToast(
        msg: " cet utilisateur existe déja",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0

      );
    }
    else {
      Fluttertoast.showToast(
          msg: "Enrégistrée avec succès",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[

                    Container(
                      //color: Colors.green,
                      height: 200,
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                          ),
                          Center(
                            child: Text(
                              'Remplisez ces informations',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.lightBlueAccent,
                      labelText: 'Nom d utilisateur',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: email,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.lightBlueAccent,
                      labelText: 'votre e-mail',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: pass,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0000ff),
                          blurRadius: 10.0, // has the effect of softening the shadow
                          spreadRadius: 1.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: FlatButton(
                    onPressed: (){
                      register();
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Créez le compte',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  //color: Colors.red,
                  height: 20,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Vous avez déjà un compte ?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          ' connectez vous',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
