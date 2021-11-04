import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/SeungHyun/screen/WishListScreen.dart';
import 'package:pet_service_application/community/screen/MyCommunityScreen.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/community/screen/CommunityMainScreen.dart';
import 'package:pet_service_application/myPage/screen/ActivityMedalScreen.dart';
import 'package:pet_service_application/myPage/screen/FaqScreen.dart';
import 'package:pet_service_application/myPage/screen/ReportScreen.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';
import 'package:pet_service_application/myPage/screen/PetProfileScreen.dart';
import 'package:pet_service_application/myPage/screen/UserProfileScreen.dart';
import 'package:pet_service_application/myPage/screen/QnaScreen.dart';
import 'package:pet_service_application/myPage/widget/UserProfileWidget.dart';


class MyPage extends StatefulWidget {

  MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.11),
            // 프로필 사진, 닉네임, 등급, 자기소개를 감싸는 전체 Widget
            UserProfileWidget(),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.04),
            //프로필 편집 버튼 Card
            Card(
              // 프로필 편집 버튼
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              // 카드 테두리의 둥글기 설정값
              elevation: 4.0,
              // margin: EdgeInsets.only(
              //   top: MediaQuery.of(context).size.height * 0.01625,
              //   bottom: MediaQuery.of(context).size.height * 0.01625,
              // ),
              child: InkWell(
                  splashColor: Colors.grey.withAlpha(30),
                  child: Container(
                    // 카드 박스의 Size
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '프로필 편집',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()));
                  }),
            ),
            SizedBox(height: 16),
            //반려동물 프로필 선택창 Stack
            // !! 추후 Pageview 느낌으로 재구현하기
            Stack(children: [
              Positioned(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  // 카드 테두리의 둥글기 설정값
                  elevation: 4.0,
                  child: Container(
                    // 카드 박스의 Size
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(), // 좌측 : 빈공간
                        Column(
                          // 중간 : PageView로 크게 묶어야 하나?
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            // '''버튼
                            Row(
                              children: [
                                Icon(
                                  Icons.circle, size: 6,
                                  color: GREY,
                                ),
                                SizedBox(width: 9),
                                Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: GREY,
                                ),
                                SizedBox(width: 9),
                                Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: GREY,
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            //
                            //펫 프로필 사진
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/profile/pet_profile_sample.png'),
                                    // NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            //펫 이름
                            Text(
                              PetInfo.petName,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            //
                            SizedBox(height: 10),
                            //함께하는 반려동물
                            InkWell(
                                splashColor: Colors.grey.withAlpha(30),
                                child: Container(
                                  alignment: Alignment.center,
                                  // 카드 박스의 Size
                                  width:
                                      MediaQuery.of(context).size.width * 0.308,
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  child: Text(
                                    '함께하는 반려동물 >',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PetProfileScreen()));
                                })
                          ],
                        ),
                        Container(), // 우측: 왕관 위치할 곳
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // 공간 띄우는 여백 top, right
                  top:MediaQuery.of(context).size.height*.037,
                  right:MediaQuery.of(context).size.width*.066,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    // 카드 테두리의 둥글기 설정값
                    elevation: 2.0,
                    child: Container(
                      // 카드 박스의 Size
                      width: MediaQuery.of(context).size.width*.1, //38
                      height: MediaQuery.of(context).size.width*.1,
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          'images/svg/crown.svg',
                          width: 18,
                          height: 17,
                          color: Color.fromRGBO(218, 218, 218, 1),
                          alignment: Alignment.center,
                        ),
                        //onTap:
                      )
                    ),
                  )
              ),
            ]),
            SizedBox(height: 16),
            //---------------------------------------------
            // 내 커뮤니티 / 내 알뜰장터 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 내 커뮤니티 버튼 Card
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius
                      .circular(12.0)), // 카드 테두리의 둥글기 설정값
                  elevation: 4.0,
                  margin: EdgeInsets.only(left:MediaQuery
                      .of(context)
                      .size
                      .width * 0.044),
                  child: InkWell(
                      splashColor: Colors.grey.withAlpha(30),
                      child: Container( // 카드 박스의 Size
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.43,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/svg/community.svg', // 커뮤니티 이미지
                              width: 16,
                              height: 16, // 크기는 폰트 사이즈와 맞게
                            ),
                            SizedBox(width: 8),
                            Text('내 커뮤니티',
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // 재현님이 만든 커뮤니티 페이지로 이동하기 채우기
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCommunityScreen()));
                      }
                  ),
                ),
                // 내 알뜰장터 버튼 Card
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius
                      .circular(12.0)), // 카드 테두리의 둥글기 설정값
                  elevation: 4.0,
                  margin: EdgeInsets.only(right:MediaQuery
                      .of(context)
                      .size
                      .width * 0.044),
                  child: InkWell(
                      splashColor: Colors.grey.withAlpha(30),
                      child: SizedBox( // 카드 박스의 Size
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.43,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/svg/shopping_list.svg',
                              // 알뜰장터 이미지
                              width: 16,
                              height: 16, // 크기는 폰트 사이즈와 맞게
                            ),
                            SizedBox(width: 8),
                            Text('내 알뜰장터',
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // 중고장터 페이지로 이동하는 기능 채우기
                      }
                  ),
                ),
              ],
            ),
            SizedBox(height: 45),
            // --------------------------------------------
            // 1. 카테고리: 쇼핑몰
            Container(
              padding: EdgeInsets.only(left: MediaQuery
                  .of(context)
                  .size
                  .width * .077),
              alignment: Alignment.centerLeft,
              child: Text("쇼핑몰",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // 1-1. 쇼핑 pick
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/wish_list.svg',
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      '쇼핑 Pick',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WishListScreen()
                  ),
                );
                print('WishListScreen page is clicked');
              },
            ),
            // 1-2. My 쇼핑 리뷰
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/my_review.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      'My 쇼핑 리뷰', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => 내 리뷰 페이지()
                //   ),
                // );
                // print('WishListScreen page is clicked');
              },
            ),
            SizedBox(height: 45),
            // --------------------------------------------
            // 2. 카테고리: 기타
            Container(
              padding: EdgeInsets.only(left: MediaQuery
                  .of(context)
                  .size
                  .width * .077),
              alignment: Alignment.centerLeft,
              child: Text("기타",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // 2-1. 활동메달
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/tmp_medal.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      '활동메달', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityMedal()
                  ),
                );
                print('ActivityMedal page is clicked');
              },
            ),
            // 2-2. QnA
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/qna.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      'QnA', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Qna(nickName: "QnA")
                  ),
                );
                // print('QnA Page is clicked');
              },
            ),
            // 2-3. FAQ
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/faq.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      'FAQ', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Faq(nickName: "FAQ")
                  ),
                );
                print('FAQ page is clicked');
              },
            ),
            // 2-4. 카카오톡 친구초대
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/kakao_invite.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      '카카오톡 친구초대', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => 카카오톡 친구초대()
                //   ),
                // );
                // print('_ Page is clicked');
              },
            ),
            // 2-5. 신고하기
            ListTile(
              minVerticalPadding: MediaQuery
                  .of(context)
                  .size
                  .height * .02,
              //contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.12), // 전체 내부 패딩 균등 설정
              title: Container(
                padding: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * .08),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'images/svg/report.svg', // 1. list에 넣을 변수 값
                        width: 25.5, // 아이콘 가로 고정 상수값
                        height: 28, // 아이콘 세로 고정 상수값
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width*.07, // 아이콘 기기 반응형 가로 사이즈
                        // height: MediaQuery.of(context).size.height*.077, // 아이콘 기기 반응형 가로 사이즈
                      ),
                    ),
                    SizedBox(width: 42.5),
                    Text(
                      '신고하기', // 2. list에 넣을 변수 값
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromRGBO(242, 62, 62, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Report())
                  );
                print('Report Page is clicked');
              },
            ),
            SizedBox(height: 45),


          ],
        ),
      ]),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}