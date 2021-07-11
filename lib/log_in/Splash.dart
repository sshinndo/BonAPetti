import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_service_application/log_in/LogIn.dart';
import 'package:pet_service_application/main.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LogIn())));

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        child: Image.asset(
            'images/logo_main.png'
        ),
        width: 192,
        height: 192,
      ),
    );
  }
}
