import 'package:flutter/material.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/card_news/detail/CardNewsRelatedProductsWidget.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/card_news/detail/EventDetailWidget.dart';
import 'package:pet_service_application/card_news/detail/TopPetsWidget.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

class CardNewsDetailRoute extends StatelessWidget {
  final CardNewsModel cardNewsModel;

  CardNewsDetailRoute(this.cardNewsModel);

  @override
  Widget build(BuildContext context) {
    DetailCardNewsPageView detailCardNewsPageView = DetailCardNewsPageView(
        detailCardNewsModelList: cardNewsModel.detailCardNewsModelList!);

    return Scaffold(
      body: Column(
        children: [
          AppBarWithAlarm(nickName: Logger().userData.name),
          Expanded(
              child: ListView(children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(35),
                child: Text(
                  cardNewsModel.title,
                  style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )),
            Container(
              height: MediaQuery.of(context).size.width *
                  detailCardNewsPageView.getViewPortFractionValue(),
              child: detailCardNewsPageView,
            ),
            cardNewsModel.type == CardNewsType.CARDNEWS
                ? CardNewsRelatedProductsWidget(cardNewsModel.goodsInfoList)
                : cardNewsModel.type == CardNewsType.EVENT
                    ? SpecialCouponWidget()
                    : cardNewsModel.type == CardNewsType.TOPPET
                        ? TopPetsWidget()
                        : Container(),
          ])),
          // TextField -> 댓글 입력 및 버튼
          // 댓글 리스트
        ],
      ),
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}
