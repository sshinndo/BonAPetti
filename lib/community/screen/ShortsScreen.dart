import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/ShortsInfo.dart';


class ShortsScreen extends StatefulWidget {
  final ShortsInfo shortsInfo;
  ShortsScreen(this.shortsInfo);

  @override
  _ShortsScreen createState() => _ShortsScreen();
}

class _ShortsScreen extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, //세로로 나열 기준은 시작점 (제일 밑부터)
        crossAxisAlignment: CrossAxisAlignment.center, //가로 나열 기준은 중심 (중심기준)
        children: [

        ],
      ),
    );
  }
}
