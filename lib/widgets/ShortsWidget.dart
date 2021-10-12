import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/ShortsInfo.dart';

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
    final heartAndCartSize = MediaQuery.of(context).size.width * 0.04;  //좋아요,장바구니 아이콘 크기
    const double GoodsNameSize = 20;

    return GestureDetector(
      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedGoodsScreen(widget.goodsInfo)));   //터치시 굿즈 디테일 창으로 이동
      }, 이전 굿즈 위젯용 터치 네비게이터*/
      child: Card(
        elevation: 2,   //그림자
        semanticContainer: true,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        clipBehavior: Clip.antiAliasWithSaveLayer,


      ),
    );
  }
}
