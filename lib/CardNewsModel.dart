class CardNewsModel {
  String imgUrl, title;
  DateTime? startDate, endDate;

  // 연관 상품 리스트 추가 예정

  List<CardNewsCommentModel>? cardNewsCommentList;

  CardNewsModel(this.imgUrl, this.title, this.startDate, this.endDate,
      this.cardNewsCommentList);
}

class CardNewsCommentModel {
  String profileImgUrl, nickName, contentText;

  CardNewsCommentModel(this.profileImgUrl, this.nickName, this.contentText);
}
