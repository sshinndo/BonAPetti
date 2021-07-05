import 'package:flutter/material.dart';

final double leftRightMarginSize = 50;

class CardNewsListRoute extends StatelessWidget {
  List<FilterTabButton>? tabBtnList;

  CardNewsListRoute() {
    tabBtnList = [];
    tabBtnList?.addAll([
      FilterTabButton(itemIndex: 0, margin: 10, flex: 1, text: "모아보기 ▼"),
      FilterTabButton(itemIndex: 1, margin: 10, flex: 1, text: "카드뉴스 ▼"),
      FilterTabButton(itemIndex: 2, margin: 10, flex: 1, text: "이벤트 ▼"),
      FilterTabButton(itemIndex: 3, margin: 10, flex: 1, text: "TOP펫 ▼"),
    ]);
    tabBtnList?.forEach((element) {
      element.filterTabBtnState.list = tabBtnList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
        children: [
          Container(
            margin:
                EdgeInsets.only(top: 20 + MediaQuery.of(context).padding.top),
            height: AppBar().preferredSize.height,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                        child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset('images/hamburger_icon.png'),
                    ))),
                Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        '닉네임',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              // 알람버튼 event
                            },
                            icon: Image.asset('images/bell_icon.png')))),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Center(
                  child: Text('오늘의 정보',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
          Divider(
            color: Colors.grey.shade300,
            height: 20,
            thickness: 1.5,
            indent: 15,
            endIndent: 15,
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(children: tabBtnList!)),
          Expanded(flex: 5, child: ExplicitListConstructing()),
        ],
      ),
    ));
  }
}

class FilterTabButton extends StatefulWidget {
  final int? itemIndex;
  final double? margin;
  final int? flex;
  final String? text;
  final TextStyle? selectedTextStyle = TextStyle(
          fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
      unSelectedTextStyle =
          TextStyle(fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 0.5));

  FilterTabButton(
      {Key? key,
      required this.itemIndex,
      required this.margin,
      required this.flex,
      required this.text})
      : super(key: key);

  final _FilterTabButtonState filterTabBtnState = _FilterTabButtonState();

  @override
  _FilterTabButtonState createState() => filterTabBtnState;
}

class _FilterTabButtonState extends State<FilterTabButton> {
  bool _isSelected = false;
  List<FilterTabButton>? list;

  @override
  void initState() {
    super.initState();
    if (widget.itemIndex == 0) this._isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return getTabBtn(widget.margin!, widget.flex!, widget.text!,
        _isSelected ? widget.selectedTextStyle! : widget.unSelectedTextStyle!);
  }

  void refresh(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
    });
  }

  Expanded getTabBtn(
    double margin,
    int flex,
    String text,
    TextStyle textStyle,
  ) {
    return Expanded(
        flex: flex,
        child: GestureDetector(
            onTap: () {
              list?.forEach((elem) {
                if (elem.itemIndex != widget.itemIndex)
                  elem.filterTabBtnState.refresh(false);
                else
                  elem.filterTabBtnState.refresh(true);
              });
            },
            child: Container(
                margin: EdgeInsets.all(margin),
                child: Center(child: Text(text, style: textStyle)))));
  }
}

class CardNewsEvent {
  String imgUrl, title, contentText;
  DateTime? startDate, endDate;

  CardNewsEvent(
      this.imgUrl, this.title, this.contentText, this.startDate, this.endDate);
}

class CardNewsItem extends StatelessWidget {
  final CardNewsEvent _cardNewsEvent;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(8);

  CardNewsItem(this._cardNewsEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(
              leftRightMarginSize, 10, leftRightMarginSize, 10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
          child: Image.network(
            _cardNewsEvent.imgUrl,
            fit: BoxFit.fill,
          ),
        ));
  }
}

CardNewsEvent cardNewsEventItem = CardNewsEvent(
    'https://picsum.photos/250?image=9',
    "Test Title",
    "Test Context",
    null,
    null);

List<CardNewsEvent> cardNewsEventList = List.filled(10, cardNewsEventItem);

class ExplicitListConstructing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        CardNewsItem(cardNewsEventList[0]),
        CardNewsItem(cardNewsEventList[1]),
        CardNewsItem(cardNewsEventList[2]),
        CardNewsItem(cardNewsEventList[3]),
        CardNewsItem(cardNewsEventList[4]),
        CardNewsItem(cardNewsEventList[5]),
      ],
    );
  }
}
