import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './member_page.dart';
import './home_page.dart';
import 'package:provide/provide.dart';
import './provide/current_index.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text( '首页'),
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text( '我的'),
    )
  ];

  // 页面数组
  final List<Widget> tabBodies = [
    HomePage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;

        return Scaffold(
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              onPressed: (){},
              child: Icon(Icons.add),
              tooltip: '发布',
              isExtended:true,
            ),
//            bottomNavigationBar: BottomNavigationBar(
//              type: BottomNavigationBarType.fixed,
//              fixedColor: Colors.black,
//              currentIndex: currentIndex,
//              items: bottomTabs,
//              onTap: (index) {
//                Provide.value<CurrentIndexProvide>(context).changeCurrentIndex(index);
//              },
//            ),
            body: HomePage(),
//            body: IndexedStack(
//              children: tabBodies,
//              index: currentIndex,
//            )
        );
      },
    );
  }
}
