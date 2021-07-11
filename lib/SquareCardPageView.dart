import 'package:flutter/material.dart';
import 'dart:math';

class SquareCard extends StatelessWidget {
  final String imgUrl;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);

  SquareCard({Key? key, required this.imgUrl}) : super(key: key);

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
        child: Image.network(
          imgUrl,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class SquareCardPageView extends StatefulWidget {
  final List<String> imgUrlList;
  final double _viewportFractionValue = 0.9;

  SquareCardPageView({Key? key, required this.imgUrlList});

  double getViewPortFractionValue() => _viewportFractionValue;

  @override
  _SquareCardPageView createState() => _SquareCardPageView();
}

class _SquareCardPageView extends State<SquareCardPageView> {
  List<String> imgUrlList = [];
  List<SquareCard> squareCardList = [];

  @override
  void initState() {
    super.initState();
    _loadData(widget.imgUrlList);
  }

  void _loadData(List<String> _imgUrlList) {
    imgUrlList.clear();
    imgUrlList.addAll(_imgUrlList);

    imgUrlList.forEach((element) {
      squareCardList.add(SquareCard(imgUrl: element));
    });
  }

  void refresh(List<String> _imgUrlList) {
    setState(() {
      _loadData(_imgUrlList);
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
            children: squareCardList,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: DotsIndicator(
            controller: pageController,
            itemCount: squareCardList.length,
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
