import 'package:flutter/material.dart';

class TestUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 47,
          child: PetCategoryListView(petCategoryStrList: ['#강아지', '#웰시코기']),
        ),
      ),
    );
  }
}

class PetCategoryItem extends StatelessWidget {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(15);
  final String petCategoryStr;
  final Function() btnClickEvent;

  PetCategoryItem(
      {Key? key, required this.petCategoryStr, required this.btnClickEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
      child: Container(
        width: 125,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  petCategoryStr,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 113, 113, 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: btnClickEvent,
                child: Text(
                  'X',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 113, 113, 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetCategoryListView extends StatefulWidget {
  final List<String> petCategoryStrList;

  PetCategoryListView({required this.petCategoryStrList});

  final _PetCategoryListView _petCategoryListView = _PetCategoryListView();

  _PetCategoryListView getStateData() => _petCategoryListView;

  @override
  _PetCategoryListView createState() => _petCategoryListView;
}

class _PetCategoryListView extends State<PetCategoryListView> {
  List<String> petCategoryStrList = [];

  @override
  void initState() {
    super.initState();
    _setData(widget.petCategoryStrList);
  }

  void _setData(List<String> _petCategoryStrList) {
    petCategoryStrList.clear();
    petCategoryStrList.addAll(_petCategoryStrList);
  }

  void add(String _petCategoryStr) {
    setState(() {
      petCategoryStrList.add(_petCategoryStr);
    });
  }

  void remove(String _petCategoryStr) {
    setState(() {
      petCategoryStrList.removeWhere((element) => element == _petCategoryStr);
    });
  }

  void clear() {
    setState(() {
      petCategoryStrList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(viewportFraction: 0.3, initialPage: 0);

    return ListView.builder(
      itemCount: petCategoryStrList.length,
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return PetCategoryItem(
            petCategoryStr: petCategoryStrList[index],
            btnClickEvent: () {
              clear();
            },
          );
        else
          return PetCategoryItem(
            petCategoryStr: petCategoryStrList[index],
            btnClickEvent: () {
              remove(petCategoryStrList[index]);
            },
          );
      },
    );
  }
}
