import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';
import 'package:pet_service_application/ShortsInfo.dart';
import 'package:pet_service_application/widgets/ShortsWidget.dart';

class CommunityScreen extends StatefulWidget {

  CommunityScreen();

  @override
  _CommunityScreen createState() => _CommunityScreen();
}

class _CommunityScreen extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //세로로 나열 기준은 시작점 (제일 위부터)
        crossAxisAlignment: CrossAxisAlignment.center, //가로 나열 기준은 중심 (중심기준)
        children: [
          DrawerWithAlarmAppBar(nickName: UserInfo.userNickname),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    /*onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchRoute()));
                    },*/
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 30),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Color.fromRGBO(254, 254, 254, 1),
                          child: Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(
                                Icons.search,
                                size: 30,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                              //ImageIcon(AssetImage('images/barbar.png')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  //검색창
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
                ), //숏폼 필터 (제스쳐 추가 필요)
                Container(
                    height: 400,
                    margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/profile_icon.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        ),
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/profile_icon.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        ),
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/profile_icon.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        )
                      ],
                    )
                ),
              ]
            )
          ),
          Container(child: MenuBottomBar()),
        ],
      ),
    );
  }
}
