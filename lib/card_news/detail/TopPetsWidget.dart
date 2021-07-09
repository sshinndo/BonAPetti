import 'package:flutter/material.dart';

class TopPetsWidget extends StatefulWidget {
  @override
  _TopPetsWidget createState() => _TopPetsWidget();
}

final pinkBoldTextColor = Color.fromRGBO(255, 87, 87, 1);

class _TopPetsWidget extends State<TopPetsWidget> {
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
                      text: '이번 ',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                  TextSpan(
                      text: 'TOP PETS',
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
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: 500,
            child: TopPetPageView(
              topPetModelList: [
                TopPetModel(
                  'https://picsum.photos/250?image=9',
                  '돌돌이님',
                  'https://picsum.photos/250?image=9',
                ),
                TopPetModel(
                  'https://picsum.photos/250?image=9',
                  '돌돌이님',
                  'https://picsum.photos/250?image=9',
                ),
                TopPetModel(
                  'https://picsum.photos/250?image=9',
                  '돌돌이님',
                  'https://picsum.photos/250?image=9',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopPetModel {
  String backgroundImgUrl;
  String nickName;
  String profileImgUrl;

  TopPetModel(this.backgroundImgUrl, this.nickName, this.profileImgUrl);
}

class TopPetItem extends StatelessWidget {
  final TopPetModel topPetModel;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);

  TopPetItem({Key? key, required this.topPetModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(right: 50, top: 10, bottom: 10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              topPetModel.backgroundImgUrl,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(topPetModel.nickName + '님'),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(topPetModel.profileImgUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopPetPageView extends StatefulWidget {
  final List<TopPetModel> topPetModelList;

  TopPetPageView({Key? key, required this.topPetModelList}) : super(key: key);

  @override
  _TopPetPageView createState() => _TopPetPageView();
}

class _TopPetPageView extends State<TopPetPageView> {
  List<TopPetModel> topPetModelList = [];
  List<TopPetItem> topPetItemList = [];

  final PageController pageController =
      PageController(viewportFraction: 0.65, initialPage: 0);

  @override
  void initState() {
    super.initState();
    _loadData(widget.topPetModelList);
  }

  void _loadData(List<TopPetModel> _topPetModelList) {
    topPetModelList.clear();
    topPetModelList.addAll(_topPetModelList);

    topPetModelList.forEach((element) {
      topPetItemList.add(TopPetItem(topPetModel: element));
    });
  }

  void refresh(List<TopPetModel> _topPetDataList) {
    setState(() {
      _loadData(_topPetDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: topPetItemList,
      /*
      Scrollbar(
      controller: pageController,
      isAlwaysShown: true,
      child: 
      */
    );
  }
}
