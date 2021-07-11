import 'package:flutter/material.dart';
import 'package:pet_service_application/SeungHyun/screen/shopping_basket.dart';
import 'package:pet_service_application/main.dart';
import 'package:pet_service_application/SeungHyun/screen/wish_list_screen.dart';

// 호출하는 방법

/*
body : Container(), // body 밑부분에
bottomNavigationBar :MenuBottomBar(), 하면 됩니다.

 */

class MenuBottomBar extends StatefulWidget {
  @override
  _MenuBottomBar createState() => _MenuBottomBar();
}

class _MenuBottomBar extends State<MenuBottomBar> {
  int screenIndex = 0;
  List<Widget> screenList = [
    Text('뒤로가기'),
    Text('홈화면'),
    Text('찜목록'),
    Text('결제화면'),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false, // Text 안보이게 하는거(이 함수는 title null이 안됨)
      showUnselectedLabels: false,
      currentIndex: screenIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(209, 209, 209, 1),
          ),
          title: Text('test'),
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('images/home_image.png'),
            color: Color.fromRGBO(209, 209, 209, 1),
          ),
          title: Text('test'),
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Color.fromRGBO(209, 209, 209, 1),
          ),
          title: Text('test'),
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('images/shopping_cart_figma.png'),
            color: Color.fromRGBO(209, 209, 209, 1),
          ),
          title: Text('test'),
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
      ],
      onTap: (value) {
        setState(() {
          //상태 갱신이 되지 않으면 동작을 하지 않음
          screenIndex = value;
          if (value == 1) {
            Navigator.pop(context);
          }
          if (value == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          }
          if (value == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Wish_List_Screen()));
          }
          if (value == 4) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Shopping_Basket()));
          }
        });
      },
    );
  }
}
