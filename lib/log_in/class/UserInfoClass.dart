import 'package:flutter/material.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

class UserAccount {
  String userEmail = ""; // 사용자 이메일
  String userPassword = ""; // 사용자 비밀번호
  UserData? userInfo; // 사용자 정보 클래스
  //UserAccount(this.userEmail, this.userPassword, this.userInfo);
}

// 사용자 정보 초기화
UserAccount userAccount = UserAccount();