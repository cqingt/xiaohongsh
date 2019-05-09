import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("liuan"),
            floating: true,
            // 新写一个面板跟随下滑显示 上滑消失 并伴随渐变动画
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "liuan".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                background: Image.network(
                  "https://upload-images.jianshu.io/upload_images/3884536-5441e5f385431f2b.png",
                  fit: BoxFit.cover,
                )
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 14.0,
                shadowColor: Colors.green.withOpacity(0.5),
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        "https://upload-images.jianshu.io/upload_images/3884536-5441e5f385431f2b.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "在He是标题啊",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.greenAccent),
                          ),
                          Text(
                            "作者",
                            style: TextStyle(
                                fontSize: 23.0, color: Colors.greenAccent),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        childCount: 1,
      ),
    );
  }
}