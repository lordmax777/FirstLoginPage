import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yanayana/models/boshSahifa.dart';
import 'package:yanayana/models/malumotlar.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _ism = "";
  String? _email = "";
  String? _parol = "";
  String? _familya = "";

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                color: Color.fromRGBO(247, 247, 247, 247),
                height: 180.0,
                width: 400.0,
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("assets/images/3.png"),
                    radius: 53.0,
                  ),
                ),
              ),
              Container(
                height: 550.0,
                width: 400.0,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                        child: Container(
                          height: 45.0,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            onChanged: (String b){
                              _familya = b;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              hintText: "Familyangizni Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Familya",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0, bottom: 10.0),
                        child: Container(
                          height: 70.0,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            onChanged: (String s){
                              _ism = s;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              hintText: "Ismingizni Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Ism",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                            onSaved: (qiymat) => _ism = qiymat,
                            validator: (String? m) {
                              if (m!.length < 5) {
                                return "Iltimos To'liq Kiriting....";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 10.0),
                        child: Container(
                          height: 70.0,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            onChanged: (String d){
                              _email = d;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                              hintText: "Email Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                            onSaved: (qiymat) => _email = qiymat,
                            validator: (String? m) {
                              return _emailKontrolQil(m!);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 10.0),
                        child: Container(
                          height: 70.0,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            onChanged: (String e){
                              _parol = e;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                              hintText: "Password Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                            onSaved: (qiymat) => _parol = qiymat,
                            validator: (String? m) {
                              if (m!.length < 6) {
                                return "Iltimos Parolingizni To'liq Kiriting....";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                            ),
                            onPressed: (){
                              setState(() {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        title: Container(
                                          height: 180.0,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage("assets/images/3.png"),
                                            radius: 80.0,
                                          ),
                                        ),
                                        content: Container(
                                          height: 150.0,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Familya: $_familya",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.0),),
                                              SizedBox(height: 10.0,),
                                              Text("Ism: $_ism",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.0),),
                                              SizedBox(height: 10.0,),
                                              Text("Email: $_email",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.0),),
                                              SizedBox(height: 10.0,),
                                              Text("Parol: $_parol",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.0),),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: Offset.infinite,
                                                spreadRadius: 10.0,
                                                blurRadius: 10.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        actions: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 300.0,
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(250.0, 30.0),
                                                  ),
                                                    onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BoshSahifa()));
                                                    },
                                                    child: Text("SIGN OUT")),
                                                TextButton(
                                                  onPressed: (){
                                                    setState(() {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Text("Sign in",style: TextStyle(color: Colors.grey[800], fontSize: 18.0)),),
                                                TextButton(
                                                  onPressed: (){
                                                    setState(() {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Text("Sign up",style: TextStyle(color: Colors.grey[800], fontSize: 18.0)),),
                                                TextButton(
                                                  onPressed: (){
                                                    setState(() {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Text("Forgot Password?",style: TextStyle(color: Colors.grey[800], fontSize: 18.0)),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20.0,),

                                          SizedBox(width: 80.0,),
                                        ],
                                        backgroundColor: Colors.grey.withOpacity(0.6),
                                      );
                                    });
                              });
                            },
                            child: Text("SIGN UP"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                        child: Container(
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: (){},
                            child: Text("Have an Account? Sign in.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  void _kirilitganMalumotlarniTasdiqla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  _emailKontrolQil(String email) {
    String pattern1 =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern1);

    if (!regExp.hasMatch(email)) {
      return "Emailni Togri Kiriting !!";
    } else {
      return null;
    }
  }
}
