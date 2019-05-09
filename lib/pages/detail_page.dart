import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text('标题123456'),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getSwiperList(),
            _getAuthor(),
            _getBottomLine(),
            _getContent(),
            _getBottomLine(),
            _getTotalComment(),
            _getPreComment(),
            _getAllComments(),
            _openComments(),
            _getRecommends(),
          ],
        ),
      )),
    );
  }

  Widget _getRecommends() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),

      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 10),
            child: Text('相关推荐', style: TextStyle(fontSize: ScreenUtil().setSp(24)),),
          ),

          Container(
            child: GridView.count(
              shrinkWrap: true,
                mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: ScrollPhysics(),
              childAspectRatio: 55/100,
              crossAxisCount: 2,
              children: <Widget>[
                _getItem(),
                _getItem(),
                _getItem(),
                _getItem(),
                _getItem(),
                _getItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getImage() {
    return Container(
      height: ScreenUtil().setHeight(420),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage("http://ci.xiaohongshu.com/b626f941-036d-5dd8-9413-5e659cb93993"),
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

          Icon(Icons.favorite_border, size: 16,),
          Text('127')
        ],
      ),
    );
  }

  Widget _getItem() {
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

  // 展示8条评论
  Widget _getAllComments() {
    return ListView.builder(
        shrinkWrap: true, // 设置自适应高度，否则报错
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
//        itemExtent: 50, // 强制高度
        itemBuilder: (BuildContext context, int index) {
          return _getComments();
        });
  }

  // 展开评论
  Widget _openComments() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(

          border: Border(
          top: BorderSide(width: 1,color: Colors.grey[200]),
        )
      ),
      height: ScreenUtil().setHeight(66),
      child: Text('展开20条评论', style: TextStyle(
        color: Colors.blueAccent
      ),),
    );
  }

  // 点击发表评论
  Widget _getPreComment() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(60),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.only(bottom: 12),
            width: ScreenUtil().setWidth(580),
            child: Text('说点什么...'),
          ),
        ],
      ),
    );
  }

  // 文章内容
  Widget _getContent() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Text(
        '最爱的一家手作 表皮满满的白芝麻又酥又香  咸香的肉松和软糯的麻薯与香甜的豆沙/紫薯/绿豆泥完美的融合 口感特别丰富',
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  // 评论统计说明
  Widget _getTotalComment() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10, left: 20, bottom: 12),
      child: Text(
        '共16条评论',
        style: TextStyle(fontSize: ScreenUtil().setSp(24)),
      ),
    );
  }

  // 单条评论
  Widget _getComments() {
    return Container(

      margin: EdgeInsets.only(left: 20, top: 2, bottom: 0, right: 0),
      padding: EdgeInsets.only(right: 0, bottom: 0),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(60),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1,color: Colors.grey[200]),
                )
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10, right: 0),
            padding: EdgeInsets.only(bottom: 10, right: 0,top: 10),
            width: ScreenUtil().setWidth(630),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(550),
                      padding: EdgeInsets.only(left: 0),
                      child: Text('用户名'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(),
                      width: ScreenUtil().setWidth(80),
                      height: ScreenUtil().setWidth(60),
                      child: IconButton(
                        iconSize: 18,
                        padding: EdgeInsets.only(
                            left: 0, right: 0, bottom: 4, top: 4),
                        icon: Icon(Icons.favorite_border),
                        alignment: Alignment.center,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(550),
                      child: Text('评论内容'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(80),
                      child: Text('5'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 底部横线
  Widget _getBottomLine() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[200]))),
    );
  }

  //轮播
  Widget _getSwiperList() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(600),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3932546523,304539533&fm=26&gp=0.jpg",
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        pagination: new SwiperPagination(),
//        control: new SwiperControl(),
      ),
    );
  }

  // 作者信息
  Widget _getAuthor() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(80),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            width: ScreenUtil().setWidth(470),
            child: Text(
              '作者姓名姓名不知道',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(30),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Chip(
                avatar: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.pink,
                label: Text(
                  '关注',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
