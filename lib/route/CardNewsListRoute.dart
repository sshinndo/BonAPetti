import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/card_news/CardNewsListView.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

final double leftRightMarginSize = 50;

// 데이터는 Main에서 불러옴
class CardNewsListRoute extends StatelessWidget {
  final List<CardNewsModel> cardNewsModelList;

  CardNewsListRoute({Key? key, required this.cardNewsModelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(cardNewsModelList.toString());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
          children: [
            AppBarWithAlarm(nickName: Logger().userData.name),
            Container(
                margin: EdgeInsets.all(20),
                child: Center(
                    child: Text('오늘의 정보',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)))),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  height: 20,
                  thickness: 1.5,
                  indent: 15,
                  endIndent: 15,
                )),
            Expanded(
                flex: 1,
                child: FilterTabWithListView(
                    cardNewsModelList: cardNewsModelList)),
          ],
        ),
      ),
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}

class FilterTabWidget extends StatefulWidget {
  final CardNewsType cardNewsType;
  final EdgeInsetsGeometry margin;
  final int flex;
  final String tabName;
  final Function() onTapEvent;

  final TextStyle selectedTextStyle = TextStyle(
          fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.bold),
      unSelectedTextStyle =
          TextStyle(fontSize: 13.0, color: Color.fromRGBO(0, 0, 0, 0.5));

  FilterTabWidget({
    Key? key,
    required this.cardNewsType,
    required this.margin,
    required this.flex,
    required this.tabName,
    required this.onTapEvent,
  }) : super(key: key);

  final _FilterTabWidget getStateData = _FilterTabWidget();

  @override
  _FilterTabWidget createState() => getStateData;
}

class _FilterTabWidget extends State<FilterTabWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.cardNewsType == CardNewsType.ALL) isSelected = true;
  }

  void refreshTab(bool _isSelected) {
    setState(() {
      isSelected = _isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
            onTap: () {
              widget.onTapEvent();
            },
            child: Container(
                margin: widget.margin,
                child: Center(
                    child: Text(widget.tabName,
                        style: isSelected
                            ? widget.selectedTextStyle
                            : widget.unSelectedTextStyle)))));
  }
}

class FilterTabWithListView extends StatefulWidget {
  final List<CardNewsModel> cardNewsModelList;

  FilterTabWithListView({Key? key, required this.cardNewsModelList})
      : super(key: key);

  @override
  _FilterTabWithListView createState() => _FilterTabWithListView();
}

class _FilterTabWithListView extends State<FilterTabWithListView> {
  List<FilterTabWidget> filterTabList = [];
  List<CardNewsModel> filteredCardNewsModelList = [];
  CardNewsListView? cardNewsListView;

  @override
  void initState() {
    super.initState();

    _initUIWidgets();
  }

  void _initUIWidgets() {
    cardNewsListView =
        CardNewsListView(cardNewsModelList: widget.cardNewsModelList);

    filterTabList.clear();

    filterTabList.addAll([
      FilterTabWidget(
          cardNewsType: CardNewsType.ALL,
          margin: EdgeInsets.only(
            left: 25,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: '모아보기 ▼',
          onTapEvent: () {
            _manageFilterTabWidget(CardNewsType.ALL);
            cardNewsListView!.getStateData().executeFiltering(CardNewsType.ALL);
          }),
      FilterTabWidget(
          cardNewsType: CardNewsType.CARDNEWS,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: '카드뉴스 ▼',
          onTapEvent: () {
            _manageFilterTabWidget(CardNewsType.CARDNEWS);
            cardNewsListView!
                .getStateData()
                .executeFiltering(CardNewsType.CARDNEWS);
          }),
      FilterTabWidget(
          cardNewsType: CardNewsType.EVENT,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: '이벤트 ▼',
          onTapEvent: () {
            _manageFilterTabWidget(CardNewsType.EVENT);
            cardNewsListView!
                .getStateData()
                .executeFiltering(CardNewsType.EVENT);
          }),
      FilterTabWidget(
          cardNewsType: CardNewsType.TOPPET,
          margin: EdgeInsets.only(
            left: 10,
            right: 25,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: 'TOP펫 ▼',
          onTapEvent: () {
            _manageFilterTabWidget(CardNewsType.TOPPET);
            cardNewsListView!
                .getStateData()
                .executeFiltering(CardNewsType.TOPPET);
          }),
    ]);
  }

  void _manageFilterTabWidget(CardNewsType cardNewsType) {
    filterTabList.forEach((element) {
      if (element.cardNewsType != cardNewsType) {
        element.getStateData.refreshTab(false);
      } else
        element.getStateData.refreshTab(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: filterTabList,
          ),
          Expanded(flex: 5, child: cardNewsListView!),
        ],
      ),
    );
  }
}
