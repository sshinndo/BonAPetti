library flappy_search_bar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:pet_service_application/SeungHyun/model/foods_list.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'dart:math';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news_detail/CardNewsDetailRoute.dart';
import 'package:pet_service_application/CardNewsListRoute.dart';
import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/detail_goods_screen.dart';
import 'package:pet_service_application/SeungHyun/Widget/GoodsCard.dart';




class SearchRoute extends StatefulWidget {
  @override
  _SearchRoute createState() => _SearchRoute();
}

class _SearchRoute extends State<SearchRoute> {
  final SearchBarController<Food> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Food>> _getALlFoods(String text) async {
    //await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    //if (isReplay) return [Food("Replaying !", "Replaying body")];
    //if (text.length == 5) throw Error();
    //if (text.length == 6) return [];
    List<Food> foods = [

      Food('개껌','씹는 껌', '강아지',3000),
      Food('나비막대기','놀이용','고양이',2500),
      Food('톱밥','생존용','햄스터',2000),
    ];
    /*
    var random = new Random();
    for (int i = 0; i < 10; i++) {
      foods.add(Food("$text $i", "body random number : ${random.nextInt(100)}"));
    }

     */
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: (){Navigator.pop(context,null);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            Text('닉네임', style: TextStyle(color: Colors.black),),
            Icon(Icons.alarm,color: Colors.black,),
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),



      body: SafeArea(
        child: SearchBar<Food>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlFoods,
          header: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(12)),
                Container(
                  height: 1.0,
                  width: 500.0,
                  color: Colors.black,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: (){
                          setState(() {
                            a++;
                            if (a % 2 ==0){
                              _price = '가격낮은순';
                            }
                            else{
                              _price = '가격높은순';
                            }
                          });
                          if (a % 2 == 0){
                            _searchBarController.sortList((Food a, Food b){
                              return a.price.compareTo(b.price);
                            });
                          }
                          else{
                            _searchBarController.removeSort();
                          }
                        },
                        child: Text(_price),
                      ),
                      Padding(padding: EdgeInsets.all(32)),
                      Text('리뷰많은순'),
                      Padding(padding: EdgeInsets.all(32)),
                      Text('인기순'),
                      Padding(padding: EdgeInsets.all(32)),
                      Text('종류'),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(0)),
              ],
            ),
          ),

          searchBarController: _searchBarController,


          placeHolder: GoodsList(),
          //cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          //indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),

          minimumChars: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,



          onItemFound: (Food food, int index) {
            return Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),

                child: SizedBox(
                  height: 220,
                  width: 220,
                  child: FlatButton(
                    onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => DetailedGoodsScreen()));},
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Icon(Icons.favorite),
                                ),
                                Text(
                                    '바로주문'
                                ),
                                GestureDetector(
                                  child: Icon(Icons.shopping_cart),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child:  Image.asset('images/goodstestimage.png'),
                          ),
                          Text(food.title),
                          Text('${food.price}'),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
            );
          },
        ),
      ),
    );
  }
}

String _price = '가격낮은순';
int a = 1;

class GoodsList extends StatefulWidget{
  _GoodsList createState() => _GoodsList();
}


class _GoodsList extends State<GoodsList>{
  @override

  Widget build(BuildContext context){
   return Container(
     child: Column(
       children: <Widget>[
         Padding(padding: EdgeInsets.all(20)),
         Text('최근 검색어'),
         Padding(padding: EdgeInsets.all(20)),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             _buildHashTagButton('#강아지'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#고양이'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#햄스터'),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             _buildHashTagButton('#기니피그'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#카멜레온'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#오소리'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#너구리'),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             _buildHashTagButton('#앵무새'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#사자'),
             Padding(padding: EdgeInsets.all(20)),
             _buildHashTagButton('#호랑이'),
           ],
         ),

         Padding(padding: EdgeInsets.all(20)),
         Text('인기 검색어'),
       ],
     ),
   );


  }
}

ElevatedButton _buildHashTagButton(String buttonText) {
  return ElevatedButton(
      child: Text(buttonText),
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(246, 246, 246, 1),
          onPrimary:  Color.fromRGBO(255, 113, 113, 1),
          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 7),
          textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
          ),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          )
      )
  );
}
