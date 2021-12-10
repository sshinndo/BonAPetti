import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/community/CommunityInfo.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

class PostScreen extends StatefulWidget {
  final CommunityInfo communityInfo; //굿즈 정보 객체

  PostScreen({Key? key, required this.communityInfo}) : super(key: key); //생성자

  @override
  _PostScreen createState() => _PostScreen(); //위젯 생성
}

class _PostScreen extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.width * 0.1; ///좋아요 아이콘 크기
    const double profileIconMultiplier = 1.3; ///프로필 아이콘 크기 비례값
    const double nameSize = 20; ///이름 글자 크기
    const double hashTagFontSize = 15; ///해시태그 글자 크기

    return Scaffold(
        floatingActionButton: BackSpaceButton(),
        bottomNavigationBar: MenuBottomBar(),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView(
              children: [
                AppBarWithAlarm(nickName: Logger().userData.name),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: widget.communityInfo.user.myImage == '' //내 이미지 존재 여부 확인
                              ?
                          //디폴트 아이콘
                          SvgPicture.asset('images/profile/userdefault.svg',
                              height: iconSize * profileIconMultiplier,
                              width: iconSize * profileIconMultiplier)
                          //유저 아이콘 불러오기
                              : Image.network(widget.communityInfo.user.myImage,
                              fit: BoxFit.fill,
                              height: iconSize * profileIconMultiplier,
                              width:
                              iconSize * profileIconMultiplier), //Profile Icon
                        ),///유저 이미지
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                                Text(widget.communityInfo.user.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: nameSize,
                                        fontWeight: FontWeight.bold)),
                                Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                //유저 닉네임
                                Text(widget.communityInfo.pet.petName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: nameSize - 4,
                                        fontWeight: FontWeight.bold))
                                //펫 이름
                              ],
                            ) //유저&펫 네임
                        )///Profile Name
                      ],
                    )),///프로필 설명
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                    child: Card(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child:
                        //포스트 이미지 존재 여부
                        widget.communityInfo.imageUrls.isEmpty
                        //빈 공간
                            ? SizedBox(
                          height: 50,
                        )
                        //첫 이미지 (대표 이미지)
                            : Image.network(
                          widget.communityInfo.imageUrls.first,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return CircularProgressIndicator();
                          },
                        ))),///커뮤니티 대표 이미지
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    widget.communityInfo.hashTags,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: hashTagFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),///hashtags
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                    child: Stack(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: RichText(
                            text: TextSpan(children: getDialogueSpan(widget.communityInfo)),
                            softWrap: true,
                          ), //dialogue,
                        ),

                        ///dialogue
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.communityInfo.setLike();
                                debugPrint('Like change : ${widget.communityInfo.isLike}');
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              color: widget.communityInfo.isLike
                                  ? Color.fromRGBO(255, 87, 87, 1)
                                  : Color.fromRGBO(217, 217, 217, 1),
                              size: iconSize,
                            ),
                          ), //좋아요 값 변경
                        ),///좋아요
                      ],
                    )),///내용과 좋아요
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                /*Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '상품태그',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),
                        ),///상품태그 텍스트
                      ],
                    ))*////상품태그
              ],
            )
          )
        );
  }
}

///포스트 내용 불러오기
List<TextSpan> getDialogueSpan(CommunityInfo communityInfo) {
  const double dialogueFontSize = 15;
  const int maxString = 2;

  List<TextSpan> dialogueSpan = [];
  var dialogue = communityInfo.dialogue;

  if (dialogue.isEmpty) {
    dialogueSpan.add(
      TextSpan(
        text: '내용이 없습니다',
        style: TextStyle(
            fontSize: dialogueFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.red),
      ),
    );
  } else {
    int count = 0;
    for (var i in dialogue) {
      dialogueSpan.add(
        TextSpan(
          text: i,
          style: TextStyle(
            color: Colors.black,
            fontSize: dialogueFontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

      count++;
      if (count >= maxString) break;
    }
  }

  if (dialogue.length > maxString) {
    dialogueSpan.add(
      TextSpan(
        text: '...',
        style: TextStyle(
          color: Colors.black,
          fontSize: dialogueFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return dialogueSpan;
}
