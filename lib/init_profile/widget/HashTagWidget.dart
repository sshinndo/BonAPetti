import 'package:flutter/material.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';

class HashTagButton extends StatelessWidget {
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);
  String text;
  VoidCallback onPressed;
  // final Function() btnClickEvent;

  HashTagButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width/360;
    var height = MediaQuery.of(context).size.height/800;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
        child: Container(
          color: WHITE_GREY,
          width: width*60,
          height: height*30,
          child: Center(
            child: Text(
              '#  '+ text,
              style: TextStyle(
                color: Color.fromRGBO(255, 113, 113, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}