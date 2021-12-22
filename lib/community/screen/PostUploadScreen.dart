import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_service_application/class/colorCustomClass.dart';
import 'package:pet_service_application/community/screen/MyCommunityScreen.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';

import '../CommunityInfo.dart';

class PostUploadScreen extends StatefulWidget {
  const PostUploadScreen({Key? key}) : super(key: key);

  @override
  _PostUploadScreenState createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  CommunityInfo newPostData = CommunityInfo();
  List<PickedFile> newImages = [];
  static const double subtitleFontSize = 15;
  static const double hashTagFontSize = 15;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _hastTagController = TextEditingController();
  //TextEditingController _goodsNameController = TextEditingController();

  @override
  void initState() {
    newPostData.user = Logger().userData;
    if (Logger()
        .getDefaultPet()
        .petName != '...')
      newPostData.pet = Logger().getDefaultPet();
    newPostData.isLike = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarWithAlarm(nickName: Logger().userData.name),///알림바
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: height * 0.15,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: SvgPicture.asset(
                              'images/community/getImage_icon.svg',
                              fit: BoxFit.cover,
                            ),
                            onTap: getImageFromGallery
                        ),///사진 추가하기 버튼
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        newImages.length > 0 ? Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: newImages.length,
                              itemBuilder: (BuildContext context, int index) {
                                return  GestureDetector(
                                  onDoubleTap: () {
                                    setState(() {
                                      debugPrint('Remove $index Image');
                                      newImages.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                      child: Image.file(
                                          File(newImages[index].path),
                                          fit: BoxFit.cover
                                      )),
                                );
                              }
                          ),
                        ) : Text(
                          ' 이미지 추가하기 (이미지 삭제는 더블클릭)',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: subtitleFontSize,
                          ),
                        ),///상세 설명 타이틀(띄어쓰기로 임시로 맞춤)
                      ],
                    )
                ),///추가할 사진 리스트
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      Text(
                        '   상세설명',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),///상세 설명 타이틀(띄어쓰기로 임시로 맞춤)
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Card(
                        elevation: 5.0, // 카드박스 그림자 음영
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          height: height * 0.3,
                          padding: EdgeInsets.only(left: 20),
                          child: TextFormField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: '내용을 입력하세요',
                                  hintStyle: TextStyle(color: Colors.grey)),
                              cursorColor: Colors.grey,
                          ),
                        ),
                      ),///내용 입력 상자
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      Text(
                        '   키워드태그',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: subtitleFontSize,
                            fontWeight: FontWeight.bold
                        ),
                      ),///해시태그 타이틀(띄어쓰기로 임시로 맞춤)
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Card(
                        elevation: 5.0, // 카드박스 그림자 음영
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          //height: height * 0.1,
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _hastTagController,
                            style: TextStyle(color: Colors.blueAccent,fontSize: hashTagFontSize),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '# + 해시태그',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: hashTagFontSize))
                          )
                        ),
                      ),///해시태그 상자
                    ],
                  )
                ),///내용 입력
                ///상품 태그 (미구현)
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                      child: Text('포스트 업로드'),
                      style: ElevatedButton.styleFrom(
                          primary: PINK,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 14
                            //fontWeight: FontWeight.bold
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))),

                      onPressed: () {
                        if(_descriptionController.text != '') { //내용 입력시에만 전송
                          CommunityInfo newPostData = CommunityInfo();
                          ///새 포스트 데이터 생성 및 값 입력
                          newPostData.user = Logger().userData;
                          newPostData.pet = Logger().getDefaultPet();
                          newPostData.hashTags = _hastTagController.text;
                          newPostData.dialogue.addAll(_descriptionController.text.split('\n'));
                          ///포스트 데이터 서버로 전송 (이미지 제외)
                          newPostData.sendPostData().then((newPostID) {
                            Logger().userData.posts.add(newPostID);
                            Logger().updateUserData();
                            //전송 완료 후 이미지 업로드
                          uploadImages(newPostID).then((value) {
                            //이미지 업로드 후 포스트 데이터에 이미지 추가 후 서버로 수정
                              for(int i = 0; i<newImages.length;i++) {
                                newPostData.imageUrls.add(newPostData.postID+'_'+i.toString());
                              }
                              newPostData.updatePostData();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyCommunityScreen()),
                                      (route) => false);
                            });
                          });
                        }

                      }),
                ),///포스트 업로드 버튼
                Padding(padding: EdgeInsets.symmetric(vertical: 20))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: BackSpaceButton(),
      bottomNavigationBar: MenuBottomBar(),
    );
  }

  Future<void> uploadImages(String postID) async {
    if(postID == '') {
      throw Exception('Non-Exist postID Input');
      }
    for(int i = 0; i<newImages.length;i++) {
      try {
        await FirebaseStorage.instance
            .ref('Community/posts/${postID+'_'+i.toString()}')
            .putFile(File(newImages[i].path));
      }
      catch(e) {
        throw Exception(e);
      }
    }
  }

  Future<void> getImageFromGallery() async {
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.gallery);
    setState(() {
      debugPrint('Add Image');
      newImages.add(image!);
    });
  }
}

