//import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/HashTagButtonList.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/init_profile/FifthRoute.dart';
import 'package:pet_service_application/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class ProfileQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstRoute(),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  FirstRouteState createState() {
    return FirstRouteState();
  }
}

class FirstRouteState extends State<FirstRoute> {
  TextEditingController userNickname = TextEditingController();
  //파이어베이스 스테이트
  bool _initialized = false;
  bool _error = false;

  //파이어베이스 이니셜
  void initializeFlutterFire() async
  {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    }
    catch(e)
    {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState()
  {
    initializeFlutterFire();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // 폼 위젯 생성
    // 폼 위젯은 컨테이너처럼 동작하면서, 복수의 폼 필드를 그룹화하고 적합성을 확인함
    return Scaffold(
      body: Column(
        // 컬럼내 위젯들을 가운데로 정렬함
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(50),
              child: customTitleQuestion('', '당신의 이름', '을\n알고 싶어요!'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 40, right: 40),
              child: Column(
                  children: [
                  customTextFormField(userNickname, '사용자의 이름을 입력해주세요.'),
                  SizedBox(height: 20.0),
                  customPinkElevatedButton(
                     '입력 완료!',
                         () {
                       //중복 여부 등등 확인
                       UserData(userNickname.text); //UserData클래스 생성
                       CollectionReference users = FirebaseFirestore.instance.collection('UserData');
                        users.add({'AccountInfo' : UserData.AccountInfo,
                                  'Name' : UserData.Name,
                                  'Description' : UserData.Description,
                                  'Commuity' : [],
                                  'Shorts' : [],
                                  'MedalImage' : "",
                                  'MyImage' : "",
                                  'MyPets' : []});
                        Navigator.push(
                           context,
                            MaterialPageRoute(
                               builder: (BuildContext context) => SecondRoute())
                       );
                     }),
                   ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 두번째 라우트 및 계정 전송
class SecondRoute extends StatelessWidget {
  SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25.0, top: 50.0),
                      child: customArrowBack(context),
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: customTitleQuestion(
                          "함께하고 계신 ", "친구들에 대해\n", "이야기 해 주실 수 있으신가요?"),
                    ),
                    SizedBox(height: 26.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: customSubtitleQuestion("추후 마이페이지에서 다시 설정 가능합니다."),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  customPinkElevatedButton('네!', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdRoute()));
                  }),
                  SizedBox(height: 20.0),
                  customPinkElevatedButton('아니요..ㅠㅠ바로 앱으로!', () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  TextEditingController _petName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 1,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25.0, top: 110.0),
                    child: customArrowBack(context),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child: customTitleQuestion("친구의 ", "이름은?", ""),
                  ),
                  SizedBox(height: 26.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child: customSubtitleQuestion(
                        "2마리 이상일 시,\n마이페이지에서 친구를 추가할 수 있습니다."),
                  )
                ],
              ),
            ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 40, right: 40),
            child: Column(
              children: [
                customTextFormField(_petName, '반려동물의 이름을 입력해주세요!'),
                SizedBox(height: 20.0),
                customPinkElevatedButton(
                    "입력 완료!",
                        () {
                      UserInfo.petInfo = PetInfo();
                      PetInfo.petName = _petName.text;
                      PetInfo.petTypeNameList = [];
                      PetInfo.petAge = 0;
                      PetInfo.petBodyLength = 0;
                      PetInfo.petWeight = 0;
                      PetInfo.petSilhouette = PetSilhouette.BCS1;
                      PetInfo.petAllergyList = [];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FourthRoute())
                      );
                    }
                )
                // customPinkElevatedButton(
                //         () {
                //   UserInfo.petInfo = PetInfo();
                //   PetInfo.petName = _petName.text;
                //   PetInfo.petTypeNameList = [];
                //   PetInfo.petAge = 0;
                //   PetInfo.petBodyLength = 0;
                //   PetInfo.petWeight = 0;
                //   PetInfo.petSilhouette = PetSilhouette.BCS1;
                //   PetInfo.petAllergyList = [];
                // }, "입력 완료!", context, FourthRoute()
                // ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class FourthRoute extends StatefulWidget {
  const FourthRoute({Key? key}) : super(key: key);

  @override
  _FourthRouteState createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  @override
  Widget build(BuildContext context) {
    PetCategoryListView petCategoryListView =
        PetCategoryListView(petCategoryStrList: []);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25.0, top: 110.0),
                      child: customArrowBack(context),
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child:
                          customTitleQuestion("친구에 대해 ", "더 자세히\n", "가르쳐 주세요!"),
                    ),
                    SizedBox(height: 26.0),
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
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      SizedBox(height: 15.0),
                      customSubtitleQuestion('(반려동물 종류)를 선택해 주세요!')
                    ],
                  ),
                ),
                SizedBox(height: 45.0),
                HashTagButtonListManager(
                    petCategoryListView: petCategoryListView)
              ])),
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
          PetInfo.petTypeNameList.add(buttonText);
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
              buildHashTagButton('#강아지', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#고양이', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#햄스터', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#기니피그', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#카멜레온', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#오소리', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#너구리', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#앵무새', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#사자', context),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FifthRoute(
                      petCategoryStrList: manager.petCategoryListView
                          .getStateData()
                          .petCategoryStrList)));
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
              buildHashTagButton('#말티즈', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#웰시코기', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#치와와', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#도베르만', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#시바견', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#진돗개', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#풍산개', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHashTagButton('#시베리안 허스키', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#푸들', context),
              Padding(padding: EdgeInsets.all(20)),
              buildHashTagButton('#슈나우저', context),
            ],
          )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////

GestureDetector animationUpButton(
    ScrollController _scrollController, double location) {
  return GestureDetector(
    onTap: () => {
      _scrollController.animateTo(location,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn)
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: LIGHTPINK,
      ),
      child: Icon(
        Icons.keyboard_arrow_up,
        color: Colors.white,
        size: 30.0,
      ),
    ),
  );
}

GestureDetector animationDownButton(
    ScrollController _scrollController, double location) {
  return GestureDetector(
    onTap: () => {
      _scrollController.animateTo(location,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn)
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: LIGHTPINK,
      ),
      child: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
        size: 30.0,
      ),
    ),
  );
}

Card customTextFormField(TextEditingController editingController, String hint) {
  return Card(
    elevation: 5.0, // 카드박스 그림자 음영
    //margin: EdgeInsets.only(top: 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      width: double.infinity,
      height: 52.0,
      padding: EdgeInsets.only(left: 20),
      child: TextFormField(
          controller: editingController,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: GREY)),
          cursorColor: GREY,
          //테스트용 코드
          onChanged: (text) {
            print(text);
          }),
    ),
  );
}

GestureDetector customArrowBack(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back_ios_sharp,
        size: 100.0,
        color: GREY,
      ),
    ),
  );
}

Container customPinkElevatedButton(
    String text, VoidCallback onPressed) {
  return Container(
    //margin: EdgeInsets.only(left: 40, right: 40),
    child: SizedBox(
      width: double.infinity,
      height: 52.0,
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: PINK,
            onPrimary: Colors.white,
            textStyle: TextStyle(fontSize: 14
                //fontWeight: FontWeight.bold
                ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
        onPressed: onPressed
      ),
    ),
  );
}

GestureDetector customPinkScrollButton(
    String text, ScrollController scrollController, double height) {
  return GestureDetector(
    child: Container(
      //margin: EdgeInsets.only(left: 40, right: 40),
      child: SizedBox(
        width: double.infinity,
        height: 52.0,
        child: ElevatedButton(
          child: Text(text),
          style: ElevatedButton.styleFrom(
              primary: PINK,
              onPrimary: Colors.white,
              textStyle: TextStyle(fontSize: 14
                  //fontWeight: FontWeight.bold
                  ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          onPressed: () {
            scrollController.animateTo(height,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn);
          },
        ),
      ),
    ),
  );
}

SizedBox customPinkOutlinedButton(
    String text, BuildContext context, Widget nextRoute) {
  return SizedBox(
    width: double.infinity,
    height: 52.0,
    child: OutlinedButton(
      child: Text(text),
      style: OutlinedButton.styleFrom(
          primary: PINK,
          textStyle: TextStyle(fontSize: 14
              //fontWeight: FontWeight.bold
              ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0))),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextRoute));
      },
    ),
  );
}

Text customSemiTitleQuestion(
    String commonText1, String highlightText, String commonText2) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
            text: commonText1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: highlightText,
            style: TextStyle(
              color: PINK,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            )),
        TextSpan(
            text: commonText2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Text customTitleQuestion(
    String commonText1, String highlightText, String commonText2) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
            text: commonText1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: highlightText,
            style: TextStyle(
              color: PINK,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            )),
        TextSpan(
            text: commonText2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Text customSubtitleQuestion(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
  );
}

Text customSubtitleColor(String text, Color color) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 12.0, fontWeight: FontWeight.bold),
  );
}

Text customSubtitleColorUnderline(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline),
  );
}

Text customSubtitleQuestionColor(String text) {
  return Text(
    text,
    style: TextStyle(color: PINK, fontSize: 14.0, fontWeight: FontWeight.bold),
  );
}

Text customSubtitleQuestionFontSize(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.bold),
  );
}

Card silhouetteCard(String imagePath, String bcsLevel, String bcsState) {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: SizedBox(
      // 가장 외곽의 카드 박스
      width: 135,
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 30.0),
          Expanded(
            flex: 5,
            child: Container(
              child: SizedBox(
                width: 130.0,
                height: 150.0,
                child: Image.asset(imagePath),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                bcsLevel,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: PINK,
                  fontSize: 10.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                bcsState,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    ),
  );
}

// --------------------알러지 버튼 리스트 매니저-------------------------
class AllergyButtonListManager extends StatefulWidget {
  final PetCategoryListView petCategoryListView;

  AllergyButtonListManager({Key? key, required this.petCategoryListView})
      : super(key: key);

  final _AllergyButtonListManager listManager = _AllergyButtonListManager();

  _AllergyButtonListManager getStateData() => listManager;

  @override
  _AllergyButtonListManager createState() => listManager;
}

class _AllergyButtonListManager extends State<AllergyButtonListManager> {
  bool isAllergySelected = false;

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
      isAllergySelected = _isSelected;
    });
  }

  Widget selectHashTagButtonList() {
    if (!isAllergySelected)
      // 알러지나 질병이 있나요? Yes or No 버튼 창을 띄우고 싶음
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            customPinkElevatedButton(
                '네',
                    () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage()
                      ),
                          (route) => false
                  );
                }
            ),
            // customPinkElevatedButton(() {}, '네', context, MyHomePage()),
            SizedBox(height: 30.0),
            customPinkElevatedButton(
                '아니요(잘 모르겠어요)',
                    () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage()
                      ),
                          (route) => false
                  );
                }
            )
            // customPinkElevatedButton(() {}, "아니요(잘 모르겠어요)", context, MyHomePage()),
          ],
        ),
      );
    else // 알러지 항목을 선택하는 창을 띄우고 싶음
      return AllergyInputButtonList(manager: widget);
  }
}

class AllergyInputButtonList extends StatelessWidget {
  final AllergyButtonListManager manager;

  AllergyInputButtonList({Key? key, required this.manager});

  ElevatedButton buildAllergyButton(String buttonText, BuildContext context) {
    return ElevatedButton(
        child: Text(buttonText),
        onPressed: () {
          manager.getStateData().refresh(true);
          manager.petCategoryListView.getStateData().add(buttonText);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FifthRoute(
                      petCategoryStrList: manager.petCategoryListView
                          .getStateData()
                          .petCategoryStrList)));
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(246, 246, 246, 1),
            onPrimary: PINK,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
              buildAllergyButton('#비염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#관절염', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#치주염', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildAllergyButton('#백내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#녹내장', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#빈혈', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#간질발작', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildAllergyButton('#소화불량', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#충치', context),
              Padding(padding: EdgeInsets.all(20)),
              buildAllergyButton('#기생충', context),
            ],
          )
        ],
      ),
    );
  }
}
