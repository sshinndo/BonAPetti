import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';

class MyCommunityPage extends StatefulWidget {
  const MyCommunityPage({Key? key}) : super(key: key);
  @override
  _MyCommunityPageState createState() => _MyCommunityPageState();
}

class _MyCommunityPageState extends State<MyCommunityPage> {

  //initState()

  @override
  Widget build(BuildContext context) {
    const double nameSize = 20;
    const double textSize = 16;

    return Scaffold(
      body: ListView(
        children : [
          DrawerWithAlarmAppBar(nickName: UserInfo.userNickname), //닉네임 & 알림
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : [
              Image.asset(
                'images/loginIcon/icon_kakao.png',
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
              ),  //프로필 아이콘
              Text(
                //UserInfo.userNickname,
                '돌돌이',
                style: TextStyle(
                  fontSize: nameSize,
                  fontWeight: FontWeight.bold
                ),

              ),
              Container(
                margin: EdgeInsets.only(left: 5,right: 5),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(16.0),
                  color: Colors.grey
                ),
                child: Text(
                  //'팔로잉 '+UserInfo.following.toString()+' · 팔로워 '+UserInfo.follower.toString(),
                  '팔로잉 50 · 팔로워 50',
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]
          ),  //프로필 정보
          Row(

          ),  //글&쇼츠 올리기 버튼
          Column(

          ) //내 게시글 뷰
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}