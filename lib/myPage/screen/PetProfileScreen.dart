import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';
import 'package:pet_service_application/mypage/screen/EditPetProfileScreen.dart';
import 'package:pet_service_application/mypage/widget/PetProfileWidget.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({Key? key}) : super(key: key);
  @override
  _PetProfileScreenState createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.08),
              Row(
                children: [
                  Expanded(flex:1,
                      child: Container(),
                  ),
                  Expanded(flex:3,
                      child: Text(
                        "함께하는 반려동물",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      )
                  ),
                  Expanded(flex:1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>EditPetProfileScreen())
                          );
                        },
                        child: SvgPicture.asset('images/svg/pencil.svg',
                          width: 35, height: 35, color: Color.fromRGBO(165, 165, 165, 1),
                        ),
                      ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.085),

              ClipRRect( // 프로필 이미지 설정란
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'images/profile/pet_profile_sample.png',
                  width: 162,
                  height: 162,
                ),
              ),
              SizedBox(height: 26),
              // ''' 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle, size: 6,
                    color: GREY,
                  ),
                  SizedBox(width: 9),
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: GREY,
                  ),
                  SizedBox(width: 9),
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: GREY,
                  ),
                ],
              ),
              SizedBox(height: 24),
              // 펫 정보 Container
              PetProfileWidget(petInfo: PetInfo())
            ],
          ),
        ),
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}