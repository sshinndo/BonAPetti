import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/each_wish_list_screen.dart';

class Wish_List_Screen extends StatefulWidget {
  @override
  _Wish_List_Screen createState() => _Wish_List_Screen();
}

class _Wish_List_Screen extends State<Wish_List_Screen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        title: Text(
          '찜목록',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
        elevation: 0,
      ),
      body: ListView(
        children: [
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
                padding: EdgeInsets.all(32),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '선택 삭제',
                    style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  )),
              Padding(padding: EdgeInsets.fromLTRB(215, 0, 0, 0)),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("images/biblefigma.png"),
                  size: 20,
                  color: Colors.black26,
                ),
              ),
            ],
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
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                padding: EdgeInsets.only(left: 330, right: 20),
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
                              Padding(padding: EdgeInsets.only(top: 12)),
                              Container(
                                padding: EdgeInsets.only(right: 200),
                                child: Text(
                                  '기본 폴더 1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 250, right: 20),
                                      child: Text(
                                        '바로주문',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                168, 168, 168, 1)),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 20),
                                      child: ImageIcon(
                                          AssetImage(
                                              "images/shoppingcartfigma.png"),
                                          size: 20,
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1)),
                                    ),
                                  ],
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
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                height: 120,
                width: 100,
                child: FlatButton(
                  onPressed: () {},
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
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                padding: EdgeInsets.only(left: 330, right: 20),
                                child: Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 12)),
                              Container(
                                padding: EdgeInsets.only(right: 200),
                                child: Text(
                                  '기본 폴더 2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 250, right: 20),
                                      child: Text(
                                        '바로주문',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                168, 168, 168, 1)),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 20),
                                      child: ImageIcon(
                                          AssetImage(
                                              "images/shoppingcartfigma.png"),
                                          size: 20,
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1)),
                                    ),
                                  ],
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
