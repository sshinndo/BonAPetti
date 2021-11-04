import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';

// FAQ_FAQ상세 페이지
class FaqDetails extends StatelessWidget {
  // final qnaDummyDatas qnaDatas
  // // 생성자로 아이템을 수신하여 필드에 저장

  const FaqDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: BackSpaceButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Column(
          children: [
            AppBarWithAlarm(nickName: "FAQ"),
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

// FAQ 메인 스크린
class Faq extends StatefulWidget {
  final String nickName;
  // final List<QnaDatas> qnaDatas; // qnaDatas 아이템 리스트

  // 생성자에서 QnaDatas 아이템 리스트를 받아서 저장
  const Faq({Key? key, required this.nickName}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  final List<String> _filterList = ['필터','가격비교', '알뜰장터', '커뮤니티', '기타'];
  var _selectedFilterValue = '필터';

  List<Map<String, String>> faqDummyDatas = [];

  @override
  void initState() {
    super.initState();
    faqDummyDatas = [
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
      {
        "questionTitle": "구매는 어떻게 하나요?",
        "questionContents": "서비스를 사용한지 얼마 안돼서 조금 헷갈려서 질문드립니다.",
        "answerTitle" : "보나펫티를 사용해주셔서 감사드립니다.",
        "answerContents" : "상품 상세페이지 하단에서 '가격비교' 페이지를 통해 구매할 수 있습니다."
      },
    ];
  }

  Widget _bodyWidget() {
    int size = faqDummyDatas == null ? 0 : faqDummyDatas.length;
    return SafeArea(
      child: ListView(children: [
        Column(
          children: [
            AppBarWithAlarm(nickName: "FAQ"),

            SizedBox(
              height: 30,
            ),

            //질문작성 버튼 / 필터
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  if (faqDummyDatas !=null && faqDummyDatas.length>0){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FaqDetails())
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
                                      faqDummyDatas[index]['questionTitle']!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 8),
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