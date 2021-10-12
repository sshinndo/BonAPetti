import 'package:flutter/cupertino.dart';

class ShortsInfo {
  Profile profile;
  String VideoUrl;
  bool isLike;

  ShortsInfo(this.profile,this.VideoUrl,this.isLike);
}

class Profile {
  String profileImage;
  String nickName;
  String petName;

  Profile(this.profileImage,this.nickName,this.petName);
}