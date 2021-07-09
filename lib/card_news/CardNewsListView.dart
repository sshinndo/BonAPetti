import 'package:flutter/material.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/route/CardNewsDetailRoute.dart';

class CardNewsItem extends StatelessWidget {
  final CardNewsModel _cardNewsModel;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(8);
  final double leftRightMarginSize = 50;

  CardNewsItem(this._cardNewsModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardNewsDetailRoute(_cardNewsModel),
          )),
      child: Container(
        height: 200,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(
              leftRightMarginSize, 10, leftRightMarginSize, 10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
          child: Stack(children: [
            Image.network(
              _cardNewsModel.imgUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
                bottom: 15.0,
                right: 15.0,
                child: Text(_cardNewsModel.title,
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
          ]),
        ),
      ),
    );
  }
}

class CardNewsListView extends StatefulWidget {
  final List<CardNewsModel> cardNewsModelList;

  CardNewsListView({Key? key, required this.cardNewsModelList})
      : super(key: key);

  final _cardNewsListView = _CardNewsListView();

  _CardNewsListView getStateData() => _cardNewsListView;

  @override
  _CardNewsListView createState() => _cardNewsListView;
}

class _CardNewsListView extends State<CardNewsListView> {
  // 부모한테 원본 데이터가 있고, 현재 리스트는 Filtering될 리스트
  List<CardNewsModel> filteredCardNewsModelList = [];

  @override
  void initState() {
    super.initState();

    setCardNewsModelListData(widget.cardNewsModelList);
  }

  void setCardNewsModelListData(List<CardNewsModel> _cardNewsDataList) {
    filteredCardNewsModelList.clear();
    filteredCardNewsModelList.addAll(_cardNewsDataList);
  }

  void _cardNewsTypeFiltering(CardNewsType cardNewsType) {
    // 재사용을 위해 현재 데이터 삭제 후 다시 모든 데이터 추가
    setCardNewsModelListData(widget.cardNewsModelList);

    // 카드 뉴스 타입이 ALL이면 Filtering을 할 필요가 없으므로 모든 데이터 추가 후 메소드 바로 종료
    if (cardNewsType == CardNewsType.ALL) return;

    // 카드 뉴스의 타입이 일치하지 않는 데이터들만 삭제
    filteredCardNewsModelList
        .removeWhere((element) => element.type != cardNewsType);
  }

  void executeFiltering(CardNewsType cardNewsType) {
    setState(() {
      _cardNewsTypeFiltering(cardNewsType);
    });
  }

  void changeOriginalData(List<CardNewsModel> _cardNewsDataList) {
    setState(() {
      setCardNewsModelListData(_cardNewsDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: filteredCardNewsModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return CardNewsItem(filteredCardNewsModelList[index]);
        });
  }
}
