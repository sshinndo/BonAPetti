import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/product/GoodsInfo.dart';
import 'package:pet_service_application/widgets/GoodsWidget.dart';
import 'package:pet_service_application/widgets/BargainCardWidget.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/community/screen/CommunityMainScreen.dart';
//import 'package:pet_service_application/log_in/screen/LogIn.dart';
//import 'package:pet_service_application/log_in/Splash.dart';
import 'package:pet_service_application/route/CardNewsListRoute.dart';
import 'package:pet_service_application/card_news/CardNewsPageView.dart';
import 'package:pet_service_application/product/screen/DetailedGoodsScreen.dart';
import 'package:pet_service_application/product/screen/search_screen.dart';
import 'package:pet_service_application/product/screen/goods_screen.dart';
import 'package:pet_service_application/product/screen/WishListScreen.dart';
import 'package:pet_service_application/widgets/ShortsWidget.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'log_in/class/UserData.dart';

// void main() => runApp(MyApp());
//
final String appName = "Pet App";
//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<CardNewsModel> cardNewsModelList = [];


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    if(Logger().petData.isEmpty)
      Logger().getMyPetList();
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

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/004.png',
          '고양이는 생선만\n먹어도 될까?',
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
          ],),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/016.png',
          '강아지는 하루에\n몇시간을 잘까?',
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            // GoodsInfo()
          ],),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/018.png',
          '왜 강아지의 코는\n촉촉할까?',
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            // GoodsInfo 넣을 자리
          ],),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/020.png',
          '강아지가 자기 발을\n핥는 이유는?',
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            // GoodsInfo() 넣을 자리
          ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    Logger().loggerDebugPrint();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
        children: <Widget>[
          AppBarWithAlarm(
            nickName: Logger().userData.name
          ),
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
                        margin: EdgeInsets.only(
                            top: 20.0, bottom: 20, left: 20, right: 50))),
                //더보기
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
                              //ImageIcon(AssetImage('images/bar.png')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  //검색창
                Container(
                  margin: EdgeInsets.only(left: 50, top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '당신과 함께하는',
                        style: TextStyle(fontSize: 32),
                      ),  //당신과 함께하는
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                Logger().getDefaultPet().petName,
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
                              ), //를 위한
                            ],
                          )
                      ),  //[petName]을 위한
                      Text(
                        '건강식단',
                        style: TextStyle(fontSize: 32),
                      ),  //건강식단
                    ],
                  ),
                ),    //사료 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) =>
                              GoodsScreenList()
                      ), //사료 정보들
                    ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //사료 더보기
                Container(
                  height: 350,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 1 개의 행에 보여줄 item 개수
                            childAspectRatio: 2 / 3, //item 의 가로 1, 세로 2 의 비율
                            mainAxisSpacing: 10, //수평 Padding
                            crossAxisSpacing: 10, //수직 Padding
                    ),
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return GoodsCardWidget(
                        goodsInfo: GoodsInfo(
                            product[i]["name"],
                            product[i]["thumbnailUrl"],
                            product[i]["price1"],
                            // product[i]["category"],
                            GoodsDetailedInfo(
                              false,
                              product[i]["grade"],
                              product[i]["detailDescriptionUrl1"],
                              product[i]["detailDescriptionUrl2"],
                              product[i]["detailDescriptionUrl3"],
                              product[i]["detailDescriptionUrl4"],
                              product[i]["allergicIngredients"], product[i]["ingredientImageUrl"],
                              GoodsVendor(product[i]["siteName1"],product[i]["price1"],product[i]["shippingFee1"],product[i]["goodsUrl1"]),
                              GoodsVendor(product[i]["siteName2"],product[i]["price2"],product[i]["shippingFee2"],product[i]["goodsUrl2"]),
                              GoodsVendor(product[i]["siteName3"],product[i]["price3"],product[i]["shippingFee3"],product[i]["goodsUrl3"]),)
                        ),
                      );
                    }
                  ),
                ),
                //사료 카드

                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '당신과 함께하는',
                        style: TextStyle(fontSize: 32),
                      ), //당신과 함께하는
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            Logger().getDefaultPet().petName,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 113, 113, 1),
                                decoration: TextDecoration.underline,
                                letterSpacing: 2.0,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ), //펫 이름
                          Text(
                            '를 위한',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ), //를 위한
                        ],
                      )), //PetName 위한
                      Text(
                        '알뜰장터!',
                        style: TextStyle(fontSize: 32),
                      ), //알뜰장터!
                    ],
                  ), //문장 한줄씩 수직 정렬
                ),
                //나눔 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GoodsScreen()
                          ), //사료 정보들
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //나눔 더보기 (작업전 임시)
                Container(
                  height: 600,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 2.5,
                    children: [
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                            product[5]["name"],
                            product[5]["thumbnailUrl"],
                            product[5]["price1"],
                            // product[5]["category"],
                            GoodsDetailedInfo(
                              false,
                              product[5]["grade"],
                              product[5]["detailDescriptionUrl1"],
                              product[5]["detailDescriptionUrl2"],
                              product[5]["detailDescriptionUrl3"],
                              product[5]["detailDescriptionUrl4"],
                              product[5]["allergicIngredients"], product[5]["ingredientImageUrl"],
                              GoodsVendor(product[5]["siteName1"],product[5]["price1"],product[5]["shippingFee1"],product[5]["goodsUrl1"]),
                              GoodsVendor(product[5]["siteName2"],product[5]["price2"],product[5]["shippingFee2"],product[5]["goodsUrl2"]),
                              GoodsVendor(product[5]["siteName3"],product[5]["price3"],product[5]["shippingFee3"],product[5]["goodsUrl3"]),)
                        ),
                      ),
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                            product[6]["name"],
                            product[6]["thumbnailUrl"],
                            product[6]["price1"],
                            // product[6]["category"],
                            GoodsDetailedInfo(
                              false,
                              product[6]["grade"],
                              product[6]["detailDescriptionUrl1"],
                              product[6]["detailDescriptionUrl2"],
                              product[6]["detailDescriptionUrl3"],
                              product[6]["detailDescriptionUrl4"],
                              product[6]["allergicIngredients"], product[6]["ingredientImageUrl"],
                              GoodsVendor(product[6]["siteName1"],product[6]["price1"],product[6]["shippingFee1"],product[6]["goodsUrl1"]),
                              GoodsVendor(product[6]["siteName2"],product[6]["price2"],product[6]["shippingFee2"],product[6]["goodsUrl2"]),
                              GoodsVendor(product[6]["siteName3"],product[6]["price3"],product[6]["shippingFee3"],product[6]["goodsUrl3"]),)
                        ),
                      ),  //훈제 나눔 카드
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                            product[7]["name"],
                            product[7]["thumbnailUrl"],
                            product[7]["price1"],
                            // product[7]["category"],
                            GoodsDetailedInfo(
                              false,
                              product[7]["grade"],
                              product[7]["detailDescriptionUrl1"],
                              product[7]["detailDescriptionUrl2"],
                              product[7]["detailDescriptionUrl3"],
                              product[7]["detailDescriptionUrl4"],
                              product[7]["allergicIngredients"], product[7]["ingredientImageUrl"],
                              GoodsVendor(product[7]["siteName1"],product[7]["price1"],product[7]["shippingFee1"],product[7]["goodsUrl1"]),
                              GoodsVendor(product[7]["siteName2"],product[7]["price2"],product[7]["shippingFee2"],product[7]["goodsUrl2"]),
                              GoodsVendor(product[7]["siteName3"],product[7]["price3"],product[7]["shippingFee3"],product[7]["goodsUrl3"]),)
                        ),
                      ),  //유기농 개사료 나눔 카드
                    ],
                  ),
                ),
                //나눔 카드(조정 필요)

                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '건강한 식단과',
                        style: TextStyle(fontSize: 32),
                      ), //건강한 식단과
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '함께하는 ',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),  //함께하는
                              Text(
                                '친구들',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 113, 113, 1),
                                  decoration: TextDecoration.underline,
                                  //letterSpacing: 2.0,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                                ),
                              ),  //친구들
                            ],
                          )
                      ),  //함께하는 친구들
                    ],
                  ), //문장 한줄씩 수직 정렬
                ),
                //친구들 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityMainScreen()),  //커뮤니티 페이지
                    ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //친구들 더보기 (작업전 임시)
                Container(
                  height: 400,
                  margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ShortsWidget(
                        shortsInfo: ShortsInfo(
                          'images/profile/sample_profile.png',
                          '돌돌이님',
                          '돌돌이님',
                          'images/shorts/shorts_thumb.png',
                          'images/shorts/shorts_thumb.png',
                          false
                        )
                      ),
                      ShortsWidget(
                          shortsInfo: ShortsInfo(
                              'images/profile/sample_profile.png',
                              '돌돌이님',
                              '돌돌이님',
                              'images/shorts/shorts_thumb.png',
                              'images/shorts/shorts_thumb.png',
                              false
                          )
                      ),
                      ShortsWidget(
                          shortsInfo: ShortsInfo(
                              'images/profile/sample_profile.png',
                              '돌돌이님',
                              '돌돌이님',
                              'images/shorts/shorts_thumb.png',
                              'images/shorts/shorts_thumb.png',
                              false
                          )
                      )
                    ],
                  )
                ),  //숏폼 카드
                Padding(padding: EdgeInsets.only(top: 52)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}
class GoodsScreenList extends StatelessWidget {
  const GoodsScreenList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoodsScreen();
  }
}
