class GoodsInfo {
  String name;
  String imgUrl;
  int price;
  int? discountedPrice;

  GoodsDetailedInfo detailedInfo;

  GoodsInfo(this.name, this.imgUrl, this.price, this.discountedPrice,
      this.detailedInfo);
}

class GoodsDetailedInfo {
  List<String> imageUrlList;
  bool isLike;

  List<String> allergyFactorList;
  List<Ingredient> ingredientList;
  String bannerUrl;

  GoodsDetailedInfo(this.imageUrlList, this.isLike, this.allergyFactorList,
      this.ingredientList, this.bannerUrl);
}

class Ingredient {
  String name;
  int? amount;

  Ingredient(this.name, this.amount);
}
