import 'package:flutter/material.dart';

class MyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人资料'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getAvatar(),
            Divider(height: 1,),

            _getItem('名字', '我的名字'),
            Divider(height: 1,),

            _getItem('性别', '男'),
            Divider(height: 1,),

            _getItem('常住地', '福建泉州'),
            Divider(height: 1,),

            _getItem('生日', '1999-09-09'),
            Divider(height: 1,),

            _getItem('个性签名', '我是小红书的模仿着，在我看来，小红书越来越黄了。真的，可以这样吗'),
            Divider(height: 1,),
          ],
        ),
      ),
    );
  }

  Widget _getAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height:60,
          margin: EdgeInsets.only(top: 15,left: 10,bottom: 15),
          child:CircleAvatar(
            radius: 20,
            backgroundImage:NetworkImage(
              'https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg',
            ),
          ),
        ),

        Expanded(
            child: Padding(
              child: Text('修改头像', style: TextStyle(color: Colors.grey),),
              padding: EdgeInsets.only(left: 40),
            )
        ),

        Icon(Icons.chevron_right, color: Colors.grey,),

      ],
    );
  }

  Widget _getItem(String lable, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 80,
          margin: EdgeInsets.only(top: 15,left: 10,bottom: 15),
          child: Text('$lable', style: TextStyle(color: Colors.grey),),
        ),

        Expanded(
            child: Padding(
              child: Text('$value', maxLines: 1, overflow: TextOverflow.ellipsis,),
              padding: EdgeInsets.only(left: 20),
            )
        ),

        Icon(Icons.chevron_right, color: Colors.grey,),

      ],
    );
  }
}
