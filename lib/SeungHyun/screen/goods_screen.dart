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
import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';



class GoodsScreen extends StatefulWidget {
  @override
  _GoodsScreen createState() => _GoodsScreen();
}



class _GoodsScreen extends State<GoodsScreen> {
  final SearchBarController<Food> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Food>> _getALlFoods(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    if (isReplay) return [Food("Replaying !", "Replaying body")];
    if (text.length == 5) throw Error();
    if (text.length == 6) return [];
    List<Food> foods = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      foods.add(Food("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Food>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlFoods,
          searchBarController: _searchBarController,
          placeHolder: Text("placeholder"),
          //cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
          header: Row(
            children: <Widget>[
              RaisedButton(
                child: Text("sort"),
                onPressed: () {
                  _searchBarController.sortList((Food a, Food b) {
                    return a.description.compareTo(b.description);
                  });
                },
              ),
              RaisedButton(
                child: Text("Desort"),
                onPressed: () {
                  _searchBarController.removeSort();
                },
              ),
              RaisedButton(
                child: Text("Replay"),
                onPressed: () {
                  isReplay = !isReplay;
                  _searchBarController.replayLastSearch();
                },
              ),
            ],
          ),

          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Food food, int index) {
            return Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text(food.title),
                isThreeLine: true,
                subtitle: Text(food.description),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}