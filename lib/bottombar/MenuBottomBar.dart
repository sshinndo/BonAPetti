import 'package:flutter/material.dart';
import 'package:pet_service_application/community/screen/CommunityMainScreen.dart';
import 'package:pet_service_application/mypage/screen/MyPageScreen.dart';
import 'package:pet_service_application/product/screen/shopping_basket.dart';
import 'package:pet_service_application/main.dart';
import 'package:pet_service_application/product/screen/WishListScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/community/screen/CommunityMainScreen.dart';
// 호출하는 방법
/*
body : Container(), // body 밑부분에
      //BackSpaceButton : 원형의 뒤로 가기 floating 버튼

      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
하시면 됩니다.
*/
class BackSpaceButton extends StatelessWidget {
  const BackSpaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset
        ('images/bottomBar/icon_back_button.svg',
          color: Color.fromRGBO(157, 157, 157, 1), width: 14, height: 14),
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
    );
  }
}


class MenuBottomBar extends StatefulWidget {

  MenuBottomBar({Key? key}) : super(key: key);

  @override
  _MenuBottomBar createState() => _MenuBottomBar();
}

class _MenuBottomBar extends State<MenuBottomBar> {
  int screenIndex = 0;
  List<Widget> screenList = [
    Text('홈으로'),
    Text('중고장터'),
    Text('관심리스트'),
    Text('커뮤니티'),
    Text('마이페이지'),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true, // Text 안보이게 하는거(이 함수는 title null이 안됨), true: text가 보임
      showUnselectedLabels: true, // true: text가 보임
      selectedItemColor: Color.fromRGBO(98, 98, 98, 1), //선택된 폰트 컬러
      unselectedItemColor: Color.fromRGBO(98, 98, 98, 1), // 다른 폰트 컬러
      selectedFontSize: 10, // 선택된 bottomBar 폰트 사이즈
      unselectedFontSize: 10, // 다른 bottomBar 폰트 사이즈
      currentIndex: screenIndex,
      type: BottomNavigationBarType.fixed, // 탭 할때 item의 폭을 일정하게
      items: [

        BottomNavigationBarItem(
          icon: SvgPicture.asset('images/bottomBar/icon_home.svg', width: 25,height: 25),
          label: '홈으로',
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('images/svg/shopping_list.svg',color: Colors.black54,width: 25,height: 25),
          label: '알뜰장터',
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('images/bottomBar/icon_wish_list.svg',color: Colors.black54,width: 25,height: 25,),
          label: '관심리스트',
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('images/svg/community.svg',color: Colors.black54,width: 25,height: 25,),
          label: '커뮤니티',
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('images/bottomBar/icon_my_page.svg',color: Colors.black54,width: 25,height: 25,),
          label: '마이페이지',
          backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        ),
      ],
      onTap: (value) {
        setState(() {
          //상태 갱신이 되지 않으면 동작을 하지 않음
          screenIndex = value;
          if (value == 0) { // 홈으로
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }
          if (value == 1) { // 중고장터
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => UsedMarket()));
          }
          if (value == 2) { // 관심리스트
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WishListScreen()));
          }
          if (value == 3) { // 커뮤니티
            Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CommunityMainScreen()));
          }
          if (value == 4) { // 마이페이지
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => MyPage()));
          }
        });
      },
    );
  }
}

