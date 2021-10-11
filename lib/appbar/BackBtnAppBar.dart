import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackBtnAppBar extends StatefulWidget {
  final String nickName;

  BackBtnAppBar({Key? key, required this.nickName}) : super(key: key);

  @override
  _BackBtnAppBar createState() => _BackBtnAppBar();
}

class _BackBtnAppBar extends State<BackBtnAppBar> {
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
            Expanded(
              flex: 1,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('images/svg/arrow_back.svg'),
                ),
              ),
            ),
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
                child: Container()
            ),
          ],
        ),
      ),
    );
  }
}
