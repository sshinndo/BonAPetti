import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/log_in/screen/delay_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:kakao_flutter_sdk/all.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void>? _launched;

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
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    //구글 설문지 링크
    const String _url = 'https://docs.google.com/forms/d/e/1FAIpQLSffJTPtzolI8Yg2gnCa1HSNW-RYGY2-YNks0BXfMvoZqmRLig/viewform';

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    KakaoContext.clientId = '9562e3633088ea0ac9cd1f627011bf87';
    KakaoContext.javascriptClientId = "369339f74ffc0e1f44389458d0bbc7e6";

    if(_initialized)
      return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
            // 키보드 올라옴에 따라 스크린도 같이 올라가는 위젯
            scrollDirection: Axis.vertical,
            child: SafeArea(
                child: Column(
              children: <Widget>[
                // 보나펫티 로고
                Container(
                  margin: EdgeInsets.only(left: 32, right: 32, top: 100)
                ),
                Image.asset('images/logo.png',
                    width: width * 0.266, height: height * 0.12,
                ),
                SizedBox(height: 20),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '보나펫티로 든든한 ',
                      style: TextStyle(
                          color: Color.fromRGBO(68, 0, 0, 0.8),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: '밥심!',
                      style: TextStyle(
                          color: Color.fromRGBO(68, 0, 0, 0.8),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900))
                ])),
                SizedBox(height: 35),
                Image.asset('images/loginCharacter.png',
                  width: width * 210 / 360, height: height * 208 / 800,
                ),
                SizedBox(height: 33),
                KakaoLogin(),
                SizedBox(height: 20),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      GestureDetector(
                        child: Container(
                          child: customSubtitleColor('문의하기', GREY),
                        ),
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(_url);
                          });
                        }
                      ),
                          // SizedBox(width: 30),
                          // GestureDetector(
                          //     child: Container(
                          //       child: customSubtitleColor('프로필 작성 이동', GREY),
                          //     ),
                          //     onTap: () {
                          //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstRoute()), (route) => false);
                          //     }
                          // ),
                    ])),
              ],
            )));
      }),
    );  ///로그인 화면
    else
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Builder(builder: (context) {
          return CircularProgressIndicator();
        }
        )
      );  ///로딩중
  }
}

class LogInIcon extends StatelessWidget {
  final String imagePath;

  LogInIcon(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(100.0),
      width: 49.0,
      height: 49.0,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(imagePath),
    );
  }
}

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}
//카카오톡을 통한 계정 로그인
class _KakaoLoginState extends State<KakaoLogin> {

  bool _isKakaoTalkInstalled = false;
  var validateToken; // 인증용 토큰
  @override
  void initState() {
    super.initState();
    //카톡 설치 여부 확인
    _initKakaoTalkInstalled();
  }

  // 카카오톡 설치확인 코드
  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    // print("kakao Install : " + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }
  //유저 ID 불러와서 인증
  _issueAccessToken(String authCode) async {
    try {
      //엑세스 토큰 받기
      var token = await AuthApi.instance.issueAccessToken(authCode);
      //엑세스 토큰을 통한 인증
      AccessTokenStore.instance.toStore(token);
      validateToken = await AccessTokenStore.instance.fromStore();
      //토큰 인증 오류
      if (validateToken.refreshToken == null) {
        throw Exception('LogIn Token Auth Error');
      }
      //카카오 로그인 성공, 유저 ID 불러오기
      else{
        User kakaoUser = await UserApi.instance.me();

        //계정 존재 여부 체크
        var userDataCheck = Logger().isKakaoUserExist(kakaoUser.id);
        userDataCheck.then((value) {
          if (value != false)  //계정 존재
            {
              var getAccountData = UserData.getUserData(value.toString());
              getAccountData.then((value) {
                Logger().userData = value;
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DelayScreen()),
                      (route) => false);
            }
          //계정 첫 생성 후 페이지 넘김
          else{
            Logger().userData.accountInfo = kakaoUser.id;
            Navigator.pushAndRemoveUntil(
           context,
                MaterialPageRoute(builder: (context) => ProfileQuestion()),
                    (route) => false);
          }
        });
        print('> kakao id : ${kakaoUser.id.toString()}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // 웹을 통한 카카오 로그인
  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  // 카톡 앱을 통한 카카오 로그인
  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _isKakaoTalkInstalled ? _loginWithTalk() : _loginWithKakao(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("images/loginIcon/kakao_login_large_wide.png")),
        ),
      ),
    );
  }
}