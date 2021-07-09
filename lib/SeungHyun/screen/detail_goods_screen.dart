import 'package:flutter/material.dart';
import 'package:pet_service_application/appbar/DrawerWithAlarmAppBar.dart';
import 'package:pet_service_application/SeungHyun/screen/search_screen.dart';

class DetailedGoodsScreen extends StatefulWidget {
  @override
  _DetailedGoodsScreen createState() => _DetailedGoodsScreen();
}

class _DetailedGoodsScreen extends State<DetailedGoodsScreen>{
  @override

  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: (){Navigator.pop(context,null);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            Text('닉네임', style: TextStyle(color: Colors.black),),
            Icon(Icons.alarm,color: Colors.black,),
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),

      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(32)),
          RaisedButton.icon(
            onPressed: (){
              /*
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchRoute()));

               */
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text('상품 검색',
              style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.search, color:Colors.white,),
            textColor: Colors.white,
            splashColor: Colors.red,
            color: Colors.green,),
          Padding(padding: EdgeInsets.all(32)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('맛있는 개껌',style: TextStyle(fontSize: 32),),
              ],
            )
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('images/goodstestimage.png'),
          ),
        ],
      ),
    );
  }

}
