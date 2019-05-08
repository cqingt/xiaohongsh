import 'package:flutter/material.dart';
import './food.dart';
import './travel.dart';
import './house.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './my_drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new  GlobalKey();

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
//          leading: IconButton(
//              icon: Icon(Icons.account_circle),
//              onPressed: (){
//                _scaffoldKey.currentState.openDrawer();
//              }
//          ),
          centerTitle: true,
          title: Text('小粉记'),
          bottom: TabBar(
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
//                  icon: Icon(Icons.location_city),
                  text: '旅行',
                ),
                Tab(
//                  icon: Icon(Icons.restaurant_menu),
                  text: '美食',
                ),
                Tab(
//                  icon: Icon(Icons.local_hotel),
                  text: '居家',
                ),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {
                print('search>>>>>>>>>>>>>>>>>');
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
      ),
    );
  }
}
