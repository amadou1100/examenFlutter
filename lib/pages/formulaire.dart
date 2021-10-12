import 'package:flutter/material.dart';


class formulaire extends StatefulWidget {
  @override
  _formulaireState createState() => new _formulaireState();
}

class _formulaireState extends State<formulaire> {
  TextEditingController prenom= new TextEditingController();
  TextEditingController nom= new TextEditingController();
  TextEditingController email= new TextEditingController();
  TextEditingController date= new TextEditingController();
  TextEditingController localite= new TextEditingController();
  TextEditingController sexe= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.adb),
        title: Text("Formulaire d'acte de naissance"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextField(Icons.person, "Prénom",prenom),
                buildTextField(Icons.person, "Nom",nom),
                buildTextField(Icons.date_range, "Date de Naissance",date),
                buildTextField(Icons.email, "Email",email),
                buildTextField(Icons.add_location_alt, "Localité de Naissance",localite),
                buildTextField(Icons.pregnant_woman_outlined, "Sexe",sexe),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Submit"),
                ),
              ]),
        ),
      ),
    );
  }
}
  TextField buildTextField(icon, name,control,) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

