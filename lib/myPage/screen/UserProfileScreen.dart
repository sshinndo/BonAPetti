import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.08),
              Container(
                alignment: Alignment.center,
                child: Text("프로필",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height*0.05),
              Container(
                alignment: Alignment.center,
                child: Text("프로필 이미지",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(height: height*0.02),
              ClipRRect( // 프로필 이미지 설정란
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/profile/sample_profile.png',
                  width: 122,
                  height: 122,
                ),
              ),
              SizedBox(height: height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                    elevation: 4.0,
                    child: InkWell(
                        splashColor: Colors.grey.withAlpha(30),
                        child: SizedBox( // 카드 박스의 Size
                          width: width*0.43,
                          height: height*0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('images/svg/camera.svg', // 갤러리 이미지
                                width: 16,
                                height: 16, // 크기는 폰트 사이즈와 맞게
                              ),
                              SizedBox(width: 8),
                              Text('사진촬영',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap:(){
                          // 사진촬영 기능으로 이동
                        }
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                    elevation: 4.0,
                    child: InkWell(
                        splashColor: Colors.grey.withAlpha(30),
                        child: SizedBox( // 카드 박스의 Size
                          width: width*0.43,
                          height: height*0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('images/svg/gallery.svg', // 갤러리 이미지
                                width: 16,
                                height: 16, // 크기는 폰트 사이즈와 맞게
                              ),
                              SizedBox(width: 8),
                              Text('갤러리',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap:(){
                          // 갤러리 기능으로 이동
                        }
                    ),
                  ),
              ]),
              SizedBox(height: height*0.025),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                elevation: 4.0,
                child: InkWell(
                    splashColor: Colors.grey.withAlpha(30),
                    child: SizedBox( // 카드 박스의 Size
                      width: width*0.93,
                      height: height*0.075,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('대표 활동메달',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap:(){
                      // 대표활동메달 팝업 페이지로 이동
                    }
                ),
              ),
              SizedBox(height: height*.05),

              //나를 소개하는 한마디
              Container(
                margin: EdgeInsets.only(
                    left: width*0.08
                ),
                alignment: Alignment.centerLeft,
                child: Text("나를 소개하는 한 마디",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(height: height*0.03),
              Card( // 프로필 상태메시지 입력창
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                elevation: 4.0,
                child: InkWell(
                    splashColor: Colors.grey.withAlpha(30),
                    child: Container( // 카드 박스의 Size
                        width: width*0.87,
                        height: height*0.2,
                        padding: EdgeInsets.only(
                            top: height*0.03,
                            left: width*0.06
                        ),
                        child: TextFormField(
                          //   onSaved: (val),
                          //   validator: ,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '나를 소개하는 한 마디를 입력해주세요! (20자 이내)',
                                hintStyle: TextStyle(color: GREY)),
                            cursorColor: GREY,
                            //테스트용 코드
                            onChanged: (text) {
                              print(text);
                            })
                    ),
                    onTap:(){
                      //
                    }
                ),
              ),
              SizedBox(height: height*0.03),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // 카드 테두리의 둥글기 설정값
                elevation: 2.0,
                child: InkWell(
                    splashColor: Colors.grey.withAlpha(30),
                    child: SizedBox(
                      width: width*0.9,
                      height: 52.0,
                      child: ElevatedButton(
                          child: Text("저장 하기"),
                          style: ElevatedButton.styleFrom(
                              primary: PINK,
                              onPrimary: Colors.white,
                              textStyle: TextStyle(fontSize: 14
                                //fontWeight: FontWeight.bold
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                          onPressed: () async{
                            // if (this.formKey.currentState.validate()){
                            //   // validation 이 성공하면 true 가 리턴돼요!
                            //   Get.snackbar(
                            //     '저장완료!',
                            //     '폼 저장이 완료되었습니다!',
                            //     backgroundColor: Colors.white,
                            //   );
                            // }
                          }
                      ),
                    ),
                    onTap:(){
                      // 대표활동메달 팝업 페이지로 이동
                    }
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}