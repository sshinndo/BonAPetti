import 'package:flutter/material.dart';

class NickNameAppBar extends StatefulWidget {
  final String nickName;

  NickNameAppBar({Key? key, required this.nickName}) : super(key: key);

  @override
  _NickNameAppBar createState() => _NickNameAppBar();
}

class _NickNameAppBar extends State<NickNameAppBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: 20 + MediaQuery.of(context).padding.top,
          bottom: 10,
        ),
        height: AppBar().preferredSize.height,
        child: Row(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Center(
            //     child: IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       icon: Image.asset('images/back_arrow.png'),
            //     ),
            //   ),
            // ),
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
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
