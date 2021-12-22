import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  ///나의 좋아요 여부
  bool isLike = false;

  //생성자
 CommunityInfo();
 
 ///새 포스트 정보 생성 : 서버로 전송 (굿즈이름은 빈칸으로 임시 입력)
  Future<String> sendPostData() async {
    // 새 포스트 정보(postID 비어있음)
    if(postID == '') {
      CollectionReference posts = 
          FirebaseFirestore.instance.collection('Community');
      var newPost = await posts.add({
        'UserID' : user.uid.toString(),
        'LikeList' : likeList,
        'date' : DateTime.now(),
        'dialogue' : dialogue,
        'goods' : "",
        'hashTags' : hashTags,
        'images' : imageUrls,
        'petID' : pet.petID.toString()
      });
      postID = newPost.id;
      return postID;
    }
    else
      throw Exception('new Post Data Error');
  }

  ///포스트 정보 갱신 : 서버로 전송 (굿즈이름은 빈칸으로 임시 입력)
  Future<void> updatePostData() async {
    //서버상에 이미 있는 포스트 정보
    if(postID != '') {
      CollectionReference posts =
      FirebaseFirestore.instance.collection('Community');
      posts.doc(postID).set({
        'UserID' : user.uid.toString(),
        'LikeList' : likeList,
        'date' : DateTime.now(),
        'dialogue' : dialogue,
        'goods' : "",
        'hashTags' : hashTags,
        'images' : imageUrls,
        'petID' : pet.petID.toString()
      });
    }
    else
      throw Exception('Post not Exist in Server');
  }

  ///uid 로 서버에서 포스트정보 불러오기
  static Future<CommunityInfo> getCommunityData(String postID) async {
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

    ///포스트 ID 설정
    result.postID = postID;
    ///좋아요 리스트, 내 좋아요 설정
    result.likeList = Map.from(await postDoc.data()!['LikeList']);
    for(String user in result.likeList.keys) {
      if (user == Logger().userData.uid.toString()) {
        result.isLike = true;
        break;
      }
      result.isLike = false;
    }

    //내용 설정
    result.dialogue = await postDoc.data()!['dialogue'].cast<String>();
    //해시태그 설정
    result.hashTags = await postDoc.data()!['hashTags'];

    //이미지 설정
    List<String> imageList = await postDoc.data()!['images'].cast<String>();
    for(var imageLink in imageList) {
      if(imageLink != '') {
        var url = await imageRef.child(imageLink).getDownloadURL();
        result.imageUrls.add(url);
      }
    }
    return result;
  }

  ///랜덤 포스트 불러오기
  static Future<CommunityInfo> getRandomPost() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('Community').get();
    var posts = snapshot.docs;
    return await getCommunityData(posts[Random().nextInt(posts.length)].id);

  }


  ///좋아요 설정/취소
  Future<void> setLike() async{
    //좋아요 취소 : true -> false
    if(isLike != false) {
      if (likeList.containsKey(Logger().userData.uid.toString()) == true)
        likeList.remove(Logger().userData.uid.toString());
      isLike = false;
    }
    //좋아요 설정
    else {
      if (likeList.containsKey(Logger().userData.uid.toString()) == false)
        likeList[Logger().userData.uid.toString()] = 0;
      isLike = true;
    }

    await FirebaseFirestore.instance
        .collection('Community')
        .doc(postID).update({'LikeList' : likeList});
  }
}
