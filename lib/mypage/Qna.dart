import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

// class QnaDatas{
//   final String questionTitle; // 질문 제목
//   final String questionContents; // 질문 상세 내용
//   final String userNickName; // 질문 유저 닉네임
//   bool isUserNicknameSecret; // 닉네임 비공개 여부
//   final String answerTitle; // 답변 제목
//   final String answerContents; // 답변 상세 내용
//
//   // 생성자로 필드 초기화
//   QnaDatas(this. questionTitle, this.questionContents, this. userNickName, this.isUserNicknameSecret, this.answerTitle, this.answerContents);
// }

// QnA_QnA상세 페이지
class QnaDetails extends StatelessWidget {
  // final qnaDummyDatas qnaDatas
  // // 생성자로 아이템을 수신하여 필드에 저장

  const QnaDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: BackSpaceButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Column(
      children: [
        AppBarWithAlarm(nickName: "QnA"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        // Question Container
        Container(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .3,
          margin: EdgeInsets.symmetric(
            vertical: 68,
            horizontal: MediaQuery.of(context).size.width * .1,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    children: [
                      // 데이터 넣을 텍스트 공간
                      Expanded(
                        child: Text(
                          "Q. 구매는 어떻게 하나요?",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: MediaQuery.of(context).size.width * .035),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    children: [
                      // 데이터 넣을 텍스트 공간
                      Expanded(
                        child: Text(
                          "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문 드립니다.",
                          textAlign: TextAlign.start,
                          softWrap: true, // 텍스트가 영역을 넘어갈 경우 줄바꿈 여부
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        // Answer Container
        Container(
          color: Color.fromRGBO(196, 196, 196, 0.12),
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .3,
          margin: EdgeInsets.symmetric(
            vertical: 68,
            horizontal: MediaQuery.of(context).size.width * .1,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    children: [
                      // 데이터 넣을 텍스트 공간
                      Expanded(
                        child: Text(
                          "A. 보나펫티를 사용해주셔서 감사합니다. 상품은 가격비교 페이지를 통해 구매하실 수 있습니다.",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: MediaQuery.of(context).size.width * .035),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    children: [
                      // 데이터 넣을 텍스트 공간
                      Expanded(
                        child: Text(
                          "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매하실 수 있습니다.",
                          textAlign: TextAlign.start,
                          softWrap: true, // 텍스트가 영역을 넘어갈 경우 줄바꿈 여부
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

//QnA_질문작성 페이지
class QnaWriteQna extends StatefulWidget {
  const QnaWriteQna({Key? key}) : super(key: key);

  @override
  _QnaWriteQnaState createState() => _QnaWriteQnaState();
}

class _QnaWriteQnaState extends State<QnaWriteQna> {
  final List<String> _pageList = ['가격비교', '알뜰장터', '커뮤니티', '기타'];
  var _selectedPageValue = '가격비교';

  TextEditingController reportText = TextEditingController();
  //----------------------image picker----------------------

  //----------------------image picker----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top:60.0),
                child: Text(
                    'QnA',
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
              ),
              SizedBox(height: 45.0),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:31.0),
                child: Text(
                    '분류',
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
              ),
              SizedBox(height: 10.0),

              Card(
                elevation: 3.0, // 카드박스 그림자 음영
                margin: EdgeInsets.only(left:20, right: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.only(left: 22,right: 22),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _selectedPageValue,
                      items: _pageList.map(
                            (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPageValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:31.0),
                child: Text(
                    '제목',
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
              ),
              SizedBox(height: 10.0),

              Card(
                elevation: 3.0, // 카드박스 그림자 음영
                margin: EdgeInsets.only(left:20, right: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.only(left: 20),
                  child: TextFormField(
                      controller: reportText,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '제목을 작성해 주세요',
                          hintStyle: TextStyle(color: GREY)),
                      cursorColor: GREY,
                      //테스트용 코드
                      onChanged: (text) {
                        print(text);
                      }),
                ),
              ),

              SizedBox(height: 28),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:31.0),
                child: Text(
                    '상세설명',
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 3.0, // 카드박스 그림자 음영
                margin: EdgeInsets.only(left:20, right: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  padding: EdgeInsets.only(left: 20),
                  child: TextFormField(
                      controller: reportText,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '사유를 작성해 주세요',
                          hintStyle: TextStyle(color: GREY)),
                      cursorColor: GREY,
                      //테스트용 코드
                      onChanged: (text) {
                        print(text);
                      }),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:31.0),
                child: Text(
                    '이미지',
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*.07),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                        child: Container(
                          width: 58,
                          height: 58,
                          color: Color.fromRGBO(196, 196, 196, 1),
                          alignment: Alignment.center,
                          child: Text('+'),
                        ),
                        onTap: (){}
                    ),
                  ),
                  SizedBox(width: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      child: Container(
                        width: 58,
                        height: 58,
                        color: Color.fromRGBO(196, 196, 196, 1),
                        alignment: Alignment.center,
                        child: Text('+'),
                      ),
                      onTap: (){

                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      child: Container(
                        width: 58,
                        height: 58,
                        color: Color.fromRGBO(196, 196, 196, 1),
                        alignment: Alignment.center,
                        child: Text('+'),
                      ),
                      onTap: (){

                      },
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: customPinkElevatedButton('질문 제출하기', () {
                    Navigator.pop(context);
                  } // pop이 맞나?
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

// QnA 메인 스크린
class Qna extends StatefulWidget {
  final String nickName;
  // final List<QnaDatas> qnaDatas; // qnaDatas 아이템 리스트

  // 생성자에서 QnaDatas 아이템 리스트를 받아서 저장
  const Qna({Key? key, required this.nickName}) : super(key: key);

  @override
  _QnaState createState() => _QnaState();
}

class _QnaState extends State<Qna> {
  final List<String> _filterList = ['필터','가격비교', '알뜰장터', '커뮤니티', '기타'];
  var _selectedFilterValue = '필터';

  List<Map<String, String>> qnaDummyDatas = [];

  @override
  void initState() {
    super.initState();
    qnaDummyDatas = [
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "userNickname": "돌돌이님",
        "isUserNicknameSecret" : "닉네임 비공개",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
    ];
  }

  Widget _bodyWidget() {
    int size = qnaDummyDatas == null ? 0 : qnaDummyDatas.length;
    return SafeArea(
      child: ListView(children: [
        Column(
          children: [
            AppBarWithAlarm(nickName: "QnA"),

            SizedBox(
              height: 30,
            ),

            //질문작성 버튼 / 필터
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 26),
                  child: Card(
                    color: PINK,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .277,
                      height: MediaQuery.of(context).size.height * .045,
                      child: ElevatedButton(
                          child: Text("질문작성 >"),
                          style: ElevatedButton.styleFrom(
                              primary: PINK,
                              onPrimary: Colors.white,
                              textStyle: TextStyle(fontSize: 14
                                  //fontWeight: FontWeight.bold
                                  ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QnaWriteQna()));
                          }),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 26),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    value: _selectedFilterValue,
                    items: _filterList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedFilterValue = value!;
                      });
                    },
                  )),
                ),
              ],
            ),

            SizedBox(height: 54),

            ListView.separated(
                shrinkWrap: true, // listview 안에 listview 넣기 위한 방법
                padding: EdgeInsets.only(left: 16, right: 16),

                itemBuilder: (BuildContext _context, int index) {
                  if (qnaDummyDatas !=null && qnaDummyDatas.length>0){
                    return GestureDetector(
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QnaDetails())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top:MediaQuery.of(context).size.height*.03,
                            bottom: MediaQuery.of(context).size.height*.02
                        ),
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Q. ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      qnaDummyDatas[index]['questionTitle']!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: Text(
                                qnaDummyDatas[index]["userNickname"]!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  else{
                   return Text("작성된 것이 없습니다.");
                  }
                },
                itemCount: size,
                separatorBuilder: (BuildContext _context, int index) {
                  return Container( // 작성 시작하기
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.025),
                    color: Color.fromRGBO(185, 185, 185, 1),
                  );
                }),
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}