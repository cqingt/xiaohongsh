import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResult extends StatelessWidget {
  String query;
  SearchResult(@required this.query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, // 状态栏字体颜色，dart白色，light 黑色
        backgroundColor: Colors.pink,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: ScreenUtil().setSp(42),
          ),
        ),
        elevation: 0,
        titleSpacing: 0,
        title: _searchInputWidget(context),
      ),
      body: _bodyWidget(),
    );
  }

  // 搜索框
  Widget _searchInputWidget(context) {
    return Container(
      height: 34,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(right: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Color.fromRGBO(51, 51, 51, 1),
                size: 20,
              ),
              Text(
                query,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                )
              ),
            ],
          ))
    );
  }

  Widget _bodyWidget() {
    return Container(
          padding: EdgeInsets.only(left: 6,right: 6, top: 10),
          color: Color.fromRGBO(240, 240, 240, 1),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing:8,
                childAspectRatio: 55/100 // 宽高设置
            ),
            itemBuilder: _getItem,
          )
    );
  }

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
}
