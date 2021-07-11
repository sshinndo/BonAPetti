import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final pinkBoldTextColor = Color.fromRGBO(255, 87, 87, 1);

class CardNewsRelatedProductsWidget extends StatefulWidget {
  @override
  _CardNewsRelatedProductsWidget createState() =>
      _CardNewsRelatedProductsWidget();
}

class _CardNewsRelatedProductsWidget
    extends State<CardNewsRelatedProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 35, right: 35, top: 70),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '이번 카드뉴스의 ',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                  TextSpan(
                      text: '연관상품',
                      style: TextStyle(
                          fontSize: 17,
                          color: pinkBoldTextColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerRight,
                child: Text("더보기 >"), // 더보기 Text Size 올릴것 main도
                margin: EdgeInsets.only(right: 35, top: 10, bottom: 10),
              )),
          Container(
            margin: EdgeInsets.all(30),
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
/*
class CardNewsRelatedProductModel {
  String imgUrl;
  String productName;
  int price;
  int? discountedPrice;

  CardNewsRelatedProductModel(
      this.imgUrl, this.productName, this.price, this.discountedPrice);
}

class CardNewsRelatedProductCardWidget extends StatefulWidget {
  final CardNewsRelatedProductModel relatedProductModel;

  CardNewsRelatedProductCardWidget(
      {Key? key, required this.relatedProductModel});

  @override
  _CardNewsRelatedProductCardWidget createState() =>
      _CardNewsRelatedProductCardWidget();
}

class _CardNewsRelatedProductCardWidget
    extends State<CardNewsRelatedProductCardWidget> {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    final heartAndCartSize = MediaQuery.of(context).size.width * 0.04;

    return Card(
      elevation: 5,
      semanticContainer: true,
      margin: EdgeInsets.all(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: heartAndCartSize,
                          height: heartAndCartSize,
                          child: Image.asset('images/heart_icon.png'))),
                  Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          '바로주문',
                          style: TextStyle(
                              color: Color.fromRGBO(168, 168, 168, 1)),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: heartAndCartSize,
                          height: heartAndCartSize,
                          child: Image.asset('images/cart_icon.png')))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: heartAndCartSize * 5,
                height: heartAndCartSize * 5,
                child: Image.network(widget.relatedProductModel.imgUrl),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.bottomLeft,
                child: Text(widget.relatedProductModel.productName)),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    children: getPriceTextSpan(widget.relatedProductModel),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  List<TextSpan> getPriceTextSpan(
      CardNewsRelatedProductModel relatedProductModel) {
    List<TextSpan> priceTextSpan = [];
    if (relatedProductModel.discountedPrice == null) {
      priceTextSpan.add(
        TextSpan(
          text: NumberFormat('###,###,###,###')
                  .format(relatedProductModel.price)
                  .replaceAll(' ', '') +
              '원',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    } else {
      priceTextSpan.add(
        TextSpan(
          text: (NumberFormat('###,###,###,###')
              .format(relatedProductModel.price)
              .replaceAll(' ', '')),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(175, 173, 173, 1),
            decoration: TextDecoration.lineThrough,
          ),
        ),
      );
      priceTextSpan.add(
        TextSpan(
          text: ' ' +
              (NumberFormat('###,###,###,###')
                      .format(relatedProductModel.discountedPrice)
                      .replaceAll(' ', '') +
                  '원'),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: pinkBoldTextColor),
        ),
      );
    }

    return priceTextSpan;
  }
}
*/
