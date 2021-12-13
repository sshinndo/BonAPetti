import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_service_application/log_in/class/UserData.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/widgets/CommunityWidget.dart';

import '../CommunityInfo.dart';

class PostUploadScreen extends StatefulWidget {
  const PostUploadScreen({Key? key}) : super(key: key);

  @override
  _PostUploadScreenState createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  CommunityInfo newPostData = CommunityInfo();
  List<PickedFile> newImages = [];

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
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        floatingActionButton: BackSpaceButton(),
        bottomNavigationBar: MenuBottomBar(),
        body: Row(
          children: [
            //AppBarWithAlarm(nickName: Logger().userData.name),
            Container(
              height: height * 0.1,
              child: Column(
                children: [
                  FloatingActionButton(
                    enableFeedback: true,
                    onPressed: getImageFromGallery,
                    tooltip: '이미지 불러오기',
                    child: SvgPicture.asset('images/community/getImage_icon.svg'),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: newImages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(File(newImages[index].path));
                      }
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  Future<void> getImageFromGallery() async {
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.gallery);
    setState(() {
      newImages.add(image!);
    });
  }
}

