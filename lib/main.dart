import 'package:flutter/material.dart';
import 'package:pet_service_application/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news_detail/CardNewsDetailRoute.dart';
import 'package:pet_service_application/CardNewsListRoute.dart';

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
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                            builder: (context) => CardNewsListRoute()),
                      ),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("더보기 >"),
                      margin: EdgeInsets.all(20.0))),
              Expanded(flex: 2, child: CardNewsPageView()),
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

class CardNews extends StatelessWidget {
  final CardNewsModel cardNewsModel;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(8);

  CardNews({Key? key, required this.cardNewsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardNewsDetailRoute()),
            ),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
          child: Image.network(
            cardNewsModel.imgUrl,
            fit: BoxFit.fill,
          ),
        ));
  }
}

class CardNewsPageView extends StatefulWidget {
  @override
  _CardNewsPageView createState() => _CardNewsPageView();
}

class _CardNewsPageView extends State<CardNewsPageView> {
  List<CardNews> cardNewsList = [];

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(viewportFraction: 0.85, initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: cardNewsList,
    );
  }
}
