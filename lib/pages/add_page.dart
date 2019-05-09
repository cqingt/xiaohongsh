import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('标记我的生活'),
          centerTitle: true,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                height: ScreenUtil().setHeight(80),
                alignment: Alignment.center,
                child: InkWell(
                  child: Text(
                    '发布',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                  ),
                  onTap: () {},
                ))
          ],
        ),
        body: SingleChildScrollView(
          // 避免键盘被遮挡
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _imageList(),
                _getTitle(),
                _getContent(),
                _getCategory(),
              ],
            ),
          ),
        ));
  }

  Widget _getCategory() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: ScreenUtil().setHeight(50),
      child: Row(
        children: <Widget>[
          Container(
            child: Text('标签：'),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: FilterChip(label: Text('旅行'), onSelected: (bool value) {}),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: FilterChip(label: Text('美食'), onSelected: (bool value) {}),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child:  FilterChip(label: Text('家居'), onSelected: (bool value) {}),
          ),
        ],
      ),
    );
  }

  Widget _imageList() {
    return Wrap(
      children: <Widget>[
        Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(180),
            margin: EdgeInsets.only(right: 10, bottom: 10),
            child: Icon(
              Icons.add,
              color: Colors.grey[300],
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(6))),
        Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(180),
            margin: EdgeInsets.only(right: 10, bottom: 10),
            child: Icon(
              Icons.add,
              color: Colors.grey[300],
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(6))),
        Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(180),
            margin: EdgeInsets.only(right: 10, bottom: 10),
            child: Icon(
              Icons.add,
              color: Colors.grey[300],
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(6))),
      ],
    );
  }

  Widget _getTitle() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: '输入标题',
        ),
      ),
    );
  }

  Widget _getContent() {
    return Container(
      child: TextField(
        maxLines: 8, // 显示行数
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: '输入内容',
//          contentPadding: EdgeInsets.symmetric(vertical: 40)
        ),
      ),
    );
  }
}
