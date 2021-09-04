import "package:flutter/material.dart";

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: double.infinity,
      color: Color(0xfffafafa),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "SYSTEME DE SECURITE DES BANQUES",
            style: TextStyle(
              fontWeight: size.width > 650 ? FontWeight.bold : FontWeight.w400,
              fontSize: 18,
            ),
          ),
          if (size.width > 650)
            Container(
              child: Row(
                children: [
                  Container(
                    width: size.width / 3,
                    child: Text(
                      "Avec la technologie SSL, vos données personnelles sont toujours protégées",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "images/Secure.png",
                      width: 70,
                      height: 70,
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
