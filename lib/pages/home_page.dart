import 'package:flutter/material.dart';
import 'package:xiaohongshu/pages/food_page.dart';
import 'package:xiaohongshu/pages/travel_page.dart';
import 'package:xiaohongshu/pages/add_page.dart';
import 'package:xiaohongshu/pages/house_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaohongshu/pages/my_drawer.dart';
import 'package:xiaohongshu/pages/search_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new  GlobalKey();

//  @override
//  void dispose() {
//    _tabController.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Container(
              child:CircleAvatar(
                radius: 20,
                backgroundImage:NetworkImage(
                  'https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg',
//                  scale: 0.4,
                ),
            ),
          ),
          ),
          centerTitle: true,
          title: Text('小粉记'),
          bottom: TabBar(
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: '旅行',
                ),
                Tab(
                  text: '美食',
                ),
                Tab(
                  text: '居家',
                ),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {
                // 搜索页
                //showSearch(context: context, delegate: SearchBar());
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context)=> SearchPage()));

              },
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            TravelPage(),
            FoodPage(),
            HousePage()
          ],
        ),
        drawer: Container(
          width: ScreenUtil().setWidth(500),
          child: MyDrawer(),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return AddPage();
            }));
          },
          child: Icon(Icons.add),
          tooltip: '发布',
          isExtended:true,
        ),
      ),
    );
  }
}
