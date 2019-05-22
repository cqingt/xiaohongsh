import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavorites extends StatelessWidget {

  Widget _getImage() {
    return Container(
      height: ScreenUtil().setHeight(420),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage("http://ci.xiaohongshu.com/ff6bc26c-8317-5646-9dcb-8ca16080a1da"),
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
            child: Text('夜来香叶', style: TextStyle(),maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),

          Icon(Icons.favorite, size: 16, color: Colors.pink,),
          Text('127')
        ],
      ),
    );
  }

  Widget _getItem(BuildContext context,index) {
    return InkWell(
      onTap: (){},
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的收藏'),centerTitle: true,),
      body: Container(
          padding: EdgeInsets.only(left: 6,right: 6, top: 10),
          color: Color.fromRGBO(240, 240, 240, 1),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing:8,
                childAspectRatio: 55/100 // 宽高设置
//            childAspectRatio: 3/4
            ),
            itemBuilder: _getItem,
          )
      ),
    );
  }
}