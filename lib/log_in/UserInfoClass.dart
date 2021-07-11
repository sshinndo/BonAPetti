import 'package:flutter/material.dart';
import 'package:pet_service_application/main.dart';

class UserAccount {
  String userEmail; // 사용자 이메일
  String userPassword; // 사용자 비밀번호
  UserInfo? userInfo; // 사용자 정보 클래스
  UserAccount(this.userEmail,this.userPassword,this.userInfo);
}

class UserInfo {
  String userNickname; //사용자 이름,닉네임
  PetInfo? petInfo; //
  UserInfo(this.userNickname,this.petInfo);
}

class PetInfo {
  String petName;
  List<String> petTypeNameList;
  int petAge;
  double petBodyLength;
  double petWeight;
  PetSilhouette petSilhouette;
  List<String>? petAllergyList;

  PetInfo(this.petName,this.petTypeNameList,this.petAge,this.petBodyLength,
      this.petWeight,this.petSilhouette,this.petAllergyList);
}
enum PetSilhouette { BCS1, BCS2, BCS3, BCS4, BCS5 } // 질문5-2] 반려동물 실루엣(BCS단계)

// 사용자 정보 초기화
UserAccount userAccount = UserAccount('email', 'password', null);
UserInfo userInfo = UserInfo('testName',null);
PetSilhouette petSilhouette = PetSilhouette.BCS1 ;
PetInfo petInfo = PetInfo('petName', [], 0, 0, 0, petSilhouette, null);


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