import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/route/CardNewsListRoute.dart';
import 'package:pet_service_application/card_news/CardNewsPageView.dart';

import 'package:pet_service_application/SeungHyun/screen/search_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/goods_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/detail_goods_screen.dart';
import 'package:pet_service_application/SeungHyun/Widget/GoodsCard.dart';
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
      body: ListView(
        children: <Widget>[
           DrawerWithAlarmAppBar(nickName: '닉네임'),Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
            children: <Widget>[
              // appbar 부분 구현
              DrawerWithAlarmAppBar(nickName: '닉네임'),
              GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardNewsListRoute(
                                cardNewsModelList: widget.cardNewsModelList)),
                      ),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("더보기 >"),
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
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchRoute()));

            },
            child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.only(left: 30,right: 30),
            child: SizedBox(
              height: 50,
              width: 100,
              child: Container(
                color: Color.fromRGBO(254, 254, 254, 1),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Icon(Icons.search,size: 30,color: Color.fromRGBO(217, 217, 217, 1),),
                    ImageIcon(AssetImage('images/barbar.png')),
                  ],
                ),
              ),
            ),),
          ),
         ),

          Padding(padding: EdgeInsets.all(32)),

          Container(
            margin: EdgeInsets.only(left: 30),
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
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Text(
                  '사탕이',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 113, 113, 1),
                        decoration: TextDecoration.underline,
                        letterSpacing: 2.0,
                        fontSize: 32,fontWeight: FontWeight.bold
                    ),
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
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Text(
                  '건강 식단',
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
                  child: Text("더보기 >"),
                  margin: EdgeInsets.all(20.0))),


          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                goodscard(),
                goodscard(),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                goodscard(),
                goodscard(),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 52)),
          Container(
            margin: EdgeInsets.only(left: 30,right : 30),
            child:  RaisedButton.icon(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wish_List_Screen()));

              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text('찜목록',
                style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.search, color:Colors.white,),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.green,),
          ),
        ],
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


    );
  }
}
