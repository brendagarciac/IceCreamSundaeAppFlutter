import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'About Screen',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'Handlee',
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.amber[100],
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.pink,
                  backgroundImage: AssetImage("assets/images/sundae.png"),
                ),
                Text(
                  "Sundae Maker",
                  style:
                  TextStyle(fontSize: 38.0, fontFamily: "Handlee"),
                ),
                Text(
                  'This app was created by\nBrenda Garcia',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 20.0, fontFamily: "Handlee"),
                ),
              ],
            ),
          )
      ),
    );
  }
}
