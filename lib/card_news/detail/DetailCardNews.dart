import 'package:flutter/material.dart';
import 'dart:math';

class DetailCardNewsModel {
  String imgUrl;
  String title;

  DetailCardNewsModel(this.imgUrl, this.title);
}

class DetailCardNewsItem extends StatelessWidget {
  final DetailCardNewsModel detailCardNewsModel;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);

  DetailCardNewsItem({Key? key, required this.detailCardNewsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 클릭시 이동할 거
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        child: Stack(
          children: [
            Image.network(
              detailCardNewsModel.imgUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
                bottom: 15.0,
                right: 15.0,
                child: Text(detailCardNewsModel.title,
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}

class DetailCardNewsPageView extends StatefulWidget {
  final List<DetailCardNewsModel> detailCardNewsModelList;
  final double _viewportFractionValue = 0.9;

  DetailCardNewsPageView({Key? key, required this.detailCardNewsModelList});

  double getViewPortFractionValue() => _viewportFractionValue;

  @override
  _DetailCardNewsPageView createState() => _DetailCardNewsPageView();
}

class _DetailCardNewsPageView extends State<DetailCardNewsPageView> {
  List<DetailCardNewsModel> detailCardNewsModelList = [];
  List<DetailCardNewsItem> detailCardNewsItemList = [];

  @override
  void initState() {
    super.initState();
    _loadData(widget.detailCardNewsModelList);
  }

  void _loadData(List<DetailCardNewsModel> _detailCardNewsModelList) {
    detailCardNewsModelList.clear();
    detailCardNewsModelList.addAll(_detailCardNewsModelList);

    detailCardNewsModelList.forEach((element) {
      detailCardNewsItemList
          .add(DetailCardNewsItem(detailCardNewsModel: element));
    });
  }

  void refresh(List<DetailCardNewsModel> _detailCardNewsDataList) {
    setState(() {
      _loadData(_detailCardNewsDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
        viewportFraction: widget._viewportFractionValue, initialPage: 0);
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: detailCardNewsItemList,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: DotsIndicator(
            controller: pageController,
            itemCount: detailCardNewsItemList.length,
            color: Color.fromRGBO(196, 196, 196, 1),
            onPageSelected: (int page) {
              pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.grey,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 5.5;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.7;

  // The distance between the center of each dot
  static const double _kDotSpacing = 12.5;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
