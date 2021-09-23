import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/GoodsInfo.dart';
import 'package:pet_service_application/widgets/GoodsWidget.dart';
import 'package:pet_service_application/SeungHyun/screen/DetailedGoodsScreen.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:intl/intl.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class GoodsScreen extends StatefulWidget {
  final List<GoodsInfo> goodsInfoList;

  GoodsScreen(this.goodsInfoList);

  @override
  _GoodsScreen createState() => _GoodsScreen();
}

class _GoodsScreen extends State<GoodsScreen> {
  @override
  Widget build(BuildContext context) {
    FilterTabWithListView filterTabWithListView = FilterTabWithListView(
      goodsInfoList: [
        widget.goodsInfoList[0],
        widget.goodsInfoList[1],
        widget.goodsInfoList[2],
        widget.goodsInfoList[3],
      ],
    );

    return Scaffold(
      body: Column(
        children: [
          DrawerWithAlarmAppBar(nickName: UserInfo.userNickname),
          SearchBar(
            filterTabWithListView: filterTabWithListView,
          ),
          Container(
            margin: EdgeInsets.only(top: 25, left: 35, right: 35),
            child: Divider(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              height: 20,
              thickness: 1.5,
              indent: 15,
              endIndent: 15,
            ),
          ),
          Expanded(
            child: filterTabWithListView,
          ),
          Container(child: MenuBottomBar()),
        ],
      ),
    );
  }
}

enum GoodsFilterType { PRICE, REVIEW, POPULARITY, CATEGORY }

class SearchBar extends StatelessWidget {
  final FilterTabWithListView filterTabWithListView;
  SearchBar({Key? key, required this.filterTabWithListView}) : super(key: key);

  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.only(left: 50, top: 20, right: 50),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 60,
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: textFieldController,
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  cursorColor: Color.fromRGBO(217, 217, 217, 1),
                  onChanged: (text) {
                    filterTabWithListView
                        .getStateData()
                        .goodsWidgetListView!
                        .getStateData()
                        .applySearchData(text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoodsItemModel {
  String imgUrl;
  String productName;
  int price;
  int? discountedPrice;

  GoodsItemModel(
      this.imgUrl, this.productName, this.price, this.discountedPrice);
}

class FilterTabWidget extends StatefulWidget {
  final GoodsFilterType goodsFilterType;
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
    required this.goodsFilterType,
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
    if (widget.goodsFilterType == GoodsFilterType.PRICE) isSelected = true;
  }

  void refreshTab() {
    setState(() {
      isSelected = !isSelected;
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

class GoodsWidgetListView extends StatefulWidget {
  final List<GoodsInfo> goodsInfoListView;

  GoodsWidgetListView({Key? key, required this.goodsInfoListView})
      : super(key: key);

  final _goodsWidgetListView = _GoodsWidgetListView();

  _GoodsWidgetListView getStateData() => _goodsWidgetListView;

  @override
  _GoodsWidgetListView createState() => _goodsWidgetListView;
}

class _GoodsWidgetListView extends State<GoodsWidgetListView> {
  // 부모한테 원본 데이터가 있고, 현재 리스트는 Filtering될 리스트
  List<GoodsInfo> filteredGoodsInfoModelList = [];

  @override
  void initState() {
    super.initState();

    setGoodsItemModelListData(widget.goodsInfoListView);
  }

  void setGoodsItemModelListData(List<GoodsInfo> _goodsInfoDataList) {
    filteredGoodsInfoModelList.clear();
    filteredGoodsInfoModelList.addAll(_goodsInfoDataList);
  }

  void applySearchData(String textFieldData) {
    setGoodsItemModelListData(widget.goodsInfoListView);
    setState(() {
      filteredGoodsInfoModelList
          .removeWhere((element) => !element.name.contains(textFieldData));
    });
  }

  void changeOriginalData(List<GoodsInfo> _goodsInfoDataList) {
    setState(() {
      setGoodsItemModelListData(_goodsInfoDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      children: List.generate(
        filteredGoodsInfoModelList.length,
        (index) => GoodsCardWidget(
          goodsInfo: filteredGoodsInfoModelList[index],
        ),
      ),
    );
  }
}
/*
class GoodsItem extends StatefulWidget {
  final GoodsItemModel _goodsItemModel;

  GoodsItem(this._goodsItemModel);

  @override
  _GoodsItem createState() => _GoodsItem();
}

class _GoodsItem extends State<GoodsItem> {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(8);
  final double leftRightMarginSize = 50;

  @override
  Widget build(BuildContext context) {
    final heartAndCartSize = MediaQuery.of(context).size.width * 0.04;

    return GestureDetector(
      onTap: () {
        //Navigator.push(context,
        //    MaterialPageRoute(builder: (context) => DetailedGoodsScreen()));
      },
      child: Card(
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
                  child: Image.network(widget._goodsItemModel.imgUrl),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Text(widget._goodsItemModel.productName)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 20, top: 5),
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: getPriceTextSpan(widget._goodsItemModel),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> getPriceTextSpan(GoodsItemModel goodsItemModel) {
    List<TextSpan> priceTextSpan = [];
    if (goodsItemModel.discountedPrice == null) {
      priceTextSpan.add(
        TextSpan(
          text: NumberFormat('###,###,###,###')
                  .format(goodsItemModel.price)
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
              .format(goodsItemModel.price)
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
                      .format(goodsItemModel.discountedPrice)
                      .replaceAll(' ', '') +
                  '원'),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 87, 87, 1)),
        ),
      );
    }

    return priceTextSpan;
  }
}*/

class FilterTabWithListView extends StatefulWidget {
  final List<GoodsInfo> goodsInfoList;

  FilterTabWithListView({Key? key, required this.goodsInfoList})
      : super(key: key);

  final _FilterTabWithListView _filterTabWithListView =
      _FilterTabWithListView();

  _FilterTabWithListView getStateData() => _filterTabWithListView;

  @override
  _FilterTabWithListView createState() => _filterTabWithListView;
}

class _FilterTabWithListView extends State<FilterTabWithListView> {
  List<FilterTabWidget> filterTabList = [];
  GoodsWidgetListView? goodsWidgetListView;
  List<String> tabName = ['가격낮은순 ▼', '리뷰많은순 ▼', '인기순 ▼', '종류 ▼'];

  @override
  void initState() {
    super.initState();

    _initUIWidgets();
  }

  void changeTabName(int index, String tabName1, String tabName2) {
    setState(() {
      if (tabName[index] == tabName1)
        tabName[index] = tabName2;
      else
        tabName[index] = tabName1;
    });
  }

  void _initUIWidgets() {
    goodsWidgetListView =
        GoodsWidgetListView(goodsInfoListView: widget.goodsInfoList);

    filterTabList.clear();

    filterTabList.addAll([
      FilterTabWidget(
          goodsFilterType: GoodsFilterType.PRICE,
          margin: EdgeInsets.only(
            left: 25,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: tabName[0],
          onTapEvent: () {
            _manageFilterTabWidget(0);
            changeTabName(0, '가격낮은순 ▼', '가격높은순 ▲');
          }),
      FilterTabWidget(
          goodsFilterType: GoodsFilterType.REVIEW,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: tabName[1],
          onTapEvent: () {
            _manageFilterTabWidget(1);
            changeTabName(1, '리뷰많은순 ▼', '리뷰적은순 ▲');
          }),
      FilterTabWidget(
          goodsFilterType: GoodsFilterType.POPULARITY,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: tabName[2],
          onTapEvent: () {
            _manageFilterTabWidget(2);
            changeTabName(2, '인기순 ▼', '인기순 ▲');
          }),
      FilterTabWidget(
          goodsFilterType: GoodsFilterType.CATEGORY,
          margin: EdgeInsets.only(
            left: 10,
            right: 25,
            top: 10,
            bottom: 25,
          ),
          flex: 1,
          tabName: tabName[3],
          onTapEvent: () {
            _manageFilterTabWidget(3);
            changeTabName(3, '종류 ▼', '종류 ▲');
          }),
    ]);
  }

  void _manageFilterTabWidget(int index) {
    filterTabList[index].getStateData.refreshTab();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: filterTabList,
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: goodsWidgetListView!,
            ),
          ),
        ],
      ),
    );
  }
}
