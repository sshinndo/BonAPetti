import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'package:pet_service_application/community/screen/ShortsScreen.dart';

class ShortsWidget extends StatefulWidget {
  final ShortsInfo shortsInfo;  //쇼츠 정보 객체

  ShortsWidget({Key? key, required this.shortsInfo}) : super(key: key); //생성자

  @override
  _ShortsWidget createState() => _ShortsWidget(); //위젯 생성
}

class _ShortsWidget extends State<ShortsWidget> {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20); //테두리 반지름

  @override
  Widget build(BuildContext context) {
    final profileIconSize = MediaQuery.of(context).size.width * 0.08;  //프로필 아이콘 크기
    const double nameSize = 15;

    return GestureDetector(
      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShortsScreen(widget.shortsInfo)));   //터치시 숏폼 창으로 이동
      },*/
      child: Card(
        elevation: 2,   //그림자
        semanticContainer: true,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        clipBehavior: Clip.antiAliasWithSaveLayer,

        child: Stack(
          children: [//Image.network
            Image.asset(
                widget.shortsInfo.thumbnailUrl,
                fit: BoxFit.cover), //썸네일
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                widget.shortsInfo.petName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: nameSize,
                  )
                )
            ),  //펫 이름
            Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: profileIconSize,
                      height: profileIconSize,
                      child: Image.asset(
                        widget.shortsInfo.profileImage,
                        fit: BoxFit.fitHeight
                      )
                    ),
                    Text(
                        widget.shortsInfo.nickName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: nameSize,
                        )
                    )
                  ],
                )
            )
          ]
        )

      ),
    );
  }
}
