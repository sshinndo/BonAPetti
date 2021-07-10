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
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context , null);
          },
        ),
        title: Text(
          '장바구니 ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
        elevation: 0,
      ),

      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(32)),
          Container(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.only(left: 30,right: 30),
              child: SizedBox(
                height: 50,
                width: 100,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchRoute()));
                  },
                  child: Container(
                    color: Color.fromRGBO(254, 254, 254, 1),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Icon(Icons.search,size: 30,color: Color.fromRGBO(217, 217, 217, 1),),
                        ImageIcon(AssetImage('images/barbar.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
