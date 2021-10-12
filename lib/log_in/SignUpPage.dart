import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/LogIn.dart';
import 'package:pet_service_application/main.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
            // 키보드 올라옴에 따라 스크린도 같이 올라가는 위젯
            child: SafeArea(
                child: Column(
                  children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.grey[850]),
                )),
            Container(
              margin: EdgeInsets.only(top: 85, bottom: 35.0),
              child: customSubtitleColor('회원가입', PINK),
            ),
            //SizedBox(height: 25),
            Container(child: customPinkEmailBox(emailController, '이메일')),

            SizedBox(height: 35),

            Container(child: customPinkPasswordBox(passwordController, '비밀번호')),

            SizedBox(height: 35),

            Container(
                child: customPinkPasswordBox(cPasswordController, '비밀번호 확인')),

            SizedBox(height: 35),

            Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: customPinkElevatedButton('가입하기', () {
                  Navigator.pop(context);
                })),
            Container(
              margin: EdgeInsets.only(top: 45.0, bottom: 25.0),
              child: customSubtitleColor('소셜 회원가입', PINK),
            ),
            // 간편로그인
            Container(
              margin: EdgeInsets.only(left: 72.0, right: 72.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogInIcon('images/loginIcon/icon_kakao.png'),
                ],
              ),
            )
          ],
        )));
      }),
    );
  }
}
// class CheckValidate{
//   String validateEmail(FocusNode focusNode, String value){
//     if(value.isEmpty){
//       focusNode.requestFocus();
//       return '이메일을 입력하세요.';
//     }
//     else {
//       Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//       RegExp regExp = new RegExp(pattern);
//       if(!regExp.hasMatch(value)){
//         focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
//         return '잘못된 이메일 형식입니다.';
//       }else{
//         return null;
//       }
//     }
//   }
//   String validatePassword(FocusNode focusNode, String value){
//     if(value.isEmpty){
//       focusNode.requestFocus();
//       return '비밀번호를 입력하세요.';
//     }else {
//       Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
//       RegExp regExp = new RegExp(pattern);
//       if(!regExp.hasMatch(value)){
//         focusNode.requestFocus();
//         return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
//       }else{
//         return null;
//       }
//     }
//   }
// }
