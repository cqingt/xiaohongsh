import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDataEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个性签名'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Text('完成'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
              child: Text('有趣的个人介绍会吸引更多的粉丝哦^_^'),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              height: ScreenUtil().setHeight(300),
              child: TextField(
                autofocus: true,
                maxLength: 100,
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
