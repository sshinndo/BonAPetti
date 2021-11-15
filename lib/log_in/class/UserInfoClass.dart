import 'package:flutter/material.dart';

class UserAccount {
  static String userEmail = ""; // 사용자 이메일
  static String userPassword = ""; // 사용자 비밀번호
  static UserInfo? userInfo; // 사용자 정보 클래스
  //UserAccount(this.userEmail, this.userPassword, this.userInfo);
}

class UserInfo {
  static String userNickname = ""; //사용자 이름,닉네임
  static PetInfo? petInfo; //
}

class PetInfo {
  static String petName = ""; // 펫 이름
  static List<String> petTypeNameList = [];   //x
  static int petAge = 0;
  static double petBodyLength = 0;
  static double petWeight = 0;
  static PetSilhouette petSilhouette = PetSilhouette.BCS1;
  static List<String>? petAllergyList = [];
}

enum PetSilhouette { BCS1, BCS2, BCS3, BCS4, BCS5 } // 질문5-2] 반려동물 실루엣(BCS단계)

// 사용자 정보 초기화
UserAccount userAccount = UserAccount();
//UserInfo userInfo = UserInfo('testName',null);
//PetSilhouette petSilhouette = PetSilhouette.BCS1 ;
//PetInfo petInfo = PetInfo('petName', [], 0, 0, 0, petSilhouette, null);


//예시데이터
//PetInfo pet = PetInfo('dd',
//    ['강아지', '웰시코기'],
//    5,
//    30,
//    30,
//    실루엣.ONE,
//    ['비염', '대충']);
//
//class 뭐시기 extends Stateless {
//bool is//
//}