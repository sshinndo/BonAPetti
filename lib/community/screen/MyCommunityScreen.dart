import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/community/screen/PostUploadScreen.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/widgets/CommunityWidget.dart';

import '../CommunityInfo.dart';

class MyCommunityScreen extends StatefulWidget {
  const MyCommunityScreen({Key? key}) : super(key: key);
  @override
  _MyCommunityScreenState createState() => _MyCommunityScreenState();
}

class _MyCommunityScreenState extends State<MyCommunityScreen> {

  @override
  void initState() {
    UserData.getUserData(Logger().userData.uid.toString()).then((value) => Logger().userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double nameSize = 20;
    const double textSize = 18;
    const double profileIconMultiplier = 0.4;
    const int maxPostIcons = 12;
    final double defaultIconSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children : [
          AppBarWithAlarm(nickName: Logger().userData.name), //닉네임 & 알림
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children : [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Logger().userData.myImage == '' //내 이미지 존재 여부 확인
                        ?
                    //디폴트 아이콘
                    SvgPicture.asset('images/profile/userdefault.svg',
                        height: defaultIconSize * profileIconMultiplier,
                        width: defaultIconSize * profileIconMultiplier )
                    //유저 아이콘 불러오기
                        : Image.network(Logger().userData.myImage,
                        fit: BoxFit.fill,
                        height: defaultIconSize * profileIconMultiplier,
                        width: defaultIconSize * profileIconMultiplier) //Profile Icon
                ),///유저 이미지
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Text(
                  Logger().userData.name,
                  style: TextStyle(
                    fontSize: nameSize,
                    fontWeight: FontWeight.bold
                  ),

                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 3),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    color: Colors.grey
                  ),
                  child: Text(
                    '팔로잉 '+Logger().userData.following.length.toString()+' · 팔로워 '+Logger().userData.follower.length.toString(),
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),///팔로잉,팔로워
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    Logger().userData.description,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: textSize
                    ),
                  ),
                ),///유저 한줄소개
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                      elevation: 4.0,
                      margin: EdgeInsets.only(left:defaultIconSize * 0.07),
                      child: InkWell(
                          splashColor: Colors.grey.withAlpha(30),
                          child: Container(
                            width: defaultIconSize * 0.4,
                            height: defaultIconSize * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/community/pencil_icon.svg', //포스트작성 이미지
                                  width: 16,
                                  height: 16,
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text('글 올리기',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            /// 포스트 작성 페이지
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostUploadScreen()));
                          }
                      ),
                    ),///글 올리기 Card
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                      elevation: 4.0,
                      margin: EdgeInsets.only(right:defaultIconSize * 0.07),
                      child: InkWell(
                          splashColor: Colors.grey.withAlpha(30),
                          child: Container(
                            width: defaultIconSize * 0.4,
                            height: defaultIconSize * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/community/shorts_icon.svg', //포스트작성 이미지
                                  width: 16,
                                  height: 16,
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text('쇼츠 올리기',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            /// 쇼츠 작성 페이지
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCommunityScreen()));
                          }
                      ),
                    ),///쇼츠 올리기 Card
                  ],
                ),///게시글,쇼츠작성 버튼
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('갤러리',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)), //전체
                      Text('쇼츠', style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),///내 게시글 필터 (제스쳐 추가 필요)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      itemCount: min(maxPostIcons, Logger().userData.posts.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder<CommunityInfo>(
                            future: CommunityInfo.getCommunityData(Logger().userData.posts[index]),
                            builder: (BuildContext context, AsyncSnapshot<CommunityInfo> postInfo) {
                              debugPrint(postInfo.connectionState.toString());
                              ///데이터를 아직 받아 오지 못했을 시
                              if (postInfo.connectionState != ConnectionState.done) {
                                return CircularProgressIndicator();
                              }
                              ///오류 발생
                              else if (postInfo.hasError || postInfo.data == null) {
                                return Icon(Icons.cancel); //오류 발생 반환 패딩
                              }
                              else {
                                ///데이터를 정상적으로 받아왔을 시
                                debugPrint('get Post Image Complete');
                                return CommunityIcon(communityInfo: postInfo.data!);
                              }
                            });
                        }
                    )
                  ),
                ) ///내 게시글들
              ]
            ),
          ),  //프로필 정보
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar()
    );
  }
}