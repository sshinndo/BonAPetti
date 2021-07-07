library flappy_search_bar;

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


class SearchRoute extends StatelessWidget{

  Future<List<Food>> search(String search) async{
    await Future.delayed(Duration(seconds : 2));
    if (search == "empty") return [];
    if (search == 'error') throw Error();
    return List.generate(search.length , (int index){
      return Food(
        "Title : $search $index",
        "Description : $search $index",
      );
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
            children: <Widget>[

              DrawerWithAlarmAppBar(nickName: '닉네임'),
              GestureDetector (
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardNewsListRoute()),
                  ),
                  child: Container(
                  )),


              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBar<Food>(
                    onSearch: search,
                    placeHolder: Container(
                      child: Column(
                        children: <Widget>[

                          //인기검색어 argument 서버에서 받아서 여기에 저장하면 될듯
                          Text("인기검색어"),

                          Padding(
                              padding: EdgeInsets.all(32)
                          ),

                          //최근 검색어 argument 여기에 추가하면 됩니다.
                          Text('최근 검색어'),
                        ],
                      )
                    ),
                    onItemFound: (Food food, int index){
                      return ListTile(
                        title: Text(food.title),
                        subtitle: Text(food.description),
                      );
                    },
                  ),
                ),
              ),
            ]
        ),
      ),
    ) ;
  }
}


/*
    body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(),
        ),
      ),
 */