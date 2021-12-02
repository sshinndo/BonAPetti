//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/main.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void>? _launched;

  @override
  void initState() {
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
      throw 'Could not launch $url';
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
                    width: width * 0.266, height: height * 0.12
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
                          SizedBox(width: 30),
                          GestureDetector(
                              child: Container(
                                child: customSubtitleColor('프로필 작성 이동', GREY),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FirstRoute()
                                  ),
                                );
                              }
                          ),
                    ])),
              ],
            )));
      }),
    );
  }
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
      decoration: BoxDecoration(shape: BoxShape.circle),
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

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  bool _isKakaoTalkInstalled = false;

  var validateToken;
  @override
  void initState() {
    super.initState();
    _initKakaoTalkInstalled();
  }

  // 카카오톡이 설치되었는지 확인 코드
  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    // print("kakao Install : " + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

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
      debugPrint("test");
    }
  }

  // 카톡 앱을 통한 카카오 로그인
  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
      debugPrint("test222");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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

/*
class KakaoWebView extends StatefulWidget {
  final String initialUrl;
  KakaoWebView({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _KakaoWebView createState() => _KakaoWebView();
}

class _KakaoWebView extends State<KakaoWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: widget.initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
*/
/*
final navigatorKey = GlobalKey<NavigatorState>();

class KakaoWebView extends StatefulWidget {
  final String initialUrl;
  KakaoWebView({Key? key, required this.initialUrl});

  @override
  _KakaoWebView createState() => _KakaoWebView();
}

class _KakaoWebView extends State<KakaoWebView> {
  final _controller = WebviewController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    await _controller.initialize();
    _controller.url.listen((url) {
      _textController.text = url;
    });

    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.loadUrl(widget.initialUrl);

    if (!mounted) return;

    setState(() {});
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'URL',
                    contentPadding: EdgeInsets.all(10.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        _controller.reload();
                      },
                    )),
                textAlignVertical: TextAlignVertical.center,
                controller: _textController,
                onSubmitted: (val) {
                  _controller.loadUrl(val);
                },
              ),
            ),
            Expanded(
                child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Webview(
                          _controller,
                          permissionRequested: _onPermissionRequested,
                        ),
                        StreamBuilder<LoadingState>(
                            stream: _controller.loadingState,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data == LoadingState.loading) {
                                return LinearProgressIndicator();
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ))),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: Center(
          child: compositeView(),
        ),
      ),
    );
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }*/
