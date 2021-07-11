import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';
import 'package:pet_service_application/main.dart';
import 'package:pet_service_application/log_in/SignUpPage.dart';
import 'package:pet_service_application/log_in/Splash.dart';
import 'dart:math';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}
class _LogInState extends State<LogIn> {

  TextEditingController emailController=TextEditingController() ;
  TextEditingController passwordController=TextEditingController();

  bool isLoading = false;


  @override
  void initState(){
    super.initState();
    emailController=TextEditingController(text:'');
    passwordController=TextEditingController(text:'');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
            // 키보드 올라옴에 따라 스크린도 같이 올라가는 위젯
            child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                margin: EdgeInsets.only(left: 32, right: 32, top: 100),
                child: Image.asset('images/logo_main.png'),
              ),
              //SizedBox(height: 25),
              GestureDetector(
                  child: Container(
                    child: customSubtitleColorUnderline('비회원으로 앱 둘러보기', PINK),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(title: appName)))),
              SizedBox(height: 35),
              Container(child: customPinkEmailBox(emailController, '이메일')),
              SizedBox(height: 20),
              Container(
                  child: customPinkPasswordBox(passwordController, '비밀번호')),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left:35, right: 35),
                child: customPinkElevatedButton('로그인',context, ProfileQuestion()),
              ),
              SizedBox(height:20),
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
              ),
            SizedBox(height: 20.0),
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  child: Container(
                    child: customSubtitleColor('회원가입', GREY),
                  ),
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => SignUp()))),
              SizedBox(width: 17.5),
              GestureDetector(
                  child: Container(
                    child: customSubtitleColor('|', GREY),
                  ),
                  onTap: () {}),
              SizedBox(width: 17.5),
              GestureDetector(
                child: Container(
                  child: customSubtitleColor('문의하기', GREY),
                ),
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
              ),
            ])),
          ],
        )));
      }),
    );
  }
  // void _loginCheck() async{
  //   print('emailController.text: %{emailController}');
  //   print('passwordController.text: %{passwordController}');
  //   final storage = FlutterSecureStorage();
  //   String storagePass = await storage.read(key: emailController.text);
  //   if (storagePass != null &&
  //       storagePass != '' &&
  //       storagePass == passwordController.text) {
  //     print('storagePass: $storagePass');
  //     String userNickName = await storage.read(key: '${emailController.text}');
  //     storage.write(key: userNickName, value: STATUS_LOGIN);
  //     print('로그인 성공!');
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (BuildContext context) =>
  //             MyHomePage(title: userNickName)));
  //   }
  //   else{
  //     print('로그인 실패');
  //     showToast('아이디가 존재하지 않거나 비밀번호가 맞지 않습니다.');
  //   }
  // }
}

class LogInIcon extends StatelessWidget {
  String imagePath;

  LogInIcon(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.all(100.0),
        width: 49.0,
        height: 49.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Image.asset(imagePath),
    );
  }
}

Card customPinkEmailBox(TextEditingController controller, String text) {
  return Card(
      margin: EdgeInsets.only(left: 35.0, right: 35.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(width: 1, color: PINK)),
      child: Container(
          margin: EdgeInsets.only(left: 35.0, right: 35.0),
          width: double.infinity,
          height: 55.0,
          child: TextFormField(
            controller: controller,
            cursorColor: GREY,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 12.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: text,
                hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1))),
          )));
}
Card customPinkPasswordBox(TextEditingController controller, String text) {
  return Card(
      margin: EdgeInsets.only(left: 35.0, right: 35.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(width: 1, color: PINK)),
      child: Container(
          margin: EdgeInsets.only(left: 35.0, right: 35.0),
          width: double.infinity,
          height: 55.0,
          child: TextFormField(
            controller: controller,
            cursorColor: GREY,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 12.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: text,
                hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1))),
          )));
}
void showSnackBarLogin(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
    Text('로그인 정보를 다시 확인하세요',
        textAlign: TextAlign.center
    ),
        duration: Duration(seconds: 2),
    )
  );
}
void showSnackBarPassword(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('비밀번호가 일치하지 않습니다',
          textAlign: TextAlign.center
      ),
        duration: Duration(seconds: 2),
      )
  );
}
void showSnackBarEmail(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('이메일이 일치하지 않습니다',
          textAlign: TextAlign.center
      ),
        duration: Duration(seconds: 2),
      )
  );
}

