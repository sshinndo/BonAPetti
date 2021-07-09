import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/shopping_basket.dart';

class EachWishList extends StatefulWidget{
  @override
  _EachWishList createState() => _EachWishList();
}

List<ProductModel> dummyProductModelList = [
  ProductModel('개구리', 'abc', 200, false),
  ProductModel('지렁이', 'abc', 200, false),
  ProductModel('타란튤라', 'abc', 200, false),
  ProductModel('전갈', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
];
int a = 1;

class _EachWishList extends State<EachWishList>{

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
          '찜목록',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 25)),
              TextButton(
                  onPressed: (){
                    setState(() {
                      a++;
                      if(a % 2 == 0){
                      dummyProductModelList.forEach((element) {
                        element.isChecked = true;
                      });}
                      else{
                        dummyProductModelList.forEach((element) {
                          element.isChecked= false;
                        });
                      }
                    });
                  },
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
              IconButton(onPressed: (){},
                icon: ImageIcon(AssetImage("images/shoppingcartfigma.png"),size: 20,color: Colors.black26,),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child:ProductListView(
          productModelList: dummyProductModelList
            ),),
        ],
      ),
    );
  }
}

class ProductModel{
  String title;
  String URL;
  int price;
  bool isChecked;
  ProductModel(this.title, this.URL,this.price,this.isChecked);
}

class ProductListView extends StatefulWidget{
  final List<ProductModel> productModelList;

  ProductListView({Key? key, required this.productModelList}) : super(key: key);

  @override
  _ProductListView createState() => _ProductListView();
}

class _ProductListView extends State<ProductListView>{
  List<ProductModel> productModelList = [];

  void _loadData(List<ProductModel> _productmodellist){
    productModelList.clear();
    productModelList.addAll(_productmodellist);
  }
  @override
  void initState() {
    super.initState();
    _loadData(widget.productModelList);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productModelList.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductListItem(productModel: productModelList[index]);
      },
    );
  }
}
class ProductListItem extends StatefulWidget{
  final ProductModel productModel;
  ProductListItem({Key ? key, required this.productModel});
  @override
  _ProductListItem createState() => _ProductListItem();
}

class _ProductListItem extends State<ProductListItem>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Card(
        elevation: 5.0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0)),
        child: SizedBox(
          height: 120,
          width: 100,
          child: FlatButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shopping_Basket()));
            },
            child: Container(
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
                    ),),
                    Expanded(flex: 6,
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(widget.productModel.title),
                              Checkbox(

                              value: widget.productModel.isChecked,
                                onChanged: (bool ? value){
                                setState(() {
                                  widget.productModel.isChecked = value!;
                                });
                                },
                              ),

                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 12)),
                        Container(
                          padding: EdgeInsets.only(right: 200),
                          child: Text(
                            '${widget.productModel.price}원',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
    );
  }
}