import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户名'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getHeader(),
            _getDescription(),
            Divider(
              height: 1,
            ),
            _getTabBar(),
            Divider(
              height: 1,
            ),
           Container(
             height: ScreenUtil().setHeight(830),
//             margin: EdgeInsets.only(bottom: 20),
             child: SingleChildScrollView(
               child: _getNotes(),
             )
           )
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(
                  'https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg'),
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _getDataItem(),
                      _getDataItem(),
                      _getDataItem(),
                    ],
                  ),
                ),
                ButtonTheme(
                  height: 20,
                  minWidth: 200,
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: StadiumBorder(
                        side: BorderSide(width: 0, color: Colors.grey[400])),
                    child: Text(
                      '关注',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _getDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Text(
        '美食源于生活，热爱生活中一切美的事物，所有作品均为原创，拒绝转载！欢迎给我留言!!',
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _getDataItem() {
    return Column(
      children: <Widget>[
        Text('23'),
        Text('关注'),
      ],
    );
  }

  Widget _getTabBar() {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: InkWell(
          onTap: () {},
          child: Text('Ta的笔记'),
        ));
  }

  Widget _getNotes() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 20,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 55 / 100,
        ),
        itemBuilder: _getNoteItem
      ),
    );
  }

  Widget _getNoteItem(BuildContext context, index) {
    return InkWell(
      onTap: () {},
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
          )),
    );
  }

  Widget _getImage() {
    return Container(
      height: ScreenUtil().setHeight(420),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(
                "http://ci.xiaohongshu.com/b626f941-036d-5dd8-9413-5e659cb93993"),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _getTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        '酸奶蒸蛋糕',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.bold),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getUser() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            foregroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
          ),
          Container(
            width: ScreenUtil().setWidth(170),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              '夜来香叶',
              style: TextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.favorite_border,
            size: 16,
          ),
          Text('127')
        ],
      ),
    );
  }
}
