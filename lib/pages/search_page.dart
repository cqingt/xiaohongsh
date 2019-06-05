import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:math' as math;
import 'search_result.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List hotWords = ['耐克', '李宁', '安踏', '361', 'puma', 'addidas', '锐步', '森马', '鸿星尔克', '匹克', '老北京', 'AJ', '乔丹']; //热搜词
  List historyWords = ['耐克', '李宁', '安踏', 'addidas', '锐步', '森马', '鸿星尔克', '匹克', '老北京', '乔丹']; //搜索历史
  List<String> suggestWords = []; //搜索建议
  TextEditingController _controller = TextEditingController();
  String query = ''; // 搜索词

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, // 状态栏字体颜色，dart白色，light 黑色
        backgroundColor: Colors.pink,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: ScreenUtil().setSp(42),
          ),
        ),
        actions: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SearchResult(_controller.text)));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 15),
                child: Text(
                  '搜索',
                  style: TextStyle(
                      color: query.isEmpty ? Colors.white54 : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
        elevation: 0,
        titleSpacing: 0,
        title: _searchInputWidget(),
      ),
      body: _bodyWidget(),
    );
  }

  // 搜索框
  Widget _searchInputWidget() {
    return Container(
      height: 34,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // 上下居中
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (val) {
                print(val);
              },
              onChanged: _searchWordsChange,
              cursorWidth: 1.2,
              // 鼠标宽度
//              autofocus: true,
              cursorColor: Color.fromRGBO(51, 51, 51, 1),
              // 鼠标颜色
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: '搜索感兴趣的内容',
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          query.isEmpty
              ? Text('')
              : IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.clear,
                    color: Color.fromRGBO(151, 151, 151, 1),
                    size: 20,
                  ),
                  onPressed: () {
                    query = '';
                    _controller.text = '';
                    setState(() {
                      query = '';
                    });
                    //showSuggestions(context); // 清除原搜索结果
                  },
                ),
        ],
      ),
    );
  }

  // 搜索词改变时，请求接口，获取推荐词
  void _searchWordsChange(String queryWords) async {
    setState(() {
      query = queryWords;
    });
  }

  // 热搜词，搜索历史
  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            color: Color.fromRGBO(245, 245, 245, 1.0),
            child: Text('热搜词'),
            margin: EdgeInsets.only(bottom: 10),
          ),
          Wrap(
              spacing: 10, // 左右间距
              runSpacing: 10,
              children: hotWords.map(
                    (i) => GestureDetector(
                          onTap: () {
                            _controller.text = i;
                            setState(() {
                              query = i;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: _randomColor(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(i, style: TextStyle(color: Colors.white),),
                            padding: EdgeInsets.symmetric( horizontal: 7, vertical: 5),
                          ),
                        ),
                  ).toList()),

          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            color: Color.fromRGBO(245, 245, 245, 1.0),
            child: Text('搜索历史'),
            margin: EdgeInsets.only(bottom: 10,top: 10),
          ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Wrap(
                  spacing: 10,
                  children: historyWords.map(
                        (i) => GestureDetector(
                      onTap: () {},
                      child: Chip(
                        labelPadding: EdgeInsets.only(left: 4,right: 4),
                        label: Text(i, style: TextStyle(fontSize: 12),),
                        padding: EdgeInsets.symmetric( horizontal: 7, vertical: 5),
                        deleteIconColor: Colors.black38,
                        onDeleted: (){
                          print(i);
                          historyWords.remove(i);
                          setState(() {
                            historyWords = historyWords;
                          });
                        },
                      ),
                    ),
                  ).toList()),
            )
        ],
      ),
    );
  }

  // 获取随机颜色
  Color _randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }
}
