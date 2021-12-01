import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/community/CommunityInfo.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'package:pet_service_application/widgets/CommunityWidget.dart';
import 'package:pet_service_application/widgets/ShortsWidget.dart';

class CommunityMainScreen extends StatefulWidget {

  //CommunityMainScreen.CommunityMainScreen();

  @override
  _CommunityMainScreen createState() => _CommunityMainScreen();
}

class _CommunityMainScreen extends State<CommunityMainScreen> {
  UserData myInfo = Logger().userData;

  //커뮤니티 위젯 만큼 랜덤 유저 커뮤니티 페이지 불러옴
  Future<List<CommunityInfo>> initialPosts(int count) async {
    List<CommunityInfo> randomPosts = [];
    for(int i = 0; i<count; i++)
    {
      var randomPostID = CommunityInfo.getRandomPost();
      randomPostID.then((idValue) {
        debugPrint(idValue.toString());
        var randomPostData = CommunityInfo.getCommunityData(idValue);
        randomPostData.then((postValue)
        {
          randomPosts.add(postValue);
        });
      });
    }
    return randomPosts;
  }

  @override
  Widget build(BuildContext context) {
    var postData = initialPosts(2);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //세로로 나열 기준은 시작점 (제일 위부터)
        crossAxisAlignment: CrossAxisAlignment.center, //가로 나열 기준은 중심 (중심기준)
        children: [
          AppBarWithAlarm(nickName: myInfo.name),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    /*onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchRoute()));
                    },*/
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 30),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Color.fromRGBO(254, 254, 254, 1),
                          child: Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(
                                Icons.search,
                                size: 30,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  //검색창

                Container(
                  margin: EdgeInsets.only(bottom: 20,left: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          '전체',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),  //전체
                      Text(
                          '친구',
                          style: TextStyle(
                              fontSize: 20
                          )
                      ),//순수 도그온 카드
                    ],
                  ),  //전체-친구 필터 텍스트
                ),  //숏폼 필터 (제스쳐 추가 필요)

                Container(
                    height: 400,
                    margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/sample_profile.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        ),
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/sample_profile.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        ),
                        ShortsWidget(
                            shortsInfo: ShortsInfo(
                                'images/profile/sample_profile.png',
                                '돌돌이님',
                                '돌돌이님',
                                'images/shorts/shorts_thumb.png',
                                'images/shorts/shorts_thumb.png',
                                false
                            )
                        )
                      ],
                    )
                ),  //숏폼 위젯 스크롤 뷰

                Container(
                  //height: 600,
                  margin: EdgeInsets.only(top: 20,left:30,right:30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder(
                          future: postData,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //데이터를 아직 받아 오지 못했을 시
                          if(snapshot.hasData == false)
                              return CircularProgressIndicator();
                          else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                              )
                            );  //오류 발생 반환 패딩
                          }
                          else
                          {
                            //데이터를 정상적으로 받아왔을 시
                            return CircularProgressIndicator();//CommunityWidget(communityInfo: snapshot.data[0]);
                          }
                        }
                      )
                      //커뮤니티 페이지 불러오기

                    ],
                  ),
                )
              ]
            )
          ),
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}
