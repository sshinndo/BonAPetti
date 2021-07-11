import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/model/IngredientModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';

class DetailedGoodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DrawerWithAlarmAppBar(
          nickName: '닉네임',
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: ContentDetailedGoods(),
      //여기에 bottombar 추가하면됨
    );
  }
}

int price = 29500;

class ContentDetailedGoods extends StatefulWidget {
  @override
  _ContentDetailedGoods createState() => _ContentDetailedGoods();
}

class _ContentDetailedGoods extends State<ContentDetailedGoods> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            // 상품 관련된 컨테이너
            child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20)),

            Text(
              '검색 바 표시 될 곳',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: 20)),

            Text(
              '상품 정보 표시 될 곳',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: 20)),

            Container(
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 45)),
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Color.fromRGBO(255, 87, 87, 1),
                  ),
                  Padding(padding: EdgeInsets.only(left: 300)),
                  Text(
                    '${price}원',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ), // 가격은 일단 전역변수로 설정했는데 나중에 모델 불러올때 전역변수 자리에 모델.price 넣어주면 될거같음
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              // 실선 만들기
              height: 1.0,
              width: 400.0,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),

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

            IngredientList(), // 상품 알러지 밑 성분표 같은거 밑으로 빼놓음
          ],
        )),
      ],
    );
  }
}

class IngredientList extends StatefulWidget {
  @override
  _IngredientList createState() => _IngredientList();
}

// Dummy Data of IngredientModel
List<IngredientModel> dummyIngredientModelList = [
  //알러지요소, 비타민, 성분, 성분 양 순서임
  IngredientModel(['쌀', '대두', '연어'], ['조지방', '조단백질', '칼슘', '인'],
      ['A', 'E', 'D3'], [6, 25, 0.8, 0.6])
  // 값은 하나만 넣었습니당 나중에 상품 Model에다가 하위 모델로 IngredientModel 넣으면 될듯
];

class _IngredientList extends State<IngredientList> {
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
                            dummyIngredientModelList[0].Allergy_Factor[0],
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
                            dummyIngredientModelList[0].Allergy_Factor[1],
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
                            dummyIngredientModelList[0].Allergy_Factor[2],
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
                              '조지방',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(255, 113, 113, 1)),
                            ),
                            Text('(19%)',
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
                            Text('칼슘',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                            Text('(2%)',
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
                            Text('인',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 113, 113, 1))),
                            Text('(1%)',
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
                  child: Image.asset('images/ingredient_bar.png'),
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
                              dummyIngredientModelList[0].Ingredient_Factor[0],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                                '${dummyIngredientModelList[0].Ingredient_Amount[0]}%',
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
                            Text(
                                dummyIngredientModelList[0]
                                    .Ingredient_Factor[1],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                                '${dummyIngredientModelList[0].Ingredient_Amount[1]}%',
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
                            Text(
                                dummyIngredientModelList[0]
                                    .Ingredient_Factor[2],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                                '${dummyIngredientModelList[0].Ingredient_Amount[0]}%',
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
                            Text(
                                dummyIngredientModelList[0]
                                    .Ingredient_Factor[3],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                                '${dummyIngredientModelList[0].Ingredient_Amount[0]}%',
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
                            '비타민',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Text(
                            dummyIngredientModelList[0].Vitamin_Factor[0],
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
                            '비타민',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Text(
                            dummyIngredientModelList[0].Vitamin_Factor[1],
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
                            '비타민',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Text(
                            dummyIngredientModelList[0].Vitamin_Factor[2],
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
                  child: Image.asset('images/goods_test_image.png'),
                ),
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
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
                        '장바구니 넣기',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                ),
                Card(
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
