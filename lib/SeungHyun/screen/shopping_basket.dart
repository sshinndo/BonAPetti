import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/shopping_basket.dart';
/*
class EachWishList extends StatefulWidget{
  @override
  _EachWishList createState() => _EachWishList();
}*/

List<ProductModel> dummyProductModelList = [
  ProductModel('개구리', 'abc', 200, false),
  ProductModel('지렁이', 'abc', 200, false),
  ProductModel('타란튤라', 'abc', 200, false),
  ProductModel('전갈', 'abc', 200, false),
  ProductModel('지네', 'abc', 200, false),
];

class Shopping_Basket extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    ProductListView productListView = ProductListView(
        productModelList: dummyProductModelList
    );

    return Scaffold(


      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context , null);
          },
        ),
        title: Text(
          '장바구니',
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
                    productListView.getStateData().refreshAllData();
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
                  onPressed: () {
                    productListView.getStateData().selectedItemRemove();
                  },
                  child: Text(
                    '선택 삭제',
                    style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),

                  )
              ),
              Padding(padding: EdgeInsets.fromLTRB(215,0,0,0)),
              IconButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shopping_Basket()));
              },
                icon: ImageIcon(AssetImage("images/shoppingcartfigma.png"),size: 20,color: Colors.black26,),
              ),
            ],
          ),
          Expanded(
            flex: 5,
            child:productListView,),
          Expanded(flex: 3,child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                height: 1.0,
                width: 500.0,
                color: Colors.black,
              ),
              Padding(padding: EdgeInsets.only(top: 32)),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 340)),
                    Text(
                      '총 1,000원',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 32)),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  height: 100,
                  width: 400,

                  child: Container(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('주문하기',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                    color: Color.fromRGBO(255, 113, 113, 1),
                  )
                )
              ),
            ],
          ),)
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

  final _ProductListView _productListView = _ProductListView();

  _ProductListView getStateData() => _productListView;

  @override
  _ProductListView createState() => _productListView;
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

  void selectedItemRemove() {
    setState(() {
      _loadData(widget.productModelList);
      productModelList.removeWhere((element) => element.isChecked);
    });
  }

  void refreshAllData() {
    setState(() {
      dummyProductModelList.forEach((element) {
        element.isChecked = !element.isChecked;
      });
    });
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

class _ProductListItem extends State<ProductListItem> {

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
                    Expanded(flex: 2, child: Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 0),
                      child: SizedBox(
                        height: 300,
                        width: 400,
                        child: Image.asset("images/goodstestimage.png"),
                      ),
                    ),),
                    Expanded(flex: 6,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Container(
                            margin: EdgeInsets.only(left: 16,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(widget.productModel.title),
                                Checkbox(
                                  activeColor: Color.fromRGBO(255, 113, 113, 1),
                                  value: widget.productModel.isChecked,
                                  onChanged: (bool? value){
                                    setState(() {
                                      widget.productModel.isChecked = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 0)),
                          Container(
                            padding: EdgeInsets.only(right: 240),
                            child: Text(
                              '${widget.productModel.price}원',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
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