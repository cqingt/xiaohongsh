import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
//class SearchPage extends StatefulWidget {
//  @override
//  _SearchPageState createState() => _SearchPageState();
//}
//
//class _SearchPageState extends State<SearchPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('搜索'),
//        centerTitle: true,
//        actions: <Widget>[
//          IconButton
//        ],
//      ),
//      //body: SearchBar()
//    );
//  }
//}

// 搜索框
class SearchBar extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    // 清除
    return query.isEmpty ? [] : [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
            showSuggestions(context); // 清除原搜索结果
          },
        ),
      ];
  }

  // 返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation
        ),
        onPressed: () {
          close(context, null);
        },
      );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: theme.primaryTextTheme, // 文字颜色
      primaryColor: Colors.pink,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      //primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  // 点击搜索，出现结果
  @override
  Widget buildResults(BuildContext context) {

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin:EdgeInsets.only(left: 10, top: 5,bottom: 0),
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(50),
              child: Text('共50条搜索结果'),
            ),
            _getNotes(),
          ],
        )
      )
    );
  }

  // 下拉框提示
  @override
  Widget buildSuggestions(BuildContext context) {
    // 推荐搜索词
    List searchList = [
      "lao-老王",
      "lao-老张",
      "xiao-小王",
      "xiao-小张"
    ];

    // 搜索历史
    List recentSuggest = [
      "马云-1",
      "马化腾-2"
    ];

    final suggestionList = query.isEmpty ? recentSuggest : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              query = suggestionList[index]; // 给搜索框赋值
              showResults(context); // 展示结果
            },
            child: Container(
              height: ScreenUtil().setHeight(70),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(top:5, bottom: 5, ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1,color: Colors.grey[200])
                )
              ),
              child: Row(
                children: <Widget>[
                  query.isEmpty ? Icon(Icons.access_time, color: Colors.grey, size: 20,) : Text(''),
                  SizedBox(width: 10,),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: suggestionList[index].substring(0, query.length),
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                  text: suggestionList[index].substring(query.length),
                                  style: TextStyle(color: Colors.grey)
                              ),
                            ]
                        )
                    ),
                  ),
                  query.isEmpty ?
                  IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey, size: 20,),
                    onPressed: (){
                      // 删除建议列表
                      debugPrint('$index');
                      recentSuggest.removeAt(index);
                    },
                  )
                      : Text(''),
                ],
              )
            )
          );
        }
    );
  }

  Widget _getNotes() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
      child: GridView.builder(
          physics: ScrollPhysics(),
          itemCount: 20,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 55 / 100,
          ),
          itemBuilder: _getNoteItem
      ),
    );
  }

  Widget _getNoteItem(BuildContext context, index) {
    return InkWell(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              _getImage(),
              _getTitle(),
              _getUser(),
            ],
          )),
    );
  }

  Widget _getImage() {
    return Container(
      height: ScreenUtil().setHeight(420),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(
                "http://ci.xiaohongshu.com/b626f941-036d-5dd8-9413-5e659cb93993"),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _getTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        '酸奶蒸蛋糕',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.bold),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getUser() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            foregroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
          ),
          Container(
            width: ScreenUtil().setWidth(170),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              '夜来香叶',
              style: TextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.favorite_border,
            size: 16,
          ),
          Text('127')
        ],
      ),
    );
  }
}

// 切换中文，
class CustomLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'zh';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(zh_CN)';
}

class CustomLocalization extends DefaultMaterialLocalizations {
    CustomLocalization();

//  @override
//  String get searchFieldLabel => "帮助";
}