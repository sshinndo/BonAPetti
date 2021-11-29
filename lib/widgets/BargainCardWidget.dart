import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';
import 'package:pet_service_application/product/screen/DetailedGoodsScreen.dart';

class BargainCardWidget extends StatefulWidget {
  final GoodsInfo goodsInfo;  //굿즈 정보 객체

  BargainCardWidget({Key? key, required this.goodsInfo}) : super(key: key); //생성자

  @override
  _BargainCardWidget createState() => _BargainCardWidget(); //위젯 생성
}

class _BargainCardWidget extends State<BargainCardWidget> {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20); //테두리 반지름

  @override
  Widget build(BuildContext context) {
    final heartAndCartSize = MediaQuery.of(context).size.width * 0.04;  //좋아요,장바구니 아이콘 크기
    const double GoodsNameSize = 15;

    return GestureDetector(
      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedGoodsScreen(widget.goodsInfo)));   //터치시 굿즈 디테일 창으로 이동
      },*/
      child: Card(
        elevation: 5,   //그림자
        semanticContainer: true,
        margin: EdgeInsets.only(left:5,right:5,top:10,bottom:10),
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        clipBehavior: Clip.antiAliasWithSaveLayer,

        child: Row(
          children: [
            Container(
              width: heartAndCartSize * 6,
              height: heartAndCartSize * 6,

              child: Image.network(widget.goodsInfo.thumbnailUrl),
            ),  //상품 이미지
            Expanded(
              child: Column(
                children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top:10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.goodsInfo.name,
                        style: TextStyle(
                          fontSize: GoodsNameSize,
                        ),
                      )
                    ),  //커뮤니티 제목(임시로 상품이름)
                    Container(
                      margin: EdgeInsets.only(left: 10,bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(widget.goodsInfo.name)
                    ),  //상품 이름
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: getPriceTextSpan(widget.goodsInfo),
                                ),
                                )
                            ),
                          ),  //상품 가격
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
                                  }
                                  );
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: widget.goodsInfo.goodsDetailedInfo.isLike ? Color.fromRGBO(255, 87, 87, 1) : Color.fromRGBO(217, 217, 217, 1),
                                ),
                              ),  //좋아요 값 변경
                            ),
                          ),  //좋아요
                        ],
                      )
                    )//상품 가격과 좋아요
                ]
              )
            )//상품 정보와 좋아요
          ],
        ),
      ),
    );
  }

  List<TextSpan> getPriceTextSpan(GoodsInfo goodsInfo) {
    List<TextSpan> priceTextSpan = [];
    priceTextSpan.add(
      TextSpan(
        text: NumberFormat('###,###,###,###')
            .format(goodsInfo.price)
            .replaceAll(' ', '') +
            '원',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
    return priceTextSpan;
  } //상품 가격 불러오는 함수
}
