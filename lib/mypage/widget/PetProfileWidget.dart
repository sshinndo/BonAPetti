import 'package:flutter/material.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class PetProfileWidget extends StatefulWidget {
  final PetInfo petInfo; // 펫 정보 객체
  const PetProfileWidget({Key? key, required this.petInfo}) : super(key: key); // 펫 정보 생성자

  @override
  _PetProfileWidgetState createState() => _PetProfileWidgetState(); // 위젯 생성
}

class _PetProfileWidgetState extends State<PetProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          //펫 이름
          Text(PetInfo.petName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),

          // # 강아지, #말티즈
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.35),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              customSubtitleQuestionColor("#강아지"),
              SizedBox(width: 25),
              customSubtitleQuestionColor("#말티즈"),
            ]),
          ),
          SizedBox(height: 30),
          TextWidget(text: "나이 5살 · 몸 길이 30 cm · 몸무게 3kg"),
          TextWidget(text: "알러지 유무"),
          TextWidget(text: "질병 유무"),
          TextWidget(text: "비만도 상태"),
          Image.asset('images/bcs/bcs2.png',width:120,height: 100)
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),
      ),
    );
  }
}
