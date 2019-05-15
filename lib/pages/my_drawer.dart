import 'package:flutter/material.dart';
import 'login_page.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation:50,
      child:ListView(
        padding: EdgeInsets.zero, // 适配水滴屏、刘海屏等
        children: <Widget>[
          // 用户头像
          UserAccountsDrawerHeader(
            accountName: Text('小粉私'),
            accountEmail: Text('talk is cheap, show me code'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
          ),
          ListTile(
            title: Text('我的资料'),
            leading: Icon(Icons.settings, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的笔记'),
            leading: Icon(Icons.mode_edit, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的收藏'),
            leading: Icon(Icons.favorite, size: 22),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            title: Text('我的粉丝'),
            leading: Icon(Icons.people, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的关注'),
            leading: Icon(Icons.tag_faces, size: 22,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('退出'),
            leading: Icon(Icons.directions, size: 22,),
            onTap: () {
              Navigator.pop(context); // 对于在drawer中使用导航，需关闭drawer 再跳转，否则返回报错
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return LoginPage();
              }));
            }
          )
        ],
      )
    );
  }
}
