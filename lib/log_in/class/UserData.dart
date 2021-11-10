
import 'package:flutter/material.dart';
import 'package:pet_service_application/community/CommunityInfo.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'package:pet_service_application/log_in/class/UserInfoClass.dart';

class UserData
{
  //유저 정보 1개를 가리키는 해시값
  //static int UserHash;

  //유저 계정 정보 (카카오 계정 정보 하나)
  static String AccountInfo = "";
  //static Date DateTime; //계정 생성 날짜(인가?)

  //유저 이름과 설명
  static String Name = "";
  static List<String> Description = [];

  //유저 이미지 2개
  static String MedalImage = "";
  static String MyImage = "";

  //친구 유저들의 해시 데이터
  static List<int> Friends = [];
  //유저가 작성한 쇼츠 게시물들
  static List<ShortsInfo> Shorts = [];
  //유저가 작성한 커뮤니티 게시글들
  static List<CommunityInfo> Community = [];


  //UserInfo상의 펫 클래스 참조
  static List<PetInfo> MyPets = [];
  //내 펫이 가지는 알러지 정보? (맞다면 PetInfo로 넣는게 좋을듯)
  //static List<String> Allergy = [];

  //쇼핑 위시리스트 (링크로 참조?)
  static List<String> WishList = [];
}
