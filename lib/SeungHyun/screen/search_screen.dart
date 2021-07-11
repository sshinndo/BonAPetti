import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/BackBtnAppBar.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRoute createState() => _SearchRoute();
}

class _SearchRoute extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchArea(),
    );
  }
}

class SearchArea extends StatefulWidget {
  @override
  _SearchArea createState() => _SearchArea();
}

class _SearchArea extends State<SearchArea> {
  @override
  Widget build(BuildContext context) {
    SearchContentsManagerWidget searchContentsManagerWidget =
        SearchContentsManagerWidget();

    return Column(
      children: [
        BackBtnAppBar(nickName: '닉네임'),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: SearchBar(managerWidget: searchContentsManagerWidget),
        ),
        Expanded(
          flex: 1,
          child: searchContentsManagerWidget,
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final SearchContentsManagerWidget managerWidget;
  SearchBar({Key? key, required this.managerWidget}) : super(key: key);

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
                    if (text.length <= 0)
                      managerWidget.getStateData().refresh(false);
                    else
                      managerWidget.getStateData().refresh(true);
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

class SearchContentsManagerWidget extends StatefulWidget {
  final _SearchContentsManagerWidget _searchContentsManagerWidget =
      _SearchContentsManagerWidget();

  _SearchContentsManagerWidget getStateData() => _searchContentsManagerWidget;

  @override
  _SearchContentsManagerWidget createState() => _searchContentsManagerWidget;
}

class _SearchContentsManagerWidget extends State<SearchContentsManagerWidget> {
  bool isSearchBarHasText = false;

  @override
  void initState() {
    super.initState();
  }

  void refresh(bool isHasText) {
    setState(() {
      isSearchBarHasText = isHasText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSearchBarHasText ? getHaveTextUI() : getNotHaveTextUI(),
    );
  }

  Widget getNotHaveTextUI() {
    RecentSearchedWordsWidget recentWords = RecentSearchedWordsWidget([
      '#말티즈',
      '#웰시코기',
      '#치와와',
      '#도베르만',
      '#시바견',
      '#진돗개',
      '#푸들',
      '#비숑 프리제',
      '#슈나우저',
    ]);

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 55, left: 55, right: 55),
          height: 50,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '최근 검색어',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  recentWords.getStateData().removeAllBtn();
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '전체 삭제',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        recentWords,
        Container(
          margin: EdgeInsets.only(top: 55, left: 55, bottom: 40),
          alignment: Alignment.centerLeft,
          child: Text(
            '인기 검색어',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 300,
          margin: EdgeInsets.only(left: 55, right: 55, bottom: 30),
          child: PopularSearchedWordsWidget(
            popularWordNameList: [
              '유기농',
              '닭가슴살',
              '오리고기',
              '연어',
              '돼지고기',
              '밀웜',
              '영양소 함량',
              '건강식품',
              '애견간식',
              '다이어트 식품',
            ],
          ),
        ),
      ],
    );
  }

  Widget getHaveTextUI() {
    return Container(
        child: RelatedRecommentWordListView(
      initialWordList: [
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
        '관련/추천검색어',
      ],
    ));
  }
}

class RelatedRecommentWordListView extends StatefulWidget {
  final List<String> initialWordList;
  RelatedRecommentWordListView({Key? key, required this.initialWordList})
      : super(key: key);

  final _RelatedRecommentWordListView _relatedRecommentWordListView =
      _RelatedRecommentWordListView();

  _RelatedRecommentWordListView getStateData() => _relatedRecommentWordListView;

  @override
  _RelatedRecommentWordListView createState() => _relatedRecommentWordListView;
}

class _RelatedRecommentWordListView
    extends State<RelatedRecommentWordListView> {
  List<String> currentWordList = [];

  @override
  void initState() {
    super.initState();
    _setData(widget.initialWordList);
  }

  void _setData(List<String> _currentWordList) {
    currentWordList.clear();
    currentWordList.addAll(_currentWordList);
  }

  void refreshAllData(List<String> _currentWordList) {
    setState(() {
      _setData(_currentWordList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentWordList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 45, right: 45),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.search,
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: Container(
                          child: Text(currentWordList[index]),
                          margin: EdgeInsets.only(right: 20),
                        )),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RecentSearchedWordsWidget extends StatefulWidget {
  final List<String> recentWordList;

  RecentSearchedWordsWidget(this.recentWordList);

  final _RecentSearchedWordsWidget _recentSearchedWordsWidget =
      _RecentSearchedWordsWidget();

  _RecentSearchedWordsWidget getStateData() => _recentSearchedWordsWidget;

  @override
  _RecentSearchedWordsWidget createState() => _recentSearchedWordsWidget;
}

class _RecentSearchedWordsWidget extends State<RecentSearchedWordsWidget> {
  List<String> recentWordList = [];

  @override
  void initState() {
    super.initState();
    addAllData(widget.recentWordList);
  }

  void addAllData(List<String> _recentWordList) {
    recentWordList.clear();
    recentWordList.addAll(_recentWordList);
  }

  void removeBtn(String name) {
    setState(() {
      recentWordList.removeWhere((element) => element == name);
    });
  }

  void removeAllBtn() {
    setState(() {
      recentWordList.clear();
    });
  }

  Widget getRecentWordBtn(String recentWord) {
    final BorderRadius _baseBorderRadius = BorderRadius.circular(15);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      height: 47,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color.fromRGBO(246, 246, 246, 1),
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    removeBtn(recentWord);
                  },
                  child: Center(
                    child: Image.asset(
                      'images/cancel_icon.png',
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    recentWord,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 113, 113, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: EdgeInsets.only(top: 30, left: 40, right: 40),
      child: GridView.count(
        childAspectRatio: 2.5,
        crossAxisCount: 3,
        children: List.generate(recentWordList.length, (index) {
          return getRecentWordBtn(recentWordList[index]);
        }),
      ),
    );
  }
}

class PopularSearchedWordItem extends StatelessWidget {
  final int leftRankNumber;
  final String leftWordName;
  final int rightRankNumber;
  final String rightWordName;

  PopularSearchedWordItem(
      {Key? key,
      required this.leftRankNumber,
      required this.leftWordName,
      required this.rightRankNumber,
      required this.rightWordName})
      : super(key: key);

  void getRowItem() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 7),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          leftRankNumber.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(leftWordName),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          rightRankNumber.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(rightWordName),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromRGBO(0, 0, 0, 0.3),
        ),
      ],
    );
  }
}

class PopularSearchedWordsWidget extends StatefulWidget {
  final List<String> popularWordNameList;
  PopularSearchedWordsWidget({Key? key, required this.popularWordNameList})
      : super(key: key);

  @override
  _PopularSearchedWordsWidget createState() => _PopularSearchedWordsWidget();
}

class _PopularSearchedWordsWidget extends State<PopularSearchedWordsWidget> {
  List<String> popularWordNameList = [];

  @override
  void initState() {
    super.initState();
    _setData(widget.popularWordNameList);
  }

  void _setData(List<String> _popularWordList) {
    popularWordNameList.clear();
    popularWordNameList.addAll(_popularWordList);
  }

  void refreshData(List<String> refreshedWordList) {
    setState(() {
      _setData(refreshedWordList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: popularWordNameList.length ~/ 2,
      itemBuilder: (BuildContext context, int index) {
        return PopularSearchedWordItem(
            leftRankNumber: index + 1,
            leftWordName: popularWordNameList[index],
            rightRankNumber: index + 6,
            rightWordName: popularWordNameList[index + 5]);
      },
    );
  }
}
