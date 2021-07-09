import 'package:flutter/material.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/route/CardNewsListRoute.dart';
import 'package:pet_service_application/card_news/CardNewsPageView.dart';

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
      body: Center(
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
                child: ElevatedButton(
                  child: Text('Go to the Search_Screen'),
                  onPressed: () {
                    /*
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchRoute()));*/
                  },
                ),
              ),
              // 또 item 추가 가능
            ]),
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
