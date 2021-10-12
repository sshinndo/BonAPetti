import 'package:flutter/material.dart';
import 'package:pet_service_application/TestUI.dart';

class DrawerWithAlarmAppBar extends StatefulWidget {
  final String nickName;

  DrawerWithAlarmAppBar({Key? key, required this.nickName}) : super(key: key);

  @override
  _DrawerWithAlarmAppBar createState() => _DrawerWithAlarmAppBar();
}

class _DrawerWithAlarmAppBar extends State<DrawerWithAlarmAppBar> {
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
              )),
          Expanded(
              flex: 1,
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        // 알람버튼 event
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TestUI()));
                      },
                      icon: Image.asset('images/bell_icon.png')))),
        ],
      ),
    ));
  }
}
