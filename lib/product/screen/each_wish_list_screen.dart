import 'dart:ui';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/appbar/BackBtnAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/product/screen/shopping_basket.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';

/*
class EachWishList extends StatefulWidget{
  @override
  _EachWishList createState() => _EachWishList();
}*/

List<GoodsInfo> dummyGoodsModelList = [
  GoodsInfo(
      product[0]["name"],
      product[0]["thumbnailUrl"],
      product[0]["price1"],
      product[0]["category"],
      GoodsDetailedInfo(
        false,
        product[0]["grade"],
        product[0]["detailDescriptionUrl1"],
        product[0]["detailDescriptionUrl2"],
        product[0]["detailDescriptionUrl3"],
        product[0]["detailDescriptionUrl4"],
        product[0]["allergicIngredients"], product[0]["ingredientImageUrl"],
        GoodsVendor(product[0]["siteName1"],product[0]["price1"],product[0]["shippingFee1"],product[0]["goodsUrl1"]),
        GoodsVendor(product[0]["siteName2"],product[0]["price2"],product[0]["shippingFee2"],product[0]["goodsUrl2"]),
        GoodsVendor(product[0]["siteName3"],product[0]["price3"],product[0]["shippingFee3"],product[0]["goodsUrl3"]),)
  ),
  GoodsInfo(
      product[0]["name"],
      product[0]["thumbnailUrl"],
      product[0]["price1"],
      product[0]["category"],
      GoodsDetailedInfo(
        false,
        product[0]["grade"],
        product[0]["detailDescriptionUrl1"],
        product[0]["detailDescriptionUrl2"],
        product[0]["detailDescriptionUrl3"],
        product[0]["detailDescriptionUrl4"],
        product[0]["allergicIngredients"], product[0]["ingredientImageUrl"],
        GoodsVendor(product[0]["siteName1"],product[0]["price1"],product[0]["shippingFee1"],product[0]["goodsUrl1"]),
        GoodsVendor(product[0]["siteName2"],product[0]["price2"],product[0]["shippingFee2"],product[0]["goodsUrl2"]),
        GoodsVendor(product[0]["siteName3"],product[0]["price3"],product[0]["shippingFee3"],product[0]["goodsUrl3"]),)
  ),
];

class EachWishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductListView productListView =
        ProductListView(productModelList: dummyGoodsModelList);

    return Scaffold(
      body: Column(
        children: <Widget>[
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Shopping_Basket()));
                },
                icon: ImageIcon(
                  AssetImage("images/shopping_cart_figma.png"),
                  size: 20,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Expanded(
            flex: 1,
            child: productListView,
          ),
        ],
      ),
    );
  }
}

class ProductModel {
  String title;
  String URL;
  int price;
  bool isChecked;
  ProductModel(this.title, this.URL, this.price, this.isChecked);
}

class ProductListView extends StatefulWidget {
  final List<GoodsInfo> productModelList;

  ProductListView({Key? key, required this.productModelList}) : super(key: key);

  final _ProductListView _productListView = _ProductListView();

  _ProductListView getStateData() => _productListView;

  @override
  _ProductListView createState() => _productListView;
}

class _ProductListView extends State<ProductListView> {
  List<GoodsInfo> productModelList = [];

  void _loadData(List<GoodsInfo> _productmodellist) {
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
      productModelList.removeWhere((element) => element.goodsDetailedInfo.isLike);
    });
  }

  void refreshAllData() {
    setState(() {
      dummyGoodsModelList.forEach((element) {
        element.goodsDetailedInfo.isLike = !element.goodsDetailedInfo.isLike;
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

class ProductListItem extends StatefulWidget {
  final GoodsInfo productModel;
  ProductListItem({Key? key, required this.productModel});
  @override
  _ProductListItem createState() => _ProductListItem();
}

class _ProductListItem extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        elevation: 5.0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          height: 120,
          width: 100,
          child: FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shopping_Basket()));
            },
            child: Container(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 0),
                        child: SizedBox(
                          height: 300,
                          width: 400,
                          child: Image.network(widget.productModel.thumbnailUrl),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                children: <Widget>[


                                  Expanded(
                                    child: Text(widget.productModel.name),
                                    flex: 10,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Expanded(
                                    child: Checkbox(
                                      activeColor:
                                          Color.fromRGBO(255, 113, 113, 1),
                                      value: widget
                                          .productModel.goodsDetailedInfo.isLike,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          widget.productModel.goodsDetailedInfo
                                              .isLike = value!;
                                        });
                                      },
                                    ),
                                    flex: 1,
                                  ),


                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                children: <Widget>[


                                  Expanded(
                                    child: Text(
                                      (NumberFormat('###,###,###,###')
                                              .format(widget.productModel.price)
                                              .replaceAll(' ', '')) +
                                          '원',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    flex: 10,
                                  ),
                                  Expanded(child: Container(), flex: 1,),



                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(



                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 220, right: 20),
                                    child: Text(
                                      '바로주문',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(168, 168, 168, 1)),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 10),
                                    child: ImageIcon(
                                        AssetImage(
                                            "images/shopping_cart_figma.png"),
                                        size: 20,
                                        color:
                                            Color.fromRGBO(217, 217, 217, 1)),
                                  )
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
    );
  }
}