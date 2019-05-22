import 'package:flutter/material.dart';
import 'user_center.dart';

// 我的关注
class MyFans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的粉丝'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return UserCenter();
                  }));
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 45,
                      height:45,
                      margin: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            child: Text('用户名', style: TextStyle(color: Colors.black54),),
                            padding: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                            child: Text('166个笔记  7.2万个粉丝', style: TextStyle(color: Colors.black54),),
                          ),
                        ],
                      ),
                    ),
                    Text('2018.09.09 13:30', style: TextStyle(color: Colors.black54),)
//
                  ],
                ),
              )
            ),

            Divider(height: 1,)
          ],
        ),
      ),
    );
  }
}
