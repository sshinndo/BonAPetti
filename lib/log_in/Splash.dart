import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_service_application/log_in/screen/LogIn.dart';

import 'class/UserData.dart';

void main() => runApp(MyAppSplash());

final String appName = "Pet App";

class MyAppSplash extends StatelessWidget {
  //파이어베이스 스테이트
  bool _initialized = false;
  bool _error = false;

  //파이어베이스 이니셜
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
        _initialized = true;
    } catch (e) {
        _error = true;
    }
  }

  //펫 초기 정보 불러오기
  void initialPetListData() async {
    var petDocument = await FirebaseFirestore.instance.collection('Manage').doc('PetType').get();
    if(petDocument.data() == null)
      throw Exception('Server Manager Connect Fail');
    petDocument.data()!.forEach((key,value) {
      PetInfo.petTypeNameList[key.toString()] = List.from(value);
    });

  }

  @override
  Widget build(BuildContext context) {
    initialPetListData();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash());
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => LogIn())));

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
