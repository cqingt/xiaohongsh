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
        child: Column(
          children: <Widget>[
            _getSwiperList(),
            _getAuthor(),
            _getBottomLine(),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Text(
                '最爱的一家手作 表皮满满的白芝麻又酥又香  咸香的肉松和软糯的麻薯与香甜的豆沙/紫薯/绿豆泥完美的融合 口感特别丰富',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            _getBottomLine(),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 20, bottom: 12),
              child: Text(
                '共16条评论',
                style: TextStyle(fontSize: ScreenUtil().setSp(24)),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20,bottom: 20),
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
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1,color: Colors.grey[200])
                      )
                    ),
                  ),
                ],
              ),
            ),

            _getComments(),
          ],
        ),
      ),
    );
  }

  Widget _getComments() {
    return Container(
        color: Colors.grey,
          margin: EdgeInsets.only(left: 20,bottom: 10, top: 12,right: 10),
          padding: EdgeInsets.only(right: 0),
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(bottom:8),
                width: ScreenUtil().setWidth(600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(520),
                          color: Colors.red,
                          padding: EdgeInsets.only(left: 0),
                          child: Text('用户名'),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(),
                          color: Colors.green,
                          width: ScreenUtil().setWidth(80),
                          child: IconButton(
                            iconSize: 18,
                            padding: EdgeInsets.only(left: 0,right: 0,bottom: 4,top: 4),
                            icon: Icon(Icons.favorite_border),
                            alignment: Alignment.centerRight,
                            onPressed: (){},
                          ),
                        ),

                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.green,
                          width: ScreenUtil().setWidth(520),
                          child: Text('评论内容'),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          width:ScreenUtil().setWidth(80),
                          child: Text('5'),
                        ),


                      ],
                    ),


                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1,color: Colors.grey[200])
                    )
                ),
              ),
            ],
          ),
        );
  }

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
