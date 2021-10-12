import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ogiii/pages/newuser.page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerEmail= new TextEditingController();
  TextEditingController controllerPass= new TextEditingController();
  String serverUrl = "http://127.0.0.1/ogii";
  var status ;

  var token ;

  loginData(String email , String password) async{

    String myUrl = "serverUrl/login.php";
    final response = await  http.post(Uri.parse(myUrl),
        headers: {
          'Accept':'application/json'
        },
        body: {
          "email": email,
          "password" : password,
        }) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
      Navigator.pushReplacementNamed(context, '/index');
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
                Row(children: <Widget>[
                  RotatedBox(
            quarterTurns: -1,
            child: Text(
              'Connectez vous',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w900,
              ),
            )),

                  Container(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Page de connection à l application',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                TextField(
                  controller: controllerEmail,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.lightBlueAccent,
                    labelText: 'Adresse E-mail',
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                TextField(
                  controller: controllerPass,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>index()));

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Connecter',
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
                        'La première fois?, pas de problème',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => NewUser()));
                        },
                        child: Text(
                          '   Enregistrer votre compte',
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
_save(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}

