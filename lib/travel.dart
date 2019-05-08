import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './detail_page.dart';

class TravelPage extends StatelessWidget {
  List posts = [
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
    {
      'imageUrl': 'http://ci.xiaohongshu.com/c04a2a8f-0d57-5197-9c88-37110a95400e',
      'title': '酸奶蒸蛋糕',
      'author': '夜来香',
      'avatar': 'https://img.xiaohongshu.com/avatar/5adea86c14de417f890ad7f6.jpg@80w_80h_90q_1e_1c_1x.jpg',
      'likes' : '127'
    },
  ];

  Widget _gridItemBuild(BuildContext context,index) {
    return Expanded(
        child:Column(
          children: <Widget>[
            Container(
              child: Image.network(
                posts[index]['imageUrl'],
                fit: BoxFit.cover,
              ),
              height: 500,
              margin: EdgeInsets.only(bottom: 10),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 10,bottom: 6),
              child: Text(posts[index]['title'], maxLines: 2, overflow: TextOverflow.ellipsis,),
            ),
          ],
        )
    );
  }

  Widget _getImage() {
    return Container(
      width: ScreenUtil().setWidth(350),
      height: ScreenUtil().setHeight(420),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage("http://ci.xiaohongshu.com/587ea6c3-9a8d-5609-8e86-759c78948222"),
            fit: BoxFit.cover
        ),
      ),
    );

  }

  Widget _getTitle() {
    return Container(
      margin: EdgeInsets.only(top:10,bottom: 10),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        '酸奶蒸蛋糕',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            fontWeight: FontWeight.bold
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getUser(){
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            foregroundColor: Colors.white,
            backgroundImage: NetworkImage("https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
          ),
          Container(
            width: ScreenUtil().setWidth(170),
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Text('夜来香', style: TextStyle(),maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),

          Icon(Icons.favorite_border, size: 16,),
          Text('127')
        ],
      ),
    );
  }

  Widget _getItem(BuildContext context,index) {
    return InkWell(
      onTap: (){},
      child: Container(
          margin: EdgeInsets.only(top: 10, left: 10, bottom: 10,right: 10),
//        width: ScreenUtil().setWidth(360),
//        height: ScreenUtil().setHeight(600),
          decoration: BoxDecoration(
//          border: Border.all(width: 1, color: Colors.black26),
          ),
          child: Column(
            children: <Widget>[
              _getImage(),
              _getTitle(),
              _getUser(),
            ],
          )
      ),
    );
  }

  Widget _getItem2(context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return DetailPage();
        }));
      },
      child: Container(
          margin: EdgeInsets.only(top: 10, left: 8, bottom: 0),
          width: ScreenUtil().setWidth(350),
          height: ScreenUtil().setHeight(560),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            //border: Border.all(width: 1, color: Colors.black26),
          ),
          child: Column(
            children: <Widget>[
              _getImage(),
              _getTitle(),
              _getUser(),
            ],
          )
      ),
    );
  }

  Widget _getWrapList(context) {
    return Wrap(
        spacing: 2,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(10, (index) {
          return _getItem2(context);
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: new PageStorageKey('travel'),
      color: Color.fromRGBO(240, 240, 240, 1),
      child: ListView(
        children: <Widget>[
          _getWrapList(context),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
