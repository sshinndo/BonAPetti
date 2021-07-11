import 'package:flutter/material.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/route/CardNewsDetailRoute.dart';

/*
How to use?
*/
class CardNews extends StatelessWidget {
  final CardNewsModel cardNewsModel;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(8);
  final Function() onTapEvent;

  CardNews({Key? key, required this.cardNewsModel, required this.onTapEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapEvent,
        child: Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
            child: Stack(children: [
              Image.network(
                cardNewsModel.imgUrl,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                  bottom: 15.0,
                  right: 15.0,
                  child: Text(cardNewsModel.title,
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold))),
            ])));
  }
}

class CardNewsPageView extends StatefulWidget {
  final List<CardNewsModel> cardNewsModelList;

  CardNewsPageView({Key? key, required this.cardNewsModelList})
      : super(key: key);

  @override
  _CardNewsPageView createState() => _CardNewsPageView();

  static _CardNewsPageView? of(BuildContext context) =>
      context.findAncestorStateOfType<_CardNewsPageView>();
}

class _CardNewsPageView extends State<CardNewsPageView> {
  List<CardNews> _cardNewsList = [];
  List<CardNewsModel> _cardNewsModelList = [];

  @override
  void initState() {
    super.initState();

    _loadData(widget.cardNewsModelList);
  }

  void _loadData(List<CardNewsModel> _cardNewsDataList) {
    _cardNewsModelList.clear();
    _cardNewsModelList.addAll(_cardNewsDataList);

    // 서버에서 불러온 데이터를 기반으로 cardNewsList 추가
    // 이 코드는 수정할 필요가 없음
    _cardNewsModelList.forEach((element) {
      _cardNewsList.add(CardNews(
          cardNewsModel: element,
          onTapEvent: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardNewsDetailRoute(element)),
            );
          }));
    });
  }

  void refresh(List<CardNewsModel> _cardNewsDataList) {
    setState(() {
      _loadData(_cardNewsDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('test');
    final PageController controller =
        PageController(viewportFraction: 0.85, initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: _cardNewsList,
    );
  }
}
