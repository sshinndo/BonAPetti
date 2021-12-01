import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/community/CommunityInfo.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';


class CommunityWidget extends StatefulWidget {
  final CommunityInfo communityInfo;  //굿즈 정보 객체

  CommunityWidget({Key? key, required this.communityInfo}) : super(key: key); //생성자

  @override
  _CommunityWidget createState() => _CommunityWidget(); //위젯 생성
}

class _CommunityWidget extends State<CommunityWidget> {

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery
        .of(context)
        .size
        .width * 0.1; //좋아요 아이콘 크기
    const double profileIconMultiplier = 1.5;
    const double nameSize = 16;
    const double hashTagFontSize = 15;

    return GestureDetector(
      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedGoodsScreen(widget.goodsInfo)));  //터치시 굿즈 디테일 창으로 이동
      },*/
      child: Card(
          elevation: 0,
          color: Colors.transparent,
          semanticContainer: true,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                        Logger.storageUrl + widget.communityInfo.user.myImage,
                        fit: BoxFit.fill,
                        height: iconSize * profileIconMultiplier,
                        width: iconSize * profileIconMultiplier
                      ),  //Profile Icon
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              widget.communityInfo.user.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: nameSize,
                                  fontWeight: FontWeight.bold
                              )
                          ),  //유저 닉네임
                          Text(
                              widget.communityInfo.pet.petName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: nameSize - 2,
                                  fontWeight: FontWeight.bold
                              )
                          ) //펫 이름

                        ],
                      ) //유저&펫 네임
                    ) //Profile Name
                  ],
                )
              ), //Profile Info
              Container(
                child: Card(
                  margin: EdgeInsets.only(top:10,bottom:20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                      Logger.storageUrl + widget.communityInfo.imageUrls.first,
                      fit: BoxFit.fill
                  ),
                )
            ),  //커뮤니티 대표 이미지 (0번지)
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:20),
                child: Text(
                  widget.communityInfo.hashTags,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: hashTagFontSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),  //hashtags
              Container(
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left:20,right:20),
                      child: RichText(
                        text: TextSpan(
                          children: getDialogueSpan(widget.communityInfo)
                        )
                      ),  //dialogue,
                    ), //dialogue
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.communityInfo.setLike(!widget.communityInfo.isLike);
                          }
                          );
                        },
                        child: Icon(
                          Icons.favorite,
                          color: widget.communityInfo.isLike ? Color.fromRGBO(255, 87, 87, 1) : Color.fromRGBO(217, 217, 217, 1),
                          size: iconSize,
                        ),
                      ),  //좋아요 값 변경
                    ), //좋아요
                ],
              )
            ) //Dialogue and Like
            ],
          )
        )
      );
    }
  }

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
            fontSize: dialogueFontSize, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
  else
  {
    int count = 0;
    for (var i in dialogue)
    {
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
      if (count >= maxString)
        break;
    }
  }

  if(dialogue.length > maxString)
  {
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