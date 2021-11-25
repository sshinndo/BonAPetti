import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/appbar/BackBtnAppBar.dart';
import 'package:pet_service_application/product/screen/each_wish_list_screen.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreen createState() => _WishListScreen();
}

class _WishListScreen extends State<WishListScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWithAlarm(nickName: '찜목록'),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 25)),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '전체선택',
                    style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 15),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '선택 삭제',
                    style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  )),
              Padding(padding: EdgeInsets.fromLTRB(255, 0, 0, 0)),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("images/bible_figma.png"),
                  size: 20,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Card(
              elevation: 5.0,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                height: 120,
                width: 100,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EachWishList()));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 25),
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 228, 228, 1),
                              ),
                            )),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 360, right: 20),
                                  child: Checkbox(
                                    checkColor: Colors.black12,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                        ),
                                        Text(
                                          '기본 폴더 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 245)),
                                              Container(
                                                child: Text('바로주문',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            168, 168, 168, 1))),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 50)),
                                              Container(
                                                child: ImageIcon(
                                                    AssetImage(
                                                        "images/shopping_cart_figma.png"),
                                                    size: 20,
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Card(
              elevation: 5.0,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                height: 120,
                width: 100,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EachWishList()));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 25),
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 228, 228, 1),
                              ),
                            )),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 360, right: 20),
                                  child: Checkbox(
                                    checkColor: Colors.black12,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                        ),
                                        Text(
                                          '기본 폴더 2',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 245)),
                                      Container(
                                        child: Text('바로주문',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    168, 168, 168, 1))),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 50)),
                                      Container(
                                        child: ImageIcon(
                                            AssetImage(
                                                "images/shopping_cart_figma.png"),
                                            size: 20,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
