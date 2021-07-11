import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/DetailedGoodsScreen.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news/detail/CardNewsRelatedProductsWidget.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/log_in/LogIn.dart';
import 'package:pet_service_application/log_in/Splash.dart';
import 'package:pet_service_application/route/CardNewsListRoute.dart';
import 'package:pet_service_application/card_news/CardNewsPageView.dart';

import 'package:pet_service_application/SeungHyun/screen/search_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/goods_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/wish_list_screen.dart';

void main() => runApp(MyApp());

final String appName = "Pet App";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<CardNewsModel> cardNewsModelList = [];

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadData();
  }

  void loadData() {
    // 남아있는 데이터 모두 제거
    widget.cardNewsModelList.clear();

    // 서버에서 데이터 불러오고 cardNewsModelList에 추가
    // 현재는 더미데이터
    CardNewsModel _cardNewsEventItem = CardNewsModel(
        CardNewsType.CARDNEWS,
        'https://picsum.photos/250?image=9',
        "과연 고양이는 생선만\n먹어도 괜찮을까?",
        null,
        null,
        List.filled(
            5,
            DetailCardNewsModel('https://picsum.photos/250?image=9',
                "과연 고양이는 생선만\n먹어도 괜찮을까? 2")),
        null);
    for (int i = 0; i < 10; i++)
      widget.cardNewsModelList.add(_cardNewsEventItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
        children: <Widget>[
          DrawerWithAlarmAppBar(nickName: '닉네임'),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardNewsListRoute(
                                  cardNewsModelList: widget.cardNewsModelList)),
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("더보기 >",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                        margin: EdgeInsets.all(20.0))),
                Container(
                    height: 300,
                    child: CardNewsPageView(
                        cardNewsModelList: widget.cardNewsModelList)),
                // 여기부분 부터 합치면 됩니다
                //검색 창 그림만들기 -> 클릭하면 다른 라우터로 이동합니다.
                // Expand 필요할 수도 있음
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchRoute()));
                    },
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.only(left: 50, top: 20, right: 50),
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
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, top: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '당신과 함께하는',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '사탕이',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 113, 113, 1),
                            decoration: TextDecoration.underline,
                            letterSpacing: 2.0,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '를 위한',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '건강식단',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoodsScreen()),
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                Container(
                  height: 600,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: [
                      CardNewsRelatedProductCardWidget(
                        relatedProductModel: CardNewsRelatedProductModel(
                            'imgurl', '피부모질 닥터독 사료 2kg', 29500, null),
                      ),
                      CardNewsRelatedProductCardWidget(
                        relatedProductModel: CardNewsRelatedProductModel(
                            'imgurl', '피부모질 닥터독 사료 2kg', 29500, 26500),
                      ),
                      CardNewsRelatedProductCardWidget(
                        relatedProductModel: CardNewsRelatedProductModel(
                            'imgurl', '피부모질 닥터독 사료 2kg', 29500, null),
                      ),
                      CardNewsRelatedProductCardWidget(
                        relatedProductModel: CardNewsRelatedProductModel(
                            'imgurl', '피부모질 닥터독 사료 2kg', 29500, 19800),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 52)),
              ],
            ),
          ),
        ],
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Drawer(
          child: Column(
            //padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child:
                              Icon(Icons.arrow_back, color: Colors.grey[850]),
                          margin: EdgeInsets.all(20.0))),
                  GestureDetector(
                      onTap: () => {
                            //Navigator.push(context,Setting);
                          },
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.settings, color: Colors.grey[850]),
                          margin: EdgeInsets.all(20.0))),
                ],
              ),
              SizedBox(height: 130.0),
              CircleAvatar(
                radius: 110.0,
                backgroundColor: Color.fromRGBO(255, 113, 113, 1),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('images/logo_main.png'),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                '[펫이름]과 함께하는\n[닉네임]님',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                //'$PetName과 함께하는\n$NickName님'
              ),
              SizedBox(height: 60.0),
              ListTile(
                title: Text(
                  '친구의 정보',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print('Profile is clicked');
                },
                //trailing: Icon(Icons.add) : +키 생략
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                // leading: Icon(
                //   Icons.check_box_outlined,
                //   color: Colors.grey[850],
                // ),
                title: Text(
                  '찜 목록',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wish_List_Screen()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                // leading: Icon(
                //   Icons.shopping_cart_outlined,
                //   color: Colors.grey[850],
                // ),
                title: Text(
                  '장바구니',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print('shopping_cart is clicked');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login_outlined,
                  color: Colors.grey[850],
                ),
                title: Text('로그인 하기'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Splash()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
