import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogIn())),
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
                  SizedBox(width: 34.0),
                  LogInIcon('images/loginIcon/icon_naver.png'),
                  SizedBox(width: 34.0),
                  LogInIcon('images/loginIcon/icon_google.png'),
                ],
              ),
            )
          ],
        )));
      }),
    );
  }
}
