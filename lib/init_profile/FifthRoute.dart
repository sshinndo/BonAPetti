import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_service_application/HashTagButtonList.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/main.dart';

import 'package:pet_service_application/log_in/screen/LogIn.dart';

class FifthRoute extends StatefulWidget {
  final List<String> petCategoryStrList;

  const FifthRoute({Key? key, required this.petCategoryStrList})
      : super(key: key);

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute> {
  TextEditingController _petAgeController = TextEditingController();
  TextEditingController _petBodyLengthController = TextEditingController();
  TextEditingController _petWeightController = TextEditingController();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var myInfo = Logger().userData;
    PetCategoryListView petCategoryListView =
    PetCategoryListView(petCategoryStrList: []);

    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          // 1번째 화면 시작 -----------------------------------------------------
          Container(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25.0, top: 25.0),
                        child: customArrowBack(context),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: customTitleQuestion(
                            "친구에 대해 ", "더 자세히\n", "가르쳐 주세요!"),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 50, right: 50),
                          child: Row(children: [
                            customSubtitleQuestionColor(
                                widget.petCategoryStrList[0]), // 데이터 변수값 수정해야 함
                            SizedBox(width: 12),
                            customSubtitleQuestionColor(
                                widget.petCategoryStrList[1]), // 데이터 변수값 수정해야 함
                          ])),
                    ],
                  ),
                ),

                //Align 부분 --------------------------------------------------

                //입력하는 부분 -----------------------------------------------
                Container(
                  child: Column(children: [
                    SizedBox(height: 15.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: customSubtitleQuestion('나이'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: customTextFormField(
                          _petAgeController, '나이를 입력해 주세요.'),
                    )
                  ]),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(height: 15.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: customSubtitleQuestion('몸 길이'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: customTextFormField(
                          _petBodyLengthController, '몸 길이를 입력해 주세요.'),
                    )
                  ]),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(height: 15.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: customSubtitleQuestion('몸무게'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: customTextFormField(
                          _petWeightController, '몸무게를 입력해 주세요.'),
                    )
                  ]),
                ),

                SizedBox(height: 40.0),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: customPinkElevatedButton(
                        "나중에 입력할래요!",
                            () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                (Route<dynamic> route) => false)
                    ),
                    // 아니요 버튼을 누름으로써, 모든 프로필 정보를 작성했다는
                    // bool 데이터 변수를 작성해서 메인으로 넘겨야 함!!!
                  ),
                ),
                Container(
                    width: 40.0,
                    height: 40.0,
                    child: animationDownButton(_scrollController, 680)),

                SizedBox(height: 64.0), // 공백처리
              ],
            ),
          ),
          // --------------------------1번째 페이지
          // --------------------------2번째 페이지
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: animationUpButton(_scrollController, 0),
                  //child: animationUpButton(_scrollController),
                ),
                SizedBox(height: 10.0),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 40),
                    // 닉네임을 변수로 수정해야함!
                    child: customSemiTitleQuestion('', '${PetInfo.petName}의', ' 실루엣은?')),
                SizedBox(height: 10.0),
                Container(
                  height: 530,
                  child: GestureDetector(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.only(left: 36.0, right: 36.0),
                        mainAxisSpacing: 18.0,
                        crossAxisSpacing: 18.0,
                        children: [
                          GestureDetector(
                              child: silhouetteCard('images/bcs/bcs1.png',
                                  'BCS 1,2단계(야윈상태)', '갈비뼈, 허리뼈, 골반뼈가 드러나 보임'),
                              onTap: () => {
                                PetInfo.petSilhouette = PetSilhouette.BCS1,
                                _scrollController.animateTo(1360,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn)
                              }),
                          GestureDetector(
                              child: silhouetteCard('images/bcs/bcs2.png',
                                  'BCS 3단계(저체중)', '갈비뼈가 쉽게 만져짐'),
                              onTap: () => {
                                PetInfo.petSilhouette = PetSilhouette.BCS2,
                                _scrollController.animateTo(1360,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn)
                              }),
                          GestureDetector(
                              child: silhouetteCard('images/bcs/bcs3.png',
                                  'BCS 4,5단계(이상적인 체중)', '갈비뼈가 안보이지만 살짝 만져짐'),
                              onTap: () => {
                                PetInfo.petSilhouette = PetSilhouette.BCS3,
                                _scrollController.animateTo(1360,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn)
                              }),
                          GestureDetector(
                              child: silhouetteCard('images/bcs/bcs4.png',
                                  'BCS 6단계(과체중)', '위에서 허리를 확인하기 힘듦'),
                              onTap: () => {
                                PetInfo.petSilhouette = PetSilhouette.BCS4,
                                _scrollController.animateTo(1360,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn)
                              }),
                          GestureDetector(
                              child: silhouetteCard('images/bcs/bcs5.png',
                                  'BCS 8,9단계(비만)', '손에 힘을 주고 만져야 갈비뼈가 만져짐'),
                              onTap: () => {
                                PetInfo.petSilhouette = PetSilhouette.BCS5,
                                _scrollController.animateTo(1360,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn)
                              })
                        ],
                      ),
                      onTap: () => {
                        _scrollController.animateTo(1360,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn)
                      }),
                ),
                SizedBox(height: 106.0),
              ],
            ),
          ),

          //---------------------------------2번째 페이지
          //---------------------------------3번째 페이지

          Container(
            child: Column(
              children: <Widget>[
                Container(
                    width: 40.0,
                    height: 40.0,
                    child: animationUpButton(_scrollController, 680)),
                SizedBox(height: 150.0),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 50),
                  child: customSemiTitleQuestion('', '알러지나 질병', '이 있나요?'),
                ),
                SizedBox(height: 37.0),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  // child: AllergyButtonListManager(
                  //     petCategoryListView: petCategoryListView)
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: customPinkScrollButton(
                            '네', _scrollController, 2170),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: customPinkElevatedButton(
                            "아니요(잘 모르겠어요)",
                                () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyHomePage()),
                                    (Route<dynamic> route) => false)
                          //MyHomePage()
                        ),
                        // 아니요 버튼을 누름으로써, 모든 프로필 정보를 작성했다는
                        // bool 데이터 변수를 작성해서 메인으로 넘겨야 함!!!
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 371.0),
                //-----------------------------------------3번째 페이지
                //-----------------------------------------4번째 페이지
                Container(
                    width: 40.0,
                    height: 40.0,
                    child: animationUpButton(_scrollController, 1360)),
                SizedBox(height: 80.0),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 50),
                  child: customSemiTitleQuestion('', '알러지나 질병', '이 있나요?'),
                ),
                SizedBox(height: 34.0),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: double.infinity,
                        height: 60,
                        child: petCategoryListView),
                  ),
                ),
                SizedBox(height: 24.0),
                Container(
                    alignment: Alignment.center,
                    child: customSubtitleQuestion('(알러지)항목을 선택해 주세요.')),
                SizedBox(height: 47.0),
                HashTagButtonListManager(
                    petCategoryListView: petCategoryListView),
                SizedBox(height: 25.0),
                Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child:
                    customPinkElevatedButton(
                        '입력 완료!',
                            () {
                          PetInfo.petAge = int.parse(_petAgeController.text);

                          PetInfo.petBodyLength =
                              double.parse(_petBodyLengthController.text);

                          PetInfo.petWeight =
                              double.parse(_petWeightController.text);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyHomePage()),
                                  (route) => false
                          );
                        }
                    )
                ),

                // customPinkElevatedButton(() {
                //   PetInfo.petAge = int.parse(_petAgeController.text);
                //
                //   PetInfo.petBodyLength =
                //       double.parse(_petBodyLengthController.text);
                //
                //   PetInfo.petWeight =
                //       double.parse(_petWeightController.text);
                // }, '입력 완료!', context, MyHomePage())
                SizedBox(height: 80.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HashTagButtonListManager extends StatefulWidget {
  final PetCategoryListView petCategoryListView;

  HashTagButtonListManager({Key? key, required this.petCategoryListView})
      : super(key: key);

  final _HashTagButtonListManager listManager = _HashTagButtonListManager();

  _HashTagButtonListManager getStateData() => listManager;

  @override
  _HashTagButtonListManager createState() => listManager;
}

class _HashTagButtonListManager extends State<HashTagButtonListManager> {
  bool isCategorySelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return selectHashTagButtonList();
  }

  void refresh(bool _isSelected) {
    setState(() {
      isCategorySelected = _isSelected;
    });
  }

  Widget selectHashTagButtonList() {
    if (!isCategorySelected)
      return HashTagInputButtonList(manager: widget);
    else
      return HashTagInputButtonSecondList(manager: widget);
  }
}

class HashTagInputButtonList extends StatelessWidget {
  final HashTagButtonListManager manager;

  HashTagInputButtonList({Key? key, required this.manager});

  ElevatedButton buildHashTagButton(String buttonText, BuildContext context) {
    return ElevatedButton(
        child: Text(buttonText),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => FifthRoute()));
          manager.getStateData().refresh(true);
          manager.petCategoryListView.getStateData().add(buttonText);
          PetInfo.petAllergyList!.add(buttonText);
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(246, 246, 246, 1),
            onPrimary: PINK,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#비염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#관절염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#치주염', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#백내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#녹내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#빈혈', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#간질발작', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#소화불량', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#충치', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#호랑이', context),
            ],
          )
        ],
      ),
    );
  }
}

class HashTagInputButtonSecondList extends StatelessWidget {
  final HashTagButtonListManager manager;

  HashTagInputButtonSecondList({Key? key, required this.manager});

  ElevatedButton buildHashTagButton(String buttonText, BuildContext context) {
    return ElevatedButton(
        child: Text(buttonText),
        onPressed: () {
          manager.getStateData().refresh(true);
          manager.petCategoryListView.getStateData().add(buttonText);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => FifthRoute(
          //             petCategoryStrList: manager.petCategoryListView
          //                 .getStateData()
          //                 .petCategoryStrList))
          // );
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(246, 246, 246, 1),
            onPrimary: PINK,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#비염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#관절염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#치주염', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#백내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#녹내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#빈혈', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#간질발작', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#소화불량', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#충치', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#호랑이', context),
            ],
          )
        ],
      ),
    );
  }
}