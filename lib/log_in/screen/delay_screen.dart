import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_service_application/log_in/screen/LogIn.dart';
import 'package:pet_service_application/main.dart';


class Delay_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 10),
            () =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => MyHomePage())));

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        child: SvgPicture.asset('images/logo_main.svg'),
        width: 192,
        height: 192,
      ),
    );
  }
}
