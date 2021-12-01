import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
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
  String hashTags = '';
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
    //파이어베이스 인증
    //await FirebaseAuth.instance.signInAnonymously();
    //ID를 통해 유저, 펫 문서 불러오기
    var userDoc = await FirebaseFirestore.instance.collection(
        'Community').doc(postID).get();
    var userData = await UserData.getUserData(userDoc.data()!['UserID']);
    var petData = await PetInfo.getPetData(userData.uid.toString(), userDoc.data()!['petID']);
    //반환 커뮤니티 데이터 생성
    var result = CommunityInfo(userData, petData);
    {
      result.postID = postID;
      //내 좋아요 여부 설정
      List<String> likeList = userDoc.data()!['LikeList'].cast<String>();
      result.isLike = likeList.contains(userDoc.data()!['UserID']);
      //내용 설정
      result.dialogue = userDoc.data()!['description'].cast<String>();
      //해시태그 설정
      result.hashTags = userDoc.data()!['hashTags'];
      //이미지 설정
      List<String> imageList = userDoc.data()!['images'].cast<String>();
      imageList.forEach((element) {
        var url = FirebaseStorage.instance.ref().child(element).getDownloadURL();
        url.then((urlResult) {
          result.imageUrls.add(urlResult);
        });
      });
    }
    return result;
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