import 'package:flutter/material.dart';
import 'package:pet_service_application/main.dart';
import '../SeungHyun/screen/wish_list_screen.dart';
import '../log_in/UserInfoClass.dart';
import '../drawer/Report.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class MainDrawer extends StatefulWidget {
  // drawer 부분 따로 class 분리

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  // final ImagePicker _picker = ImagePicker();
  // late PickedFile _image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Drawer(
        child: Center(
          child: Column(
            //padding: EdgeInsets.zero,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 25 + MediaQuery.of(context).padding.top,
                        bottom: 10,
                        left: 25,
                        right: 25),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: IconButton(
                              //alignment: Alignment.centerLeft,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back,
                                  color: Colors.grey[850]),
                            ),
                          ),
                        ),
                        Expanded(flex: 4, child: Text('')),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: IconButton(
                              //alignment: Alignment.centerRight,
                              onPressed: () => {
                                //Navigator.push(context,Setting); 추후 수정해야 할 것
                              },
                              icon:
                              Icon(Icons.settings, color: Colors.grey[850]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Column(children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 90.0,
                      backgroundColor: PINK,
                      child: GestureDetector(
                        child: CircleAvatar(
                            radius: 80.0,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/logo_main.png')
                        ),
                        // -----------------프로필 사진 추가 기능--------------------
                        // onTap: _getImage,
                        // -----------------프로필 사진 추가 기능--------------------
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Text(
                          '${UserInfo.userNickname}과(와) 함께하는\n${PetInfo.petName}님',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )
                      ),
                    ),
                    // -------닉네임 밑줄 버전인데, 가운데 정렬이 안돼서 skip 해뒀습니다----------
                    // Text.rich(TextSpan(children: [
                    //   TextSpan(
                    //     text: '${UserInfo.userNickname}',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20.0,
                    //         decoration: TextDecoration.underline),
                    //   ),
                    //   TextSpan(
                    //       text: '과(와) 함께하는\n',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20.0,
                    //       )
                    //   ),
                    //   TextSpan(
                    //       text: '${PetInfo.petName}님',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20.0,
                    //       )
                    //   )
                    // ])),
                    // -------닉네임 밑줄 버전인데, 가운데 정렬이 안돼서 skip 해뒀습니다----------
                  ])),
              //SizedBox(height: 50),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '친구의 정보',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onTap: () {
                        //Navigator.push
                        print('Profile is clicked');
                      },
                      //trailing: Icon(Icons.add) : +키 생략
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      // leading: Icon(
                      //   Icons.check_box_outlined,
                      //   color: Colors.grey[850],
                      // ),
                      title: Text(
                        '찜 목록',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Wish_List_Screen()));
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      // leading: Icon(
                      //   Icons.shopping_cart_outlined,
                      //   color: Colors.grey[850],
                      // ),
                      title: Text(
                        '장바구니',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        print('shopping_cart is clicked');
                      },
                    ),
                    SizedBox(
                        height: 20
                    ),
                    ListTile(
                      title: Text(
                        '신고하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: PINK,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Report()
                            ),
                        );
                        print('report button is clicked');
                      },
                    ),
                    /*
                      ListTile(
                        leading: Icon(
                          Icons.login_outlined,
                          color: Colors.grey[850],
                        ),
                        title: Text('로그인 하기'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Splash()));
                        },
                      ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Future _getImage() async{
//   PickedFile image = await _picker.getImage(source: ImageSource.gallery);
//   setState(() {
//     _image = image;
//   });
// }
}