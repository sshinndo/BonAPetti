import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/CardNewsModel.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/card_news_detail/CardNewsDetailRoute.dart';
import 'package:pet_service_application/CardNewsListRoute.dart';

import 'package:pet_service_application/SeungHyun/screen/search_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/goods_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/detail_goods_screen.dart';

class goodscard extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child: Card(
        elevation: 5.0,
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
                  Text('맛있는 개껌'),
                  Text('30,000원'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}