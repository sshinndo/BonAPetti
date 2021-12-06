import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';

// Gridview 참고하기 : https://devmg.tistory.com/181
//
// 활동메달(메달목록) 페이지
class ActivityMedal extends StatefulWidget {
  const ActivityMedal({Key? key}) : super(key: key);

  @override
  _ActivityMedalState createState() => _ActivityMedalState();
}

class _ActivityMedalState extends State<ActivityMedal> {

  final List<String> items = List.generate(20, (i){
    return '메달${i}';
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWithAlarm(nickName: "활동메달"),
            Expanded( // Expanded를 쓰지 않으면 화면상에 메달이 출력이 안 됨
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1/1, //각 타일의 가로/세로 비율
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, i){
                    return InkWell(
                      onTap: (){
                        // setState(() {}); : 터치 시 메달 상태 변화
                        MedalPopUpPage();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(// 바깥쪽 회색 테두리
                            width: width* 0.36,
                            height: width* 0.36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: GREY,
                              //color: Colors.grey[300],
                            ),
                            margin: EdgeInsets.all(25.0),
                          ),
                          Positioned(
                            // 흰색 동그라미
                            width: width* 0.188,
                            height: width* 0.188,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(237, 237, 237, 1),
                                shape: BoxShape.circle
                              ),
                            ),
                          ),
                          GridTile(
                            // borderRadius: BorderRadius.circular(100),
                              child: Text(
                                items[i],
                                style: TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                          ),
                        ]
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  void MedalPopUpPage() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {

        // Future.delayed(Duration(seconds: 3), () {
        //   Navigator.pop(context);
        // });

        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          title: Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    },
                    child: Icon(Icons.close, size: 36)
                )
              ],
            ),
          ),
          content: Container(
            width: width*0.8,
            height: height*0.6,
            // color: Colors.blue,
            child: Column(
              children: [
                Text(
                    "회원가입메달",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 45),
                CircleAvatar(
                  radius: 200,
                  backgroundColor: LIGHTGREY,
                ),
                SizedBox(height: 31),
                Text(
                  "보나펫티 가입을 환영합니다!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "회원가입을 한 분들을 위한 메달",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        )
        );
      },
    );
  }
}
class MedalPopUpScreen extends StatefulWidget {
  const MedalPopUpScreen({Key? key}) : super(key: key);

  @override
  _MedalPopUpScreenState createState() => _MedalPopUpScreenState();
}

class _MedalPopUpScreenState extends State<MedalPopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
