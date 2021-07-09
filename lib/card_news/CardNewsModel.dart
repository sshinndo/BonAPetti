import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';

class CardNewsModel {
  CardNewsType type;
  String imgUrl, title;
  DateTime? startDate, endDate;

  // 연관 상품 리스트 추가 예정
  List<DetailCardNewsModel>? detailCardNewsModelList;

  List<CardNewsCommentModel>? cardNewsCommentList;

  CardNewsModel(this.type, this.imgUrl, this.title, this.startDate,
      this.endDate, this.detailCardNewsModelList, this.cardNewsCommentList);
}

class CardNewsCommentModel {
  String profileImgUrl, nickName, contentText;

  CardNewsCommentModel(this.profileImgUrl, this.nickName, this.contentText);
}

enum CardNewsType { ALL, CARDNEWS, EVENT, TOPPET }
