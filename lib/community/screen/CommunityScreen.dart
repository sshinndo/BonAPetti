import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class CommunityScreen extends StatefulWidget {

  CommunityScreen();

  @override
  _GoodsScreen createState() => _GoodsScreen();
}

class _GoodsScreen extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //세로로 나열 기준은 시작점 (제일 위부터)
        crossAxisAlignment: CrossAxisAlignment.center, //가로 나열 기준은 중심 (중심기준)
        children: [
          AppBarWithAlarm(nickName: UserInfo.userNickname),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20,left: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          '전체',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),  //전체
                      Text(
                          '친구',
                          style: TextStyle(
                              fontSize: 20
                          )
                      ),//순수 도그온 카드
                    ],
                  ),  //전체-친구 필터 텍스트
                ) //숏폼 필터 (제스쳐 추가 필요)
              ]
            )
          ),
          Container(child: MenuBottomBar()),
        ],
      ),
    );
  }
}
