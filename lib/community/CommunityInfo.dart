import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_service_application/class/GoodsInfo.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

class CommunityInfo {
  //서버상의 포스트 ID
  String postID = '';
  //게시글 정보
  UserData user;
  PetInfo pet;
  GoodsInfo? goods ;

  //게시글 내용
  List<String> imageUrls = [];
  List<String> hashTags = [];
  List<String> dialogue = [];
  //좋아요 여부
  bool isLike = false;
  int emoji = -1;

  CommunityInfo(this.user,this.pet);

  //uid로 서버에서 유저정보 불러오기
  static Future<CommunityInfo> getCommunityData(String postID) async  {
    try {
      await Firebase.initializeApp();
    }
    catch (e) {
      throw Exception(e);
    }
    var userDoc = await FirebaseFirestore.instance.collection(
        'Community').doc(postID).get();
    var userData = await UserData.getUserData(userDoc.data()!['UserID']);
    var petData = await PetInfo.getPetData(userData.uid.toString(), userDoc.data()!['petID']);
    return CommunityInfo(userData, petData);
  }

  static Future<String> getRandomPost() async {
    try {
      await Firebase.initializeApp();
    }
    catch (e) {
      throw Exception(e);
    }
    var snapshot = await FirebaseFirestore.instance.collection('Community').get();
    var posts = snapshot.docs;

    return posts[Random().nextInt(posts.length)].id;
  }

  //좋아요 설정
  void setLike(bool like)
  {

  }
}