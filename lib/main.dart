import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/GoodsInfo.dart';
import 'package:pet_service_application/widgets/GoodsWidget.dart';
import 'package:pet_service_application/widgets/BargainCardWidget.dart';
import 'package:pet_service_application/SeungHyun/screen/DetailedGoodsScreen.dart';
import 'package:pet_service_application/card_news/CardNewsModel.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/card_news/detail/DetailCardNews.dart';
import 'package:pet_service_application/community/screen/CommunityMainScreen.dart';
import 'package:pet_service_application/log_in/LogIn.dart';
import 'package:pet_service_application/log_in/Splash.dart';
import 'package:pet_service_application/route/CardNewsListRoute.dart';
import 'package:pet_service_application/card_news/CardNewsPageView.dart';

import 'package:pet_service_application/SeungHyun/screen/search_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/goods_screen.dart';
import 'package:pet_service_application/SeungHyun/screen/WishListScreen.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';
import 'package:pet_service_application/widgets/ShortsWidget.dart';
import 'package:pet_service_application/community/ShortsInfo.dart';
import 'drawer/MainDrawer.dart';

void main() => runApp(MyApp());

final String appName = "Pet App";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<CardNewsModel> cardNewsModelList = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadData();
  }

  void loadData() {
    // 남아있는 데이터 모두 제거
    widget.cardNewsModelList.clear();

    // 서버에서 데이터 불러오고 cardNewsModelList에 추가
    // 현재는 더미데이터
    /*
    CardNewsModel _cardNewsEventItem = CardNewsModel(
        CardNewsType.CARDNEWS,
        'https://picsum.photos/250?image=9',
        "과연 고양이는 생선만\n먹어도 괜찮을까?",
        null,
        null,
        List.filled(
            5,
            DetailCardNewsModel('https://picsum.photos/250?image=9',
                "과연 고양이는 생선만\n먹어도 괜찮을까? 2")),
        List.filled(
            4,
            GoodsInfo(
                '피부모질 닥터독 사료 2kg',
                'imgUrl',
                29500,
                null,
                GoodsDetailedInfo(
                    ['imgUrl', 'imgUrl'],
                    false,
                    ['쌀', '대두', '연어'],
                    [
                      Ingredient('조단백질', 77),
                      Ingredient('조지방', 19),
                      Ingredient('칼슘', 2),
                      Ingredient('인', 1),
                      Ingredient('비타민 A', null),
                      Ingredient('비타민 E', null),
                      Ingredient('비타민 D3', null),
                    ],
                    'bannerUrl'))),
        null);*/
    //for (int i = 0; i < 10; i++)
    //  widget.cardNewsModelList.add(_cardNewsEventItem);
    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/004.png',
          '고양이는 생선만\n먹어도 될까?',
          null,
          null,
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            GoodsInfo(
              '순수 도그온',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
              67000,
              34000,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
            ),
            GoodsInfo(
              '유기농 개사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
              15000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
            ),
            GoodsInfo(
              '훈제 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
              32000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
            ),
            GoodsInfo(
              '닭고기맛 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
              25000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
            ),
          ],
          null),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/016.png',
          '강아지는 하루에\n몇시간을 잘까?',
          null,
          null,
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            GoodsInfo(
              '순수 도그온',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
              67000,
              34000,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
            ),
            GoodsInfo(
              '유기농 개사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
              15000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
            ),
            GoodsInfo(
              '훈제 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
              32000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
            ),
            GoodsInfo(
              '닭고기맛 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
              25000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
            ),
          ],
          null),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/018.png',
          '왜 강아지의 코는\n촉촉할까?',
          null,
          null,
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            GoodsInfo(
              '순수 도그온',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
              67000,
              34000,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
            ),
            GoodsInfo(
              '유기농 개사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
              15000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
            ),
            GoodsInfo(
              '훈제 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
              32000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
            ),
            GoodsInfo(
              '닭고기맛 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
              25000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
            ),
          ],
          null),
    );

    widget.cardNewsModelList.add(
      CardNewsModel(
          CardNewsType.CARDNEWS,
          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/020.png',
          '강아지가 자기 발을\n핥는 이유는?',
          null,
          null,
          [
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/006.png',
                '고양이에게 생선을\n주식으로 주는 것은\n피해야 합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/008.png',
                '고등어, 전갱이, 정어리처럼\n등푸른 생선이 가진 불포화 지방산을\n고양이가 과다 섭취한다면'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/010.png',
                '예로우 펫 증후군과 같은 질병에\n걸리기 쉽기 떄문입니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/012.png',
                '예로우 펫 증후군은\n고양이의 하복부에 응어리를 만들어\n수의사의 진료가 필요합니다'),
            DetailCardNewsModel(
                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/Card_News/014.png',
                '아이가 물고기를 좋아한다고 해도\n균형잡힌 식사를 할 수 있도록\n도와주세요!'),
          ],
          [
            GoodsInfo(
              '순수 도그온',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
              67000,
              34000,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
            ),
            GoodsInfo(
              '유기농 개사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
              15000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
            ),
            GoodsInfo(
              '훈제 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
              32000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
            ),
            GoodsInfo(
              '닭고기맛 사료',
              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
              25000,
              null,
              GoodsDetailedInfo(
                  [
                    'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                  ],
                  false,
                  ['쌀', '대두', '연어'],
                  [
                    Ingredient('조지방', 77),
                    Ingredient('조단백질', 19),
                    Ingredient('칼슘', 2),
                    Ingredient('인', 1),
                    Ingredient('비타민 A', null),
                    Ingredient('비타민 E', null),
                    Ingredient('비타민 D3', null),
                  ],
                  'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
            ),
          ],
          null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Column 기준 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // Row 기준 정렬
        children: <Widget>[
          AppBarWithAlarm(nickName: UserInfo.userNickname),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardNewsListRoute(
                                  cardNewsModelList: widget.cardNewsModelList)),
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("더보기 >",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                        margin: EdgeInsets.only(
                            top: 20.0, bottom: 20, left: 20, right: 50))),
                //더보기
                Container(
                    height: 300,
                    child: CardNewsPageView(
                        cardNewsModelList: widget.cardNewsModelList)),
                // 여기부분 부터 합치면 됩니다
                //검색 창 그림만들기 -> 클릭하면 다른 라우터로 이동합니다.
                // Expand 필요할 수도 있음
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchRoute()));
                    },
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.only(left: 50, top: 20, right: 50),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Color.fromRGBO(254, 254, 254, 1),
                          child: Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(
                                Icons.search,
                                size: 30,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                              //ImageIcon(AssetImage('images/barbar.png')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //검색창
                Container(
                  margin: EdgeInsets.only(left: 50, top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '오늘 당신과 함께하는',
                        style: TextStyle(fontSize: 32),
                      ),  //당신과 함께하는
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                PetInfo.petName,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 113, 113, 1),
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 2.0,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '를 위한',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ), //를 위한
                            ],
                          )
                      ),  //[petName]을 위한
                      Text(
                        '건강식단',
                        style: TextStyle(fontSize: 32),
                      ),  //건강식단
                    ],
                  ),
                ),    //사료 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoodsScreen([
                                    GoodsInfo(
                                      '닭고기맛 사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                                      25000,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
                                    ), //닭고기맛사료
                                    GoodsInfo(
                                      '훈제 사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                                      32000,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
                                    ), //훈제 사료
                                    GoodsInfo(
                                      '유기농 개사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                                      15000,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
                                    ), //유기농 개사료
                                    GoodsInfo(
                                      '순수 도그온',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                                      67000,
                                      34000,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
                                    ), //순수 도그온
                                  ])), //사료 정보들
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //사료 더보기
                Container(
                  height: 500,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    children: [
                      GoodsCardWidget(
                        goodsInfo: GoodsInfo(
                          '닭고기맛 사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                          25000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
                        ),
                      ), //닭고기맛 사료 카드
                      GoodsCardWidget(
                        goodsInfo: GoodsInfo(
                          '훈제 사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                          32000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
                        ),
                      ), //훈제 사료 카드
                      GoodsCardWidget(
                        goodsInfo: GoodsInfo(
                          '유기농 개사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                          15000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
                        ),
                      ), //유기농 개사료 카드
                      GoodsCardWidget(
                        goodsInfo: GoodsInfo(
                          '순수 도그온',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                          67000,
                          34000,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
                        ),
                      ), //순수 도그온 카드
                    ],
                  ),
                ),
                //사료 카드

                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '당신과 함께하는',
                        style: TextStyle(fontSize: 32),
                      ), //당신과 함께하는
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            PetInfo.petName,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 113, 113, 1),
                                decoration: TextDecoration.underline,
                                letterSpacing: 2.0,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ), //펫 이름
                          Text(
                            '를 위한',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ), //를 위한
                        ],
                      )), //PetName를 위한
                      Text(
                        '나눔!',
                        style: TextStyle(fontSize: 32),
                      ), //나눔!
                    ],
                  ), //문장 한줄씩 수직 정렬
                ),
                //나눔 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoodsScreen([
                                    GoodsInfo(
                                      'ANF 6FREE PLUS 소고기연어 5.6kg 강아지사료, 1개',
                                      //'닭고기맛 사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                                      38550,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://thumbnail8.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/45bc/8fb74123b56f027538b4f8be789bd5fbc5ae8573a52dcbff8a806aa71d78.jpg',
                                            //'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
                                    ), //닭고기맛사료
                                    GoodsInfo(
                                      '훈제 사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                                      32000,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
                                    ), //훈제 사료
                                    GoodsInfo(
                                      '유기농 개사료',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                                      15000,
                                      null,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
                                    ), //유기농 개사료
                                    GoodsInfo(
                                      '순수 도그온',
                                      'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                                      67000,
                                      34000,
                                      GoodsDetailedInfo(
                                          [
                                            'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_four.png',
                                          ],
                                          false,
                                          ['쌀', '대두', '연어'],
                                          [
                                            Ingredient('조지방', 77),
                                            Ingredient('조단백질', 19),
                                            Ingredient('칼슘', 2),
                                            Ingredient('인', 1),
                                            Ingredient('비타민 A', null),
                                            Ingredient('비타민 E', null),
                                            Ingredient('비타민 D3', null),
                                          ],
                                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image4.png'),
                                    ), //순수 도그온
                                  ])), //사료 정보들
                        ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //나눔 더보기 (작업전 임시)
                Container(
                  height: 600,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 2.5,
                    children: [
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                          '닭고기맛 사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                          25000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_one.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image1.png'),
                        ),
                      ),  //닭고기맛 나눔 카드
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                          '훈제 사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                          32000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_two.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image2.png'),
                        ),
                      ),  //훈제 나눔 카드
                      BargainCardWidget(
                        goodsInfo: GoodsInfo(
                          '유기농 개사료',
                          'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                          15000,
                          null,
                          GoodsDetailedInfo(
                              [
                                'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/dog_food_three.png',
                              ],
                              false,
                              ['쌀', '대두', '연어'],
                              [
                                Ingredient('조지방', 77),
                                Ingredient('조단백질', 19),
                                Ingredient('칼슘', 2),
                                Ingredient('인', 1),
                                Ingredient('비타민 A', null),
                                Ingredient('비타민 E', null),
                                Ingredient('비타민 D3', null),
                              ],
                              'https://raw.githubusercontent.com/DragonTrainerTristana/Food_App_Project_Image_Asset/main/detailed_food_image/detail_food_image3.png'),
                        ),
                      ),  //유기농 개사료 나눔 카드
                    ],
                  ),
                ),
                //나눔 카드(조정 필요)

                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '건강한 식단과',
                        style: TextStyle(fontSize: 32),
                      ), //건강한 식단과
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '함께하는 ',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),  //함께하는
                              Text(
                                '친구들',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 113, 113, 1),
                                  decoration: TextDecoration.underline,
                                  //letterSpacing: 2.0,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                                ),
                              ),  //친구들
                            ],
                          )
                      ),  //함께하는 친구들
                    ],
                  ), //문장 한줄씩 수직 정렬
                ),
                //친구들 텍스트
                GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityMainScreen()),  //사료 정보들
                    ),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "더보기 >",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        margin: EdgeInsets.only(top: 15, right: 50))),
                //친구들 더보기 (작업전 임시)
                Container(
                  height: 400,
                  margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ShortsWidget(
                        shortsInfo: ShortsInfo(
                          'images/profile/profile_icon.png',
                          '돌돌이님',
                          '돌돌이님',
                          'images/shorts/shorts_thumb.png',
                          'images/shorts/shorts_thumb.png',
                          false
                        )
                      ),
                      ShortsWidget(
                          shortsInfo: ShortsInfo(
                              'images/profile/profile_icon.png',
                              '돌돌이님',
                              '돌돌이님',
                              'images/shorts/shorts_thumb.png',
                              'images/shorts/shorts_thumb.png',
                              false
                          )
                      ),
                      ShortsWidget(
                          shortsInfo: ShortsInfo(
                              'images/profile/profile_icon.png',
                              '돌돌이님',
                              '돌돌이님',
                              'images/shorts/shorts_thumb.png',
                              'images/shorts/shorts_thumb.png',
                              false
                          )
                      )
                    ],
                  )
                ),  //숏폼 카드
                Padding(padding: EdgeInsets.only(top: 52)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: MenuBottomBar(),
    );
  }
}
