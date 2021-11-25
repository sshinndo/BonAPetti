import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 마이페이지 프로필 class
import 'package:flutter/material.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';

class MyPageInfo {
  UserAccount userAccount; //사용자 계정 정보 데이터
  UserProfileInfo userProfile; // 사용자 프로필 하위 class
  PetProfileInfo petProfileInfo; // 펫 프로필 하위 class

  MyPageInfo(this.userAccount,this.userProfile,this.petProfileInfo);
}

class UserAccount {
  static String userEmail = ""; // 사용자 이메일
  static String userPassword = ""; // 사용자 비밀번호
  static UserInfo? userInfo; // 사용자 정보 클래스
  //UserAccount(this.userEmail, this.userPassword, this.userInfo);
}

// 사용자 프로필 class
class UserProfileInfo {
  final String userNickname; // 사용자 닉네임
  final String userLevel; // 사용자 등급 레벨
  final String userProfileImageUrl; // 사용자 대표 프로필 이미지 경로

  final String userIntroduction; // 사용자 - 나를 소개하는 한 마디

  final List<String> userActivityMedals; // 사용자 활동 메달 리스트

  final bool isUserMainMedal; // 사용자 대표 메달 설정 여부?
  final String userMainMedalUrl; // 사용자 대표 메달 이미지 경로

  UserProfileInfo(this.userNickname,this.isUserMainMedal,this.userActivityMedals,
      this.userIntroduction,this.userLevel,this.userProfileImageUrl, this.userMainMedalUrl);

  // 프로필 class + http 통신 코드 작업 하던 것
  //
  // factory UserProfileInfo.fromJson(Map<String, dynamic> json){
  //   return UserProfileInfo(
  //     userNickname: json['userNickname'],
  //     userLevel: json['userLevel'],
  //     userProfileImageUrl: json['userProfileImageUrl'],
  //     userIntroduction: json['userIntroduction'],
  //     userActivityMedals: json['userActivityMedals'],
  //     isUserMainMedal: json['isUserMainMedal'],
  //   );
  // }
}
// 반려동물 프로필 class
class PetProfileInfo{
  static String petName = ""; // 펫 이름
  static String petProfileImageUrl = ""; // 펫 프로필 사진 경로
  static List<String> petTypeNameList = []; // 종류 타입
  static int petAge = 0; // 나이
  static double petBodyLength = 0; // 몸 길이
  static double petWeight = 0; // 몸무게
  static PetSilhouette petSilhouette = PetSilhouette.BCS1; // BCS 단계
  static List<String>? petAllergyList = []; // 알러지 리스트
  static List<String> petDiseaseList = []; // 질병 리스트
  static bool isPetMain = false; // 대표 펫 프로필 여부?
}

// enum PetSilhouette { BCS1, BCS2, BCS3, BCS4, BCS5 } // 질문5-2] 반려동물 실루엣(BCS단계)