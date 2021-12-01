import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet_service_application/HashTagButtonList.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/init_profile/widget/HashTagWidget.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/init_profile/FifthRoute.dart';
import 'package:pet_service_application/init_profile/widget/AlertDuplicateMessage.dart';
import 'package:pet_service_application/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tags/flutter_tags.dart';

class ProfileQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstRoute();
  }
}


class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  FirstRouteState createState() {
    return FirstRouteState();
  }
}
//이름 입력 및 계정 생성
class FirstRouteState extends State<FirstRoute> {
  TextEditingController userNickname = TextEditingController();

  //유저 정보
  UserData myData = Logger().userData;

  // 닉네임 중복 여부 컨테이너 bool 값
  bool _offstage = true;

  //파이어베이스 스테이트
  bool _initialized = false;
  bool _error = false;

  //파이어베이스 이니셜
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  //생성된 계정을 서버로 전송
  void sendUserData() async {
    if (myData.name != "") {
      Future<int> curUserCount = allocUserID();
      curUserCount.then((value) {
        debugPrint("Allocate New UID : $value");
        if (value > 0) {
          CollectionReference users =
              FirebaseFirestore.instance.collection('UserData');
          users.doc(value.toString()).set({
            'AccountInfo': myData.accountInfo,
            'Name': myData.name,
            'Description': myData.description,
            'following': myData.following,
            'follower': myData.follower,
            'Community': myData.posts,
            'Shorts': myData.shorts,
            'MedalImage': myData.medalImage,
            'MyImage': myData.myImage,
            'MyPets': myData.myPets
          });
        }
        Logger().userData.uid = value;
      });
    } else
      throw Exception('Login Data Already Exist');
  }

  //새 UID 할당받기 - 서버와 동기화
  Future<int> allocUserID() async {
    //현재 유저 수 확인 후 UID 배정받기
    int newUID =
        await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction
          .get(FirebaseFirestore.instance.collection('Manage').doc('Users'));
      if (!snapshot.exists) {
        throw Exception('Server Manager Connect Fail');
      }
      int curUserCount = snapshot.get('Count') + 1;
      transaction.update(
          FirebaseFirestore.instance.collection('Manage').doc('Users'),
          {'Count': curUserCount});
      return curUserCount;
    });
    return newUID;
  }

  //중복 계정 여부 확인 함수
  Future<bool> isUserExist(String _name) async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("UserData")
        .where('Name', isEqualTo: _name)
        .get();
    if (documentSnapshot.docs.isEmpty)
      return false;
    else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360.0;
    var height = MediaQuery.of(context).size.height / 800.0;
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 올라오면서 화면을 밀어내지 않는 것
      body: SafeArea(
        child: SingleChildScrollView(
          child: WillPopScope(
            onWillPop: () {
              // _msg : 뒤로가기 버튼 누를 시 메시지
              final _msg = '프로필 작성을 마무리 해주세요 !';
              final snackBar = SnackBar(content: Text(_msg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // 필수 인자
              return Future(() => false);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 30),
              child: Column(
                // 컬럼내 위젯들을 가운데로 정렬함
                children: [
                  SizedBox(height: height * 200),
                  //text box: 당신의 이름을\n알고 싶어요!
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: customTitleQuestion('', '당신의 이름', '을\n알고 싶어요!'),
                  ),
                  SizedBox(height: height * 110),
                  // 사용자 이름 입력 박스
                  Column(children: [
                    //감춰진 컨테이너 : "이미 사용중인 이름입니다."
                    Offstage(
                        offstage: _offstage, child: AlertDuplicateMessage()),
                    SizedBox(height: height * 15.0),

                    customTextFormField(
                        userNickname, '사용자의 이름을 입력해주세요! (2-8자 이내)'),
                    SizedBox(height: height * 25.0),

                    customPinkElevatedButton('입력 완료!', () {
                      Future<bool> userExist = isUserExist(userNickname.text);
                      userExist.then((val) {
                        if (val == true) {
                          setState(() {
                            // 닉네임 중복 bool 값을 true->false로 변경
                            _offstage = false;
                          });
                          //닉네임 중복(유저 이미 존재)
                          debugPrint('User Already Exist : $userNickname.text');
                        } else {
                          // 닉네임 중복 bool 값을 false-> true로 변경
                          setState(() {
                            _offstage = true;
                          });
                          //유저 정보 없음, 계정 생성 후 다음으로 이동
                          debugPrint('User doesnt Exist, initiate user');
                          Logger().userData.name = userNickname.text;
                          sendUserData();
                          debugPrint(
                              'User ID : ' + Logger().userData.uid.toString());
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: SecondRoute(),
                                  type: PageTransitionType.rightToLeft));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //             builder: (context) => SecondRoute()));
                        }
                      });
                    }),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}
//펫 데이터 추가 입력 여부 선택
class _SecondRouteState extends State<SecondRoute> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360.0;
    var height = MediaQuery.of(context).size.height / 800.0;

    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          // <- 뒤로가기 기능 방지 (이미 계정을 생성했기 때문)
          onWillPop: () {
            // _msg : 뒤로가기 버튼 누를 시 메시지
            final _msg = '프로필 작성을 마무리 해주세요!';
            final snackBar = SnackBar(content: Text(_msg));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // 필수 인자
            return Future(() => false);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 30),
            child: Column(
              children: [
                // 알림바: 계정 생성 완료!
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 180,
                          height: 30,
                          color: Color.fromRGBO(166, 0, 0, 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "계정 생성 완료!  ✔",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(242, 128, 128, 1)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 155),
                // 문구2-1: 함께하고 계신 ~
                Container(
                  alignment: Alignment.centerLeft,
                  child: customTitleQuestion(
                      "함께하고 계신 ", "친구들에 대해\n", "이야기 해 주실 수 있으신가요?"),
                ),
                SizedBox(height: height * 30.0),
                // 문구2-2: 추후 마이페이지에서~
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("추후 마이페이지에서 다시 설정 가능합니다.",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold))),
                SizedBox(height: height * 75.0),
                //버튼 : 네!
                Container(
                  child: customPinkElevatedButton('네!', () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: ThirdRoute(),
                            type: PageTransitionType.rightToLeft));
                  }),
                ),
                SizedBox(height: height * 25.0),
                // 버튼: 아니요.. ㅠㅠ 바로 앱으로!
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 50.0),
                  child: customPinkElevatedButton('아니요.. ㅠㅠ  바로 앱으로 !', () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}
//펫 생성 시작 및 펫 이름 입력 페이지
class _ThirdRouteState extends State<ThirdRoute> {
  TextEditingController _petName = TextEditingController();

  @override
  void initState() {
    //펫정보 입력을 위한 데이터 수신
    PetInfo.initialPetListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 30),
            child: Column(children: [
              SizedBox(height: height * 100),
              // 뒤로가기 버튼
              Container(
                //margin: EdgeInsets.only(left: 25.0, top: 110.0),
                child: customArrowBack(context),
              ),
              SizedBox(height: height * 25),

              Container(
                alignment: Alignment.centerLeft,
                child: customTitleQuestion("친구의 ", "이름은?", ""),
              ),
              SizedBox(height: height * 20),
              Container(
                alignment: Alignment.centerLeft,
                child: customSubtitleQuestion(
                    "2마리 이상일 시,\n마이페이지에서 친구를 추가할 수 있습니다."),
              ),
              SizedBox(height: height * 90),
              customTextFormField(_petName, '반려동물의 이름을 입력해주세요! ( 8자 이내 )'),

              SizedBox(height: 20.0),
              customPinkElevatedButton("입력 완료!", () {
                //펫 이름으로 새 데이터 생성 후 현재 앱 유저에 삽입
                PetInfo createPet = PetInfo(_petName.text);
                // 화면 전환 애니메이션 효과
                Navigator.push(
                    context,
                    PageTransition(
                        child: FourthRoute(newPet: createPet),
                        type: PageTransitionType.rightToLeft));
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => FourthRoute()));
              })
            ]),
          ),
        ),
      ),
    );
  }
}

class FourthRoute extends StatefulWidget {
  final PetInfo newPet;
  const FourthRoute({Key? key, required this.newPet}) : super(key: key);

  @override
  _FourthRouteState createState() => _FourthRouteState();
}
// 4번째 라우터 - 펫 타입 입력
class _FourthRouteState extends State<FourthRoute> {
  List _dogSpecies = [
    '말티즈',
    '웰시코기',
    '치와와',
    '도베르만',
    '시바견',
    '진돗개',
    '풍산개',
    '시베리안 허스키',
    '푸들',
    '슈나우저', '기타'
  ];
  List _catSpecies = ['프시티시 숏헤어', '페르시안', '메인쿤', '샴', '렉돌', '스핑크스',
    '벵골', '버먼','아메리칸 숏헤어','코리안 숏헤어', '러시안 블루',
    '스코리시 폴드','터키시 앙고라','히말리안','봄베이','먼치킨', '기타'];



  String selectedPetType = '';
  int selectedPetSpecies = -1;

  int isDogSelected = 0;
  int isCatSelected = 0;

  // 1 : 첫번째 카테고리, 2: 두번째 카테고리, 3: 다음 라우터 이동용 인덱스
  int currentState = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;

    PetCategoryListView petCategoryListView =
        PetCategoryListView(petCategoryStrList: []);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 130),
            //SizedBox(height: height*93),
            Container(
                margin: EdgeInsets.symmetric(horizontal: width * 30),
                alignment: Alignment.centerLeft,
                child: customArrowBack(context)),
            //Container(alignment:Alignment.centerLeft ,child: customArrowBack(context)),
            SizedBox(height: height * 30),
            Container(
                margin: EdgeInsets.symmetric(horizontal: width * 40),
                alignment: Alignment.centerLeft,
                child: customTitleQuestion("친구에 대해 ", "더 자세히\n", "가르쳐 주세요!")),
            SizedBox(height: height * 35),
            // 카드
            Container(
              width: width * 300,
              height: 70,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(children: [
                      Offstage(
                          offstage: (currentState > 1 && selectedPetType != ''),
                          child: Row(
                            children: [
                              Text(
                                "# " + selectedPetType,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 113, 113, 0.6)),
                              ),
                              SizedBox(width: 15.0),
                              Text("|  ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.3))),
                            ],
                          )),

                    ])),  //선택한 펫 종류
              ),  //텍스트창
            ),
            SizedBox(height: 24), //공백
            //버튼 패널
            if (currentState == 1) firstCategory(),
            if (currentState == 2) secondCategory(),
            if (currentState == 3) moveToFifthRoute()
          ],
        ),
      ),
    );
  }

  //펫 종류 선택
  firstCategory() {
    var height = MediaQuery.of(context).size.height / 800;
    return Offstage(
      offstage: currentState!=1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("반려동물의 종류를 선택해주세요 !", style: TextStyle(fontSize: 14)),
          SizedBox(height: height * 90),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            HashTagButton(
              // width: 87, height: 30,
                text: "강아지",
                onPressed: () {
                  setState(() {
                    currentState++; // 다음 화면으로 넘어가기위한 인덱스 ++
                    isDogSelected++; // 강아지 선택함으로써, 0 -> 1 (+1)

                  });
                }), //강아지 버튼
            HashTagButton(
                // width: 87, height: 30,
                text: "고양이",
                onPressed: () {
                  setState(() {
                    currentState++; // 다음 화면으로 넘어가기위한 인덱스 ++
                    isCatSelected++; // 고양이 선택함으로써, 0 -> 1 (+1)
                  });
                }), //고양이 버튼
          ]),
        ],
      ),
    );
  }

  //펫 세부 종 선택
  secondCategory() {
    var width = MediaQuery.of(context).size.width / 360;
    var height = MediaQuery.of(context).size.height / 800;
    return Offstage(
      offstage: currentState!=2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("반려동물 세부 종을 선택해주세요 !",
              style: TextStyle(fontSize: 14)),
          SizedBox(height: height * 90),
          Container(
            height: 80.0,
            child: CupertinoScrollbar(
              thickness: 5.0, // 일반 스크롤 두께
              thicknessWhileDragging: 8.0, // 드래그할 때 스크롤 두께
              radius: Radius.circular(34.0), // 스크롤바 둥글게
              isAlwaysShown: true, // 스크롤바 항상 노출
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // scrollDirection: 가로 스크롤 생성
                  // 1 > 0 이면 강아지 선택한 것이고, 0 < 1 이면 고양이 선택한 것
                  itemCount: isDogSelected > isCatSelected
                      ? _dogSpecies.length : _catSpecies.length,
                  itemBuilder: (context, i) =>
                      HashTagButton(
                        // 1 > 0 이면 강아지 선택한 것이고, 0 < 1 이면 고양이 선택한 것
                      text: (isDogSelected > isCatSelected)
                          ? _dogSpecies[i] : _catSpecies[i],
                      onPressed: (){
                        setState(() {
                          currentState++; // index : 3,
                          //-----선택한 반려동물 세부 종을 서버로 전송하는 코드-----------

                          //-----선택한 반려동물 세부 종을 서버로 전송하는 코드-----------

                        });
                      })
              ),
            ),
          ),
        ],
      ),
    );
  }

  //펫 세부 정보 입력 페이지로 이동
  moveToFifthRoute(){
    //widget.newPet.petType
    //widget.newPet.petSpecies
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FifthRoute(newPet : widget.newPet)));
  }
}

class FifthRoute extends StatefulWidget {
  final PetInfo newPet;
  const FifthRoute({Key? key, required this.newPet}) : super(key: key);

  @override
  _FifthRouteState createState() => _FifthRouteState();
}
// 펫 세부 정보 입력 (마지막 페이지)
class _FifthRouteState extends State<FifthRoute> {
  TextEditingController _petAgeController = TextEditingController();
  TextEditingController _petBodyLengthController = TextEditingController();
  TextEditingController _petWeightController = TextEditingController();

  final _scrollController = ScrollController();

  //파이어베이스 스테이트
  bool _initialized = false;
  bool _error = false;

  //파이어베이스 이니셜
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  //생성된 펫 정보를 서버로 전송 (현재 펫 데이터 = 펫 ID)
  void sendPetData(PetInfo petData) {
    //펫 정보 없을 바로 종료
    if(petData.petName == "")
      return;

    if (Logger().userData.uid != 0) {
      CollectionReference pets = FirebaseFirestore.instance.collection(
          'UserData').doc(Logger().userData.uid.toString()).collection('Pets');
      pets.doc(petData.petName).set({
        //pet id 설정 후 입력
        'Name': petData.petName,
        'Type' : petData.petType,
        'Species' : petData.petSpecies,
        'Age': petData.petAge,
        'BodyLength': petData.petBodyLength,
        'Weight': petData.petWeight,
        'Silhouette': petData.petSilhouette,
        'AllergyList': petData.petAllergyList,
        'DiseaseList' : petData.petDiseaseList
      });
    }
    else
      throw Exception('Login Data Not Exist');
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myInfo = Logger().userData;
    PetCategoryListView petCategoryListView =
    PetCategoryListView(petCategoryStrList: []);

    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                        // Container(
                        //     alignment: Alignment.centerLeft,
                        //     margin: EdgeInsets.only(left: 50, right: 50),
                        //     child: Row(children: [
                        //       customSubtitleQuestionColor(
                        //           widget.petCategoryStrList[0]), // 데이터 변수값 수정해야 함
                        //       SizedBox(width: 12),
                        //       customSubtitleQuestionColor(
                        //           widget.petCategoryStrList[1]), // 데이터 변수값 수정해야 함
                        //     ])),
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

                  SizedBox(height: 64.0), // 공백처리
                ],
              ),
            ),
            // --------------------------1번째 페이지
            // --------------------------2번째 페이지
            Container(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   width: 40.0,
                  //   height: 40.0,
                  //   child: animationUpButton(_scrollController, 0),
                  //   //child: animationUpButton(_scrollController),
                  // ),
                  SizedBox(height: 10.0),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 40),
                      // 닉네임을 변수로 수정해야함!
                      child: customSemiTitleQuestion('', '${widget.newPet.petName}의', ' 실루엣은?')),
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
                                  widget.newPet.petSilhouette = PetSilhouette.BCS1,
                                  _scrollController.animateTo(1360,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn)
                                }),
                            GestureDetector(
                                child: silhouetteCard('images/bcs/bcs2.png',
                                    'BCS 3단계(저체중)', '갈비뼈가 쉽게 만져짐'),
                                onTap: () => {
                                  widget.newPet.petSilhouette = PetSilhouette.BCS2,
                                  _scrollController.animateTo(1360,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn)
                                }),
                            GestureDetector(
                                child: silhouetteCard('images/bcs/bcs3.png',
                                    'BCS 4,5단계(이상적인 체중)', '갈비뼈가 안보이지만 살짝 만져짐'),
                                onTap: () => {
                                  widget.newPet.petSilhouette = PetSilhouette.BCS3,
                                  _scrollController.animateTo(1360,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn)
                                }),
                            GestureDetector(
                                child: silhouetteCard('images/bcs/bcs4.png',
                                    'BCS 6단계(과체중)', '위에서 허리를 확인하기 힘듦'),
                                onTap: () => {
                                  widget.newPet.petSilhouette = PetSilhouette.BCS4,
                                  _scrollController.animateTo(1360,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn)
                                }),
                            GestureDetector(
                                child: silhouetteCard('images/bcs/bcs5.png',
                                    'BCS 8,9단계(비만)', '손에 힘을 주고 만져야 갈비뼈가 만져짐'),
                                onTap: () => {
                                  widget.newPet.petSilhouette = PetSilhouette.BCS5,
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
                  // Container(
                  //     width: 40.0,
                  //     height: 40.0,
                  //     child: animationUpButton(_scrollController, 680)),
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
                              //서버로 펫 데이터 전송
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
                  // Container(
                  //     width: 40.0,
                  //     height: 40.0,
                  //     child: animationUpButton(_scrollController, 1360)),
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
                  SizedBox(height: 25.0),
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child:
                      customPinkElevatedButton(
                          '입력 완료!',
                              () {
                            widget.newPet.petAge = int.parse(_petAgeController.text);

                            widget.newPet.petBodyLength =
                                double.parse(_petBodyLengthController.text);

                            widget.newPet.petWeight =
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
      ),
    );
  }
}



//-----------------각종 function, methods 모음-------------------------
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

Container customPinkElevatedButton(String text, VoidCallback onPressed) {
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
          onPressed: onPressed),
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

// // --------------------알러지 버튼 리스트 매니저-------------------------
// class AllergyButtonListManager extends StatefulWidget {
//   final PetCategoryListView petCategoryListView;
//
//   AllergyButtonListManager({Key? key, required this.petCategoryListView})
//       : super(key: key);
//
//   final _AllergyButtonListManager listManager = _AllergyButtonListManager();
//
//   _AllergyButtonListManager getStateData() => listManager;
//
//   @override
//   _AllergyButtonListManager createState() => listManager;
// }
//
// class _AllergyButtonListManager extends State<AllergyButtonListManager> {
//   bool isAllergySelected = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return selectHashTagButtonList();
//   }
//
//   void refresh(bool _isSelected) {
//     setState(() {
//       isAllergySelected = _isSelected;
//     });
//   }
//
//   Widget selectHashTagButtonList() {
//     if (!isAllergySelected)
//       // 알러지나 질병이 있나요? Yes or No 버튼 창을 띄우고 싶음
//       return Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(left: 20, right: 20, top: 50),
//         child: Column(
//           children: [
//             customPinkElevatedButton('네', () {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage()),
//                   (route) => false);
//             }),
//             // customPinkElevatedButton(() {}, '네', context, MyHomePage()),
//             SizedBox(height: 30.0),
//             customPinkElevatedButton('아니요(잘 모르겠어요)', () {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage()),
//                   (route) => false);
//             })
//             // customPinkElevatedButton(() {}, "아니요(잘 모르겠어요)", context, MyHomePage()),
//           ],
//         ),
//       );
//     else // 알러지 항목을 선택하는 창을 띄우고 싶음
//       return AllergyInputButtonList(manager: widget);
//   }
// }
//
// class AllergyInputButtonList extends StatelessWidget {
//   final AllergyButtonListManager manager;
//
//   AllergyInputButtonList({Key? key, required this.manager});
//
//   ElevatedButton buildAllergyButton(String buttonText, BuildContext context) {
//     return ElevatedButton(
//         child: Text(buttonText),
//         onPressed: () {
//           manager.getStateData().refresh(true);
//           manager.petCategoryListView.getStateData().add(buttonText);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => FifthRoute(
//                       petCategoryStrList: manager.petCategoryListView
//                           .getStateData()
//                           .petCategoryStrList)));
//         },
//         style: ElevatedButton.styleFrom(
//             primary: Color.fromRGBO(246, 246, 246, 1),
//             onPrimary: PINK,
//             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//             textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//             shape: new RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0))));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               buildAllergyButton('#비염', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#관절염', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#치주염', context),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               buildAllergyButton('#백내장', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#녹내장', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#빈혈', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#간질발작', context),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               buildAllergyButton('#소화불량', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#충치', context),
//               Padding(padding: EdgeInsets.all(20)),
//               buildAllergyButton('#기생충', context),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
