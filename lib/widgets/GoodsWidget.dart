import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';
import 'package:pet_service_application/product/screen/DetailedGoodsScreen.dart';

class GoodsCardWidget extends StatefulWidget {
  final GoodsInfo goodsInfo;  //굿즈 정보 객체

  GoodsCardWidget({Key? key, required this.goodsInfo}) : super(key: key); //생성자

  @override
  _GoodsCardWidget createState() => _GoodsCardWidget(); //위젯 생성
}

class _GoodsCardWidget extends State<GoodsCardWidget> {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20); //테두리 반지름

  @override
  Widget build(BuildContext context) {
    final heartAndCartSize = MediaQuery.of(context).size.width * 0.04;  //좋아요,장바구니 아이콘 크기

    return GestureDetector(
      onTap: () {
        // 터치시 굿즈 디테일 창으로 이동
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
              DetailedGoodsScreen(widget.goodsInfo)));
      },
      child: Card(
        elevation: 5,   //그림자
        semanticContainer: true,
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: heartAndCartSize,
                        height: heartAndCartSize,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.goodsInfo.goodsDetailedInfo.isLike =
                                  !widget.goodsInfo.goodsDetailedInfo.isLike;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: widget.goodsInfo.goodsDetailedInfo.isLike
                                ? Color.fromRGBO(255, 87, 87, 1)
                                : Color.fromRGBO(217, 217, 217, 1),
                          ),
                        ),  //좋아요 값 변경
                      ),
                    ),  //좋아요
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            '바로주문',
                            style: TextStyle(
                                color: Color.fromRGBO(168, 168, 168, 1)),
                          ),
                        )), //바로주문
                    Expanded(
                        flex: 1,
                        child: SizedBox())
                  ],
                ),
              ),
            ),  //좋아요,바로주문,장바구니 첫줄
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: heartAndCartSize * 5,
                  height: heartAndCartSize * 5,
                  child: Image.network(widget.goodsInfo.thumbnailUrl),
                ),
              ),
            ),  //굿즈 이미지
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.goodsInfo.name)),
            ),  //상품 이름
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 20, top: 5),
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: getPriceTextSpan(widget.goodsInfo),
                    ),
                  )),
            ),  //상품 가격
          ],
        ),
      ),
    );
  }

  List<TextSpan> getPriceTextSpan(GoodsInfo goodsInfo) {

    // 오픈마켓 상품 최저가를 lowestPrice에 대입
    int lowestPrice = [
      widget.goodsInfo.goodsDetailedInfo.coupang.price,
      widget.goodsInfo.goodsDetailedInfo.gmarket.price,
      widget.goodsInfo.goodsDetailedInfo.eleventhStreet.price].reduce(min);

    List<TextSpan> priceTextSpan = [];
    priceTextSpan.add(
      TextSpan(
        text: NumberFormat('###,###,###,###')
            .format(lowestPrice)
            .replaceAll(' ', '') +
            '원',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );

    return priceTextSpan;
  } //상품 가격 불러오는 함수
}
