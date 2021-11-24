
import 'package:flutter/material.dart';
import 'package:pet_service_application/community/CommunityInfo.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';

class UserData
{
  //유저 계정 정보 (카카오 계정 정보 하나)
  static String AccountInfo = "";

  //유저 이름과 설명
  static String Name = "";
  static List<String> Description = [];

  //유저 이미지 2개
  static String MedalImage = "";
  //프로필 이미지
  static String MyImage = "";

  //친구 유저들의 이름
  static List<String> Friends = [];  //x
  //유저가 작성한 쇼츠 게시물들
  static List<ShortsInfo> Shorts = [];
  //유저가 작성한 커뮤니티 게시글들
  static List<CommunityInfo> Community = [];

  //UserInfo상의 펫 클래스 참조
  static List<PetInfo> MyPets = [];

  //첫 생성 초기화
  UserData(String _name)
  {
    Name = _name;
    Description.add("안녕하세요. " + Name + "입니다.");
  }
}
