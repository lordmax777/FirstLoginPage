import 'package:flutter/material.dart';
import 'package:yanayana/models/homePage.dart';

class Malumotlar extends StatefulWidget {
  Malumotlar(
      String? ism,
      String? email,
      String? parol);


  @override
  _MalumotlarState createState() => _MalumotlarState();
}

class _MalumotlarState extends State<Malumotlar> {
  get ism => "";
  get email => "";
  get parol => "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Text("Ism: $ism"),
                Text("Email: $email"),
                Text("Parol: $parol"),
              ],
            ),
          ),
        ),
    );
  }
}
