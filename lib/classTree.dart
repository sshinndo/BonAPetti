import 'package:flutter/material.dart';

class UserInfo {
  // TextEditingController emailController=TextEditingController() ;
  // TextEditingController passwordController=TextEditingController();

  String userEmail; // 사용자 이메일
  String userPassword; // 사용자 비밀번호
  bool isUserCurrentLogin;

  String userNickname; // 질문1] 사용자 성함
  bool isUserWriteProfile; // 질문2] 사용자 프로필 작성여부?

  UserInfo(this. userEmail, this.userPassword, this.isUserCurrentLogin,
      this.userNickname, this.isUserWriteProfile);
}

class PetInfo {
  String petName; //질문3] 반려동물 이름은?
  String petType; //질문4-1] 반려동물 종류
  String petSpecies; //질문4-2] 반려동물 세부 종
  PetBodyInfo petBodyInfo; // 질문 5] 반려동물의 신체 정보
  PetSilhouette petSilhouette;

  PetInfo(this.petName, this.petType, this.petSpecies, this.petBodyInfo,
      this.petSilhouette);
}

enum PetSilhouette { BCS1, BCS2, BCS3, BCS4, BCS5 } // 질문5-2] 반려동물 실루엣(BCS단계)

// 질문5] 반려동물의 신체 정보
class PetBodyInfo {
  num petAge; // 질문 5-1] 펫의 나이
  num petLength; // 질문 5-2] 펫의 몸 길이
  num petWeight; // 질문 5-3] 펫의 몸무게
  bool isPetAllergy; //질문 5-4] 펫 알러지 여부?
  List petAllergyType ; // 질문 5-5] 있다면 펫 알러지 종류

  PetBodyInfo(this.petAge, this.petLength, this.petWeight,
      this.isPetAllergy, this. petAllergyType);
}