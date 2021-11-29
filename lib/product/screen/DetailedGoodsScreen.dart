import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/product/model/IngredientModel.dart';
import 'package:pet_service_application/product/screen/shopping_basket.dart';
import 'package:pet_service_application/SquareCardPageView.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:url_launcher/url_launcher.dart';

// 상품 이미지 리스트
class DetailedGoodsScreen extends StatefulWidget {
  final GoodsInfo goodsInfo;
  DetailedGoodsScreen(this.goodsInfo);

  @override
  _DetailedGoodsScreenState createState() => _DetailedGoodsScreenState();
}

class _DetailedGoodsScreenState extends State<DetailedGoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentDetailedGoods(widget.goodsInfo),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}

class ContentDetailedGoods extends StatefulWidget {
  final GoodsInfo goodsInfo;

  ContentDetailedGoods(this.goodsInfo);

  @override
  _ContentDetailedGoods createState() => _ContentDetailedGoods();
}

class _ContentDetailedGoods extends State<ContentDetailedGoods> {

  int currentState = 1; // 카테고리 탭 이동 변수 controller
  int lowestPrice = 0; // 상품 최저가

  BorderRadius _baseBorderRadius = BorderRadius.circular(15); //테두리 반지름

  Future<void>? _launched;
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;

    // 오픈마켓 상품 최저가를 lowestPrice에 대입
    lowestPrice = [
      widget.goodsInfo.goodsDetailedInfo.coupang.price,
      widget.goodsInfo.goodsDetailedInfo.gmarket.price,
      widget.goodsInfo.goodsDetailedInfo.eleventhStreet.price].reduce(min);

    String thisAllergyImageUrl='';
    String thisAllergyContents='';
    switch(widget.goodsInfo.goodsDetailedInfo.allergicIngredients){
      case ('닭'):
        thisAllergyImageUrl = 'images/allergyIcon/chicken.png';
        thisAllergyContents = '닭고기';
        break;
      case ('닭,연어'):
        thisAllergyImageUrl = 'images/allergyIcon/chicken.png';
        thisAllergyContents = '닭고기, 생선';
        break;
      case ('대두(콩)'):
        thisAllergyImageUrl = 'images/allergyIcon/soybean.png';
        thisAllergyContents = '대두(콩)';
        break;
      case ('생선'):
        thisAllergyImageUrl = 'images/allergyIcon/fish.png';
        thisAllergyContents = '생선';
        break;
      case ('소'):
        thisAllergyImageUrl = 'images/allergyIcon/cow.png';
        thisAllergyContents = '소고기';
        break;
      case ('양'):
        thisAllergyImageUrl = 'images/allergyIcon/lamb.png';
        thisAllergyContents = '양고기';
        break;
      case ('연어'):
        thisAllergyImageUrl = 'images/allergyIcon/fish.png';
        thisAllergyContents = '생선';
        break;
      case ('오리'):
        thisAllergyImageUrl = 'images/allergyIcon/wheat.png';
        thisAllergyContents = '오리고기';
        break;
      default:
        break;
    }

    return ListView(
      children: [
        Column(
          children: [
            AppBarWithAlarm(
              nickName: Logger().userData.Name,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),

            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 45, right: 45, top: 30),
                child: Text(
                  widget.goodsInfo.name,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 30),

            // 상품 이미지 썸네일
            Container(
              width: width * 250,
              height: width * 250,
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Card(
                elevation: 3,
                semanticContainer: true,
                shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
                child:
                    Image.network(widget.goodsInfo.thumbnailUrl, fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 50),
            // 좋아요 및 최저가 Row 묶음
            Container(
              //color: Colors.blue,
              margin: EdgeInsets.symmetric(horizontal: width * 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // 좋아요 버튼
                  GestureDetector(
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: widget.goodsInfo.goodsDetailedInfo.isLike
                          ? Color.fromRGBO(255, 87, 87, 1)
                          : Color.fromRGBO(217, 217, 217, 1),
                    ),
                    onTap: () {
                      setState(() {
                        widget.goodsInfo.goodsDetailedInfo.isLike =
                            !widget.goodsInfo.goodsDetailedInfo.isLike;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "최저가",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        NumberFormat('###,###,###,###')
                                .format(lowestPrice)
                                .replaceAll(' ', '') +
                            '원',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // 가격은 일단 전역변수로 설정했는데 나중에 모델 불러올때 전역변수 자리에 모델.price 넣어주면 될거같음
                ],
              ),
            ),
            SizedBox(height: 60),
            categoryBanner(), // 카테고리 커스텀 배너
            if (currentState == 1) ProductDescriptionWidget(),
            if (currentState == 2) IngredientWidget(thisAllergyImageUrl,thisAllergyContents),
            if (currentState == 3) ReviewWidget(),
            if (currentState == 4) PriceCompareWidget(),
          ],
        ),
      ],
    );
  }

  Widget categoryBanner(){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: 70,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer, // 둥근 모서리 부분의 음영 또한 둥글지게 함
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 26.0),
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70,
                  //padding: EdgeInsets.only(top: 20),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        this.currentState = 1;
                      });
                    },
                    child: Text("상품설명",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,
                      decoration: currentState == 1 ? TextDecoration.underline: null,
                      decorationThickness: 4,
                    )),
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(
                  height: 70,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        this.currentState = 2;
                      });
                    },
                    child: Text("성분",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,
                        decoration: currentState == 2? TextDecoration.underline: null,
                        decorationThickness: 4,
                    )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        this.currentState = 3;
                      });
                    },
                    child: Text("리뷰",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,
                      decoration: currentState == 3? TextDecoration.underline: null,
                      decorationThickness: 4,
                    )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        this.currentState = 4;
                      });
                    },
                    child: Text("가격비교",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,
                      decoration: currentState == 4? TextDecoration.underline: null,
                      decorationThickness: 4,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ProductDescriptionWidget(){
    return Container(
        width:MediaQuery.of(context).size.width*0.7,
        //margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image.network(widget.goodsInfo.goodsDetailedInfo.detailDescriptionUrl1),
            SizedBox(height: 10),
            Image.network(widget.goodsInfo.goodsDetailedInfo.detailDescriptionUrl2),
            SizedBox(height: 10),
            Image.network(widget.goodsInfo.goodsDetailedInfo.detailDescriptionUrl3),
            SizedBox(height: 10),
            Image.network(widget.goodsInfo.goodsDetailedInfo.detailDescriptionUrl4),
            SizedBox(height: 10),
          ],
        )
    );
  }
  // 알러지 요소 이미지 위젯
  IngredientWidget(String url, String text){
    return Container(
        width:MediaQuery.of(context).size.width*0.7,
        //margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text("알러지 요소",
                textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:40),
            //--------------------------
            Container(
              width:MediaQuery.of(context).size.width*0.7,
              child: allergyIcon(url, text)
            ),
            //--------------------------
            SizedBox(height: 30),
            Text("영양 정보",
                textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Image.network(widget.goodsInfo.goodsDetailedInfo.ingredientImageUrl),
            SizedBox(height: 30),
          ],
        )
    );
  }
  allergyIcon(String url, String text){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
              child: Image.asset(url, fit: BoxFit.fill)
          ),
          SizedBox(height: 8),
          Text(text,style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
  ReviewWidget(){
    return Container(
        padding: EdgeInsets.only(top:50),
        child: Text("리뷰 구현 준비 중 입니다.")
    );
  }
  PriceCompareWidget(){
    return Container(
        width:MediaQuery.of(context).size.width*0.7,
        //margin: EdgeInsets.symmetric(horizontal: 15),
        //padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            SizedBox(height: 25),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                color: Color.fromRGBO(166, 0, 0, 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("아래 버튼을 누르면, 판매처로 이동이 가능합니다!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(242, 128, 128, 1)
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("판매처",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("가격",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("배송비",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 25,),

            ListTile(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(widget.goodsInfo.goodsDetailedInfo.coupang.goodsUrl);
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              tileColor: WHITE_GREY,
                  leading: Image.asset('images/product/logo_coupang.png',fit: BoxFit.fill,width:50,height:10),
                  title: Text(
                    NumberFormat('###,###,###,###')
                        .format(widget.goodsInfo.goodsDetailedInfo.coupang.price)
                        .replaceAll(' ', '') +
                        '원',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    NumberFormat('###,###,###,###')
                        .format(widget.goodsInfo.goodsDetailedInfo.coupang.shippingFee)
                        .replaceAll(' ', '') +
                        '원',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(widget.goodsInfo.goodsDetailedInfo.gmarket.goodsUrl);
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              leading: Image.asset('images/product/logo_gmarket.png',fit: BoxFit.fill,width:50,height:10),
              title: Text(
                NumberFormat('###,###,###,###')
                    .format(widget.goodsInfo.goodsDetailedInfo.gmarket.price)
                    .replaceAll(' ', '') +
                    '원',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                NumberFormat('###,###,###,###')
                    .format(widget.goodsInfo.goodsDetailedInfo.gmarket.shippingFee)
                    .replaceAll(' ', '') +
                    '원',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(widget.goodsInfo.goodsDetailedInfo.eleventhStreet.goodsUrl);
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              tileColor: WHITE_GREY,
              leading: Image.asset('images/product/logo_11st.png',fit: BoxFit.fill,width:50,height:10),
              title: Text(
                NumberFormat('###,###,###,###')
                    .format(widget.goodsInfo.goodsDetailedInfo.eleventhStreet.price)
                    .replaceAll(' ', '') +
                    '원',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                NumberFormat('###,###,###,###')
                    .format(widget.goodsInfo.goodsDetailedInfo.eleventhStreet.shippingFee)
                    .replaceAll(' ', '') +
                    '원',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50)
          ],
        )
    );
  }
}
