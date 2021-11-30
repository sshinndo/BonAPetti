import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/product/screen/shopping_basket.dart';
import 'package:pet_service_application/SquareCardPageView.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet_service_application/product/widget/CategoryWidget.dart';

// 상품 이미지 리스트
final List<String> goodsImgList = [
  "https://github.com/DragonTrainerTristana/Food_App_Project_Image_Asset/blob/main/Dog_Detail_Image/4/1.png?raw=true",
  "https://github.com/DragonTrainerTristana/Food_App_Project_Image_Asset/blob/main/Dog_Detail_Image/4/2.png?raw=true",
  "https://github.com/DragonTrainerTristana/Food_App_Project_Image_Asset/blob/main/Dog_Detail_Image/4/3.png?raw=true"
];

class DetailedGoodsScreen extends StatelessWidget {
  final GoodsInfo goodsInfo;
  DetailedGoodsScreen(this.goodsInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentDetailedGoods(goodsInfo),
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
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;

    SquareCardPageView squareCardPageView = SquareCardPageView(
        imgUrlList: widget.goodsInfo.detailedInfo.imageUrlList);

    return ListView(
      children: [
        AppBarWithAlarm(
          nickName: Logger().userData.name,
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

        // 상품 이미지 슬라이드
        Container(
          height: 290,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Swiper(
              pagination: SwiperPagination(
                  // 쪽매김
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomCenter,
                  // 나머지 점(dots) 재설정
                  builder: DotSwiperPaginationBuilder(
                      space: 6,
                      // 점 사이 공간
                      color: GREY,
                      size: 6,
                      // 나머지 점
                      activeColor: GREY,
                      activeSize: 12 // 강조 점
                      )),

              viewportFraction: 0.5,
              // 사진 간의 간격
              loop: false,
              // 슬라이드 재 반복 여부
              itemCount: goodsImgList.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(goodsImgList[index]);
              },
            ),
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
                  color: widget.goodsInfo.detailedInfo.isLike
                      ? Color.fromRGBO(255, 87, 87, 1)
                      : Color.fromRGBO(217, 217, 217, 1),
                ),
                onTap: () {
                  setState(() {
                    widget.goodsInfo.detailedInfo.isLike =
                        !widget.goodsInfo.detailedInfo.isLike;
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
                            .format(widget.goodsInfo.price)
                            .replaceAll(' ', '') +
                        '원',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // 가격은 일단 전역변수로 설정했는데 나중에 모델 불러올때 전역변수 자리에 모델.price 넣어주면 될거같음
            ],
          ),
        ),
        SizedBox(height: 60),

        // 카테고리 메뉴
        // CategoryTabcontroller(),

        Padding(padding: EdgeInsets.only(top: 70)),

        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '알러지 요소',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              )
            ],
          ),
        ),

        IngredientList(widget.goodsInfo),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;
    return Container(
      height: height * 50,
      width: width * 330,
      child:
      Card(
        //semanticContainer: false, // card 안에 단일 기능일 시 true, 여러 개의 기능인 경우 false
        clipBehavior: Clip.antiAliasWithSaveLayer, // 둥근 모서리 부분의 음영 또한 둥글지게 함
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          color: Colors.blue,
          //color: Color.fromRGBO(138, 149, 146, 0.2),
          margin: EdgeInsets.symmetric(horizontal: width*26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                  child: categoryMenu("상품설명",(){})),
              categoryMenu("성분",(){}),
              categoryMenu("리뷰",(){}),
              categoryMenu("가격비교",(){}),
            ],
          ),
        ),
      ),
    );
  }

  Expanded categoryMenu(String name, VoidCallback voidCallback) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
                onTap: voidCallback,
                child: Text(name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
    );
  }
}

class IngredientList extends StatefulWidget {
  final GoodsInfo goodsInfo;

  IngredientList(this.goodsInfo);

  @override
  _IngredientList createState() => _IngredientList();
}

class _IngredientList extends State<IngredientList> {
  List<Ingredient> barList = [];
  List<Ingredient> circleList = [];

  @override
  void initState() {
    super.initState();
    widget.goodsInfo.detailedInfo.ingredientList.forEach((element) {
      if (element.amount != null)
        barList.add(element);
      else
        circleList.add(element);
    });
  }

  Widget getRowIngredientBar() {
    List<Widget> tmpWidgetList = [];
    List<Color> colorList = [
      Color.fromRGBO(255, 113, 113, 1),
      Color.fromRGBO(255, 152, 152, 1),
      Color.fromRGBO(255, 184, 184, 1),
      Color.fromRGBO(255, 217, 217, 1)
    ];
    int i = 0;
    barList.forEach((element) {
      tmpWidgetList.add(Expanded(
        child: Container(
          color: colorList[i],
          child: i == 0
              ? Center(
                  child: Text(
                    '${element.name} (${element.amount}%)',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
        ),
        flex: element.amount!,
      ));
      i++;
    });

    return Row(children: tmpWidgetList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 55)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            //dummyIngredientModelList[0].Allergy_Factor[0],
                            widget.goodsInfo.detailedInfo.allergyFactorList[0],
                            style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
                Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.goodsInfo.detailedInfo.allergyFactorList[1],
                            style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
                Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.goodsInfo.detailedInfo.allergyFactorList[2],
                            style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 120)),
                Text(
                  '성분표',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 360)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              barList[1].name.toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(255, 113, 113, 1)),
                            ),
                            Text('${barList[1].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 25)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(barList[2].name.toString(),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                            Text('${barList[2].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 3)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(barList[3].name.toString(),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                            Text('${barList[3].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: getRowIngredientBar(),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 90)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              barList[0].name.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text('${barList[0].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 65)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(barList[1].name.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text('${barList[1].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 65)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(barList[2].name.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text('${barList[2].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 65)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(barList[3].name.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text('${barList[3].amount}%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          ),

          //비타민
          Container(
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 100)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            circleList[0].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            circleList[1].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            circleList[2].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 193, 193, 1),
                      )),
                ),
              ],
            ),
          ),
          //비타민

          Padding(padding: EdgeInsets.only(top: 120)),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '상품 상세',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Image.network(widget.goodsInfo.detailedInfo.bannerUrl),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(right: 10),
                  color: Color.fromRGBO(255, 113, 113, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 200,
                    child: FlatButton(
                      onPressed: () {
                        /*
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Shopping_Basket()));
                                */
                      },
                      child: Text(
                        '장바구니 넣기',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(left: 10),
                  color: Color.fromRGBO(255, 113, 113, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 200,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        '바로 주문',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
