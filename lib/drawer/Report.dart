import 'package:flutter/material.dart';
import 'package:pet_service_application/drawer/MainDrawer.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final List<String> _pageList = ['커뮤니티', '리뷰', '나눔', '페이지1', '페이지2'];
  final List<String> _reportList = ['모욕적 언행 신고', '신고사유1', '신고사유2', '신고사유3', '신고사유4'];
  var _selectedPageValue = '커뮤니티';
  var _selectedReportValue = '모욕적 언행 신고';

  TextEditingController reportText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:60.0),
            child: Text(
              '신고',
              style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
          ),
          SizedBox(height: 45.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:31.0),
            child: Text(
                '페이지',
                style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
          ),
          SizedBox(height: 10.0),
          DropdownButton(
            value: _selectedPageValue,
            items: _pageList.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedPageValue = value!;
              });
            },
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:31.0),
            child: Text(
                '신고종목',
                style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
          ),
          SizedBox(height: 10.0),
          DropdownButton(
            value: _selectedReportValue,
            items: _reportList.map(
                  (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedReportValue = value!;
              });
            },
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:31.0),
            child: Text(
                '상세설명',
                style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
          ),
          SizedBox(height: 10.0),
          Card(
            elevation: 3.0, // 카드박스 그림자 음영
            margin: EdgeInsets.only(left:20, right: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              width: double.infinity,
              height: 150.0,
              padding: EdgeInsets.only(left: 20),
              child: TextFormField(
                  controller: reportText,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '사유를 작성해 주세요',
                      hintStyle: TextStyle(color: GREY)),
                  cursorColor: GREY,
                  //테스트용 코드
                  onChanged: (text) {
                    print(text);
                  }),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:31.0),
            child: Text(
                '이미지 첨부(최대 3장)',
                style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 14)),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                color: Colors.grey[350],
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:31.0),

                child: Text('+'),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                color: Colors.grey[350],
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:15.0),

                child: Text('+'),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                color: Colors.grey[350],
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:15.0),

                child: Text('+'),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 40, right: 40),
            child: customPinkElevatedButton(
                '신고 제출하기',
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MainDrawer())
                  );
                }),
          ),

        ],
      ),
    );
  }
}
