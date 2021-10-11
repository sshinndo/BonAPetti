import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class Qna extends StatefulWidget {
  final String nickName;
  const Qna({Key? key, required this.nickName}) : super(key: key);

  @override
  _QnaState createState() => _QnaState();
}

class _QnaState extends State<Qna> {

  Widget _appbarWidget(){
    return AppBarWithAlarm(nickName: UserInfo.userNickname);
  }

  Widget _bodyWidget() {
    return SafeArea(
      child: Column(
          children: [Text("QnA")]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appbarWidget(),
      body: _bodyWidget(),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
