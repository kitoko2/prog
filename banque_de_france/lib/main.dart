import 'dart:async';

import 'package:banque_de_france/container1.dart';
import 'package:banque_de_france/myAppbar.dart';
import "package:flutter/material.dart";
import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Banque de france",
      home: MyHomme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomme extends StatefulWidget {
  const MyHomme({Key? key}) : super(key: key);

  @override
  _MyHommeState createState() => _MyHommeState();
}

class _MyHommeState extends State<MyHomme> with TickerProviderStateMixin {
  func() async {
    await DesktopWindow.setMinWindowSize(Size(400, 400));
  }

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  );
  late var anime =
      Tween<double>(begin: 0.1, end: 1).animate(animationController);

  bool isvisible = false;
  @override
  void initState() {
    super.initState();

    func();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(
                height: 30,
              ),
              containerone(size: size),
              Visibility(
                visible: isvisible,
                child: FadeTransition(
                  opacity: anime,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 600,
                    height: 300,
                    color: Colors.teal,
                  ),
                ),
              ),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      color: Color(0xff5e5e5e),
                      child: Center(
                        child: Text(
                          "Contactez-nous | Conditions générales de securité",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Platforme crée avec "),
                          Image.asset(
                            "images/logo_payfacile.png",
                            width: 100,
                          ),
                          Text("| Politique de sécurité"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  containerone({Size? size}) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 600,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Securiser ma carte",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  child: Center(
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (size!.width > 650)
                            Container(
                              child: Image.asset("images/ia.jpeg"),
                              width: 300,
                              height: 160,
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isvisible = !isvisible;
                                      Timer(Duration(seconds: 1), () {
                                        animationController.forward();
                                      });

                                      animationController.reset();
                                    });
                                  },
                                  child: Text("CONFIRMER"),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/logo_visa.png",
                                        width: 50,
                                        height: 30,
                                      ),
                                      Image.asset(
                                        "images/logo_mastercard.png",
                                        width: 50,
                                        height: 30,
                                      ),
                                      Image.asset(
                                        "images/logo_amex.png",
                                        width: 50,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Operation sécurisée par SSL",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
