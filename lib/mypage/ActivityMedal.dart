import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_service_application/appbar/AppBarWithAlarm.dart';
import 'package:pet_service_application/bottombar/MenuBottomBar.dart';
import 'package:pet_service_application/init_profile/ProfileQuestion.dart';
import 'package:pet_service_application/log_in/UserInfoClass.dart';

// 활동메달(메달목록) 페이지
class ActivityMedal extends StatefulWidget {
  const ActivityMedal({Key? key}) : super(key: key);

  @override
  _ActivityMedalState createState() => _ActivityMedalState();
}

class _ActivityMedalState extends State<ActivityMedal> {
  final List<String> items = List.generate(20, (i) {
    return 'I am ${i}th child of gridview';
  });

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("He'd have you all unravel at the"),
                  color: Colors.teal[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Heed not the rabble'),
                  color: Colors.teal[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.teal[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.teal[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution is coming...'),
                  color: Colors.teal[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.teal[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //     floatingActionButton: BackSpaceButton(),
    //     floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    //     body: Column(children: [
    //       AppBarWithAlarm(nickName: "활동메달"),
    //       GridView.builder(
    //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 150,
    //           mainAxisSpacing: 10.0,
    //           crossAxisSpacing: 10.0,
    //           childAspectRatio: 3 / 2,
    //         ),
    //         itemCount: items.length,
    //         itemBuilder: (context, i){
    //           return Container(
    //             decoration: BoxDecoration(
    //               color: GREY,
    //               borderRadius: BorderRadius.circular(10.0),
    //             ),
    //             child: GridTile(
    //               child: Center(
    //                 child: Text(items[i]),
    //               ),
    //             ),
    //             );
    //         }
    //       ),
    //     ]
    //     )
    // );
  }
}