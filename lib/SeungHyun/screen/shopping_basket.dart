
import 'package:flutter/material.dart';


class Shopping_Basket extends StatefulWidget{
  @override
  _Shopping_Basket createState() => _Shopping_Basket();
}

class _Shopping_Basket extends State<Shopping_Basket>{
  bool isChecked = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          '장바구니',
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
                  onPressed: (){},
                  child: Text(
                    '전체선택',
                    style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(32),
              ),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    '선택 삭제',
                    style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),

                  )
              ),
              Padding(padding: EdgeInsets.fromLTRB(215,0,0,0)),
            ],
          ),


          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
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
                  onPressed: (){
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Container(
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
                                child: Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 0,right: 50),),
                                    Text('임시 텍스트'),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 12)),
                              Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '가격표시',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(left: 208)),
                                      Checkbox(
                                        value: isChecked,
                                        onChanged:(bool ? value){
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  )
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