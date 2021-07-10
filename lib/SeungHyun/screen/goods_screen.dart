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



class GoodsScreen extends StatefulWidget {
  @override
  _GoodsScreen createState() => _GoodsScreen();
}

class _GoodsScreen extends State<GoodsScreen> {
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
      Food('당근','식용','토끼',700),
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
        title: DrawerWithAlarmAppBar(nickName: '닉네임'),
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


          searchBarController: _searchBarController,


          placeHolder: Container(
            child: Column(
              children: <Widget>[
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
              ],
            ),
          ),
          //cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),

          minimumChars: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
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
          onItemFound: (Food food, int index) {
            return Column(
              children: <Widget>[
                Container(
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
                              Text('${food.price}원'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
         Padding(padding: EdgeInsets.all(12)),
         Container(
           height: 2.0,
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
   );
  }
}

