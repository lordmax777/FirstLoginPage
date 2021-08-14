import 'package:flutter/material.dart';
import 'package:yanayana/models/boshSahifa.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      home: BoshSahifa(),
    );
  }
}

