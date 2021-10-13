import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

// 활동메달(메달목록) 페이지
class ActivityMedal extends StatefulWidget {
  const ActivityMedal({Key? key}) : super(key: key);

  @override
  _ActivityMedalState createState() => _ActivityMedalState();
}

class _ActivityMedalState extends State<ActivityMedal> {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
                SizedBox(width:20),
                NewWidget(width: width, height: height),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset("images/profile/sample_medal.png",
        width: width*.25,
        height: height*.15,
        fit: BoxFit.fill,
      ),
    );
  }
}