import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/TestUI.dart';

class AppBarWithAlarm extends StatefulWidget {
  final String nickName;

  AppBarWithAlarm({Key? key, required this.nickName}) : super(key: key);

  @override
  _AppBarWithAlarm createState() => _AppBarWithAlarm();
}

class _AppBarWithAlarm extends State<AppBarWithAlarm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      margin: EdgeInsets.only(
          top: 20 + MediaQuery.of(context).padding.top, bottom: 10),
          height: AppBar().preferredSize.height,
          child: Row(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    widget.nickName,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  ),
                )
              ),
          Expanded(
              flex: 1,
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        // 알람버튼 event
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TestUI()));
                      },
                      icon: SvgPicture.asset('images/svg/bell.svg')))),
        ],
      ),
    ));
  }
}
