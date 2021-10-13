// 마이페이지 프로필 class
class MyPageInfo {
  //Profile profile;

  UserProfileInfo userProfile; // 사용자 프로필 하위 class

  String profileImage;
  String nickName;
  String petName;

  String imageUrl;
  List<String> hashTags;
  List<String> dialogue;

  bool isLike;


  MyPageInfo(this.profileImage,this.nickName,this.petName,this.imageUrl,this.hashTags,this.dialogue,this.isLike, this.userProfile);
}

// 사용자 프로필 class
class UserProfileInfo {
  String userNickname; // 사용자 닉네임
  String userLevel; // 사용자 등급 레벨
  String userProfileImageUrl; // 사용자 대표 프로필 이미지 경로

  String userIntroduction; // 사용자 - 나를 소개하는 한 마디

  List<String> userActivityMedals; // 사용자 활동 메달 리스트

  bool isUserMainMedal; // 사용자 대표 메달 설정 여부?

  UserProfileInfo(this.userNickname,this.isUserMainMedal,this.userActivityMedals,this.userIntroduction,this.userLevel,this.userProfileImageUrl);
}

// 반려동물 프로필 class
class PetProfileInfo{

}