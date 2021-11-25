import 'package:flutter/material.dart';

class AlertDuplicateMessage extends StatelessWidget {
  final String msg='이미 사용중인 이름입니다.';
  const AlertDuplicateMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // figma상의 반응형 너비 & 높이
    var width = MediaQuery.of(context).size.width/360;
    var height = MediaQuery.of(context).size.height/800;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.84),
      child: Container(
        width: width*150,
        height: height*20,
        color: Color.fromRGBO(115, 89, 89, 0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(237, 84, 84, 1)
              ),
            )
          ],
        ),
      ),
    );
  }
}
