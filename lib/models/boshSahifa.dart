import 'package:flutter/material.dart';
import 'package:yanayana/models/homePage.dart';

class BoshSahifa extends StatefulWidget {

  @override
  _BoshSahifaState createState() => _BoshSahifaState();
}

class _BoshSahifaState extends State<BoshSahifa> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                color: Color.fromRGBO(247, 247, 247, 247),
                height: 280.0,
                width: 400.0,
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 110.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("assets/images/3.png"),
                    radius: 75.0,
                      ),
                ),
              ),
              Container(
                height: 380.0,
                width: 400.0,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                      child: Container(
                        height: 45.0,
                        child: Form(
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,
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
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                              hintText: "Email Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                      child: Container(
                        height: 45.0,
                        child: Form(
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,
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
                              prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                              hintText: "Password Kiriting...",
                              hintStyle: TextStyle(fontSize: 14.0),
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0),
                      child: Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                          ),
                          onPressed: (){
                            setState(() {
                              final snackBar = SnackBar(
                                content: Text("""  Sign in Error\n  Invalid password."""),
                                action: SnackBarAction(
                                  label: "O`tkazib Yuborish",
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        barrierDismissible: false,
                                          context: context, 
                                          builder: (context){
                                            return AlertDialog(
                                              title: Text("Iltimos 5 sekund Bosing"),
                                              content: Container(
                                                height: 150.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset.infinite,
                                                      spreadRadius: 10.0,
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  borderRadius: BorderRadius.circular(15.0),
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/loading.gif"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: (){
                                                    setState(() {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Text("Qaytish",style: TextStyle(color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),),),
                                                SizedBox(width: 55.0,),
                                                TextButton(
                                                    onPressed: (){
                                                      setState(() {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                                      });
                                                    },
                                                    child: Text("O`tkazish",style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),),),
                                              ],
                                              backgroundColor: Colors.grey.withOpacity(0.6),
                                            );
                                          });
                                    });
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            });
                          },
                          child: Text("SIGN IN"),
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
                          child: Text("Forgot password?", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: (){},
                          child: Text("Create an Account", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(),
            ],
          ),
        ));
  }
}
