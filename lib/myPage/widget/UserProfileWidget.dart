import 'package:flutter/material.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';
import 'package:pet_service_application/mypage/widget/PetProfileWidget.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.09,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                // 프로필 이미지 설정란
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/profile/sample_profile.png',
                  fit: BoxFit.fill,
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(
                    left: width * 0.05),
                child: Column(
                  children: [
                    Row(
                      // <홍길동>님
                      children: [
                        Text(
                          UserInfo.userNickname,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '님',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "브론즈 등급",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
              children: [TextWidget(text: "안녕하세요! 세종이 입니다.")]
          )
        ],
      ),
      // + 유저 프로필 상태메시지 위젯
    );
  }
}
