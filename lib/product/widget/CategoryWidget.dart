import 'package:flutter/material.dart';

class CategoryTabcontroller extends StatefulWidget {
  CategoryTabcontroller({Key? key}) : super(key: key);

  @override
  _CategoryTabcontrollerState createState() =>
      _CategoryTabcontrollerState();
}

class _CategoryTabcontrollerState
    extends State<CategoryTabcontroller>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('상품설명'),
          SizedBox(width: 10.0),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('성분'),
          SizedBox(width: 10.0),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('리뷰'),
          SizedBox(width: 10.0),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('가격비교'),
          SizedBox(width: 10.0),
        ],
      ),
    )
  ];

  TabController? _controller;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this, // vsync: state 자체
      length: myTabs.length,
    );
  }

  //initState와 짝꿍 (없애기 위함)
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;
    return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: height * 50,
            width: width * 330,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer, // 둥근 모서리 부분의 음영 또한 둥글지게 함
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TabBar(
                  controller: _controller,
                  labelColor: Colors.black, // 선택 Tap의 글씨 색상
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                  // 선택되지 않은 label
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: TextStyle(),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromRGBO(255, 194, 194, 1),
                  ),
                  tabs: myTabs,
                  onTap: (int currentTab) {
                    setState(() => selectedTab = currentTab);
                  }),
            ),
          ),
          TabBarView(
              controller: _controller,
              children: [
                Center(
                  child: Text(
                    '11111111111',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    '2222222222222',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '333333333333',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '44444444444',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]

            // children: myTabs.map((Tab tab) {
            //   return Container(
            //     width: double.infinity,
            //     color: selectedTab == 0 ? Colors.red : Colors.indigo,
            //   );
            // }).toList(),
          ),
        ]);
  }
}