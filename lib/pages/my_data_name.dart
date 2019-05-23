import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDataName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改名字'),
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
              child: Text('请设置2-24个字符，不包括@<>/等无效字符'),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                maxLength: 24,
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
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
