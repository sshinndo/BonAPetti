import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_service_application/product/GoodsInfo.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';

class CommunityInfo {
  ///서버상의 포스트 ID
  String postID = '';
  ///게시글 정보
  UserData user = UserData();
  PetInfo pet = PetInfo('');
  GoodsInfo? goods;
  ///게시글 내용
  List<String> imageUrls = [];
  String hashTags = '';
  List<String> dialogue = [];
  ///좋아요 사용자:이모지 리스트
  Map<String, int> likeList = {};

  //생성자
 CommunityInfo();

  ///uid로 서버에서 유저정보 불러오기
  static Future<CommunityInfo> getCommunityData(String postID) async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      throw Exception(e);
    }
    //파이어베이스 인증
    //await FirebaseAuth.instance.signInAnonymously();
    ///ID로 유저 문서 접근
    var postDoc = await FirebaseFirestore.instance
        .collection('Community')
        .doc(postID)
        .get();
    var imageRef = FirebaseStorage.instance.ref().child('Community/posts');
    ///커뮤니티 데이터 멤버 불러오기
    UserData userData = await UserData.getUserData(postDoc.data()!['UserID']);
    PetInfo petInfo =
        await PetInfo.getPetData(userData.uid.toString(), postDoc.data()!['petID']);
    ///반환할 포스트 정보 객체
    CommunityInfo result = CommunityInfo();
    result.user = userData;
    result.pet = petInfo;
    debugPrint('Current Status');

    ///포스트 ID 설정
    result.postID = postID;
    //좋아요 리스트 설정
    result.likeList = await postDoc.data()!['LikeList'];
    //내용 설정
    result.dialogue = await postDoc.data()!['description'].cast<String>();
    //해시태그 설정
    result.hashTags = await postDoc.data()!['hashTags'];

    //이미지 설정
    List<String> imageList = await postDoc.data()!['images'].cast<String>();
    imageList.forEach((imageLink) async {
      if(imageLink != '') {
        var url = await imageRef.child(imageLink).getDownloadURL();
        result.imageUrls.add(url);
      }
    });

    return result;
  }

  ///랜덤 포스트 불러오기
  static Future<String> getRandomPost() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      throw Exception(e);
    }
    //await FirebaseAuth.instance.signInAnonymously();
    var snapshot =
        await FirebaseFirestore.instance.collection('Community').get();
    var posts = snapshot.docs;
    return posts[Random().nextInt(posts.length)].id;
  }

  ///내가 좋아요 눌렀는지 여부
  bool isLike() {
    return false;
  }

  ///좋아요 설정
  void setLike(int emoji) {}
}
