import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String category, title, content;
  File _image;
  List imageList = List<File>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.addListener(() {
      title = titleController.text;
    });

    contentController.addListener(() {
      content = contentController.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标记我的生活'),
        centerTitle: true,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 10),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              child: InkWell(
                child: Text(
                  '发布',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                ),
                onTap: () {
                  formKey.currentState.save();
                },
              ))
        ],
      ),
      body: Theme(
          data: ThemeData(hintColor: Colors.grey[400]),
          child: SingleChildScrollView(
            // 避免键盘被遮挡
            child: Container(
              margin: EdgeInsets.all(10),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getListView(),
                      _getTitle(),
                      _getContent(),
                      _getCategory(),
                    ],
                  )),
            ),
          )),
    );
  }

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      imageList.add(image);
      debugPrint("${imageList}");
    });
  }

  Widget _getListView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemCount: imageList.length + 1,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == imageList.length) {
            return InkWell(
              child: Container(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(180),
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[300],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(6))),
              onTap: _getImage,
            );
          }

          return Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(180),
              margin: EdgeInsets.only(right: 10, bottom: 10),
              child: Image.file(imageList[index], fit: BoxFit.cover,),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(6))
          );
        }
    );
  }

  Widget _getUploadImg(imgPath) {
    if (imgPath == null) {
      return Container(
        child: Text(''),
      );
    } else {
      return Container(
          width: ScreenUtil().setWidth(200),
          height: ScreenUtil().setHeight(180),
          margin: EdgeInsets.only(right: 10, bottom: 10),
          child: Image.file(imgPath, fit: BoxFit.cover,),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(6))
      );
    }
  }

  Widget _getCategory() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: ScreenUtil().setHeight(50),
      child: Row(
        children: <Widget>[
          Container(
            child: Text('标签：'),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 2),
            child: FilterChip(
              selectedColor: Colors.pink,
              label: Text('旅行'),
              onSelected: (bool value) {
                setState(() {
                  if (value == true) {
                    category = '旅行';
                  }
                });
              },
              selected: category == '旅行',
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 2),
            child: FilterChip(
//              backgroundColor: Colors.pink,
              selectedColor: Colors.pink,

              label: Text(
                '美食',
              ),
              onSelected: (bool value) {
                setState(() {
                  if (value == true) {
                    category = '美食';
                  }
                });
              },
              selected: category == '美食',
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 2),
            child: FilterChip(
              selectedColor: Colors.pink,
              label: Text('家居'),
              onSelected: (bool value) {
                setState(() {
                  if (value == true) {
                    category = '家居';
                  }
                });
              },
              selected: category == '家居',
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Container(
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(
          hintText: '请输入标题',
        ),
        onSubmitted: (value) {
          title = value;
        },
      ),
    );
  }

  Widget _getContent() {
    return Container(
      child: TextField(
        controller: contentController,
        maxLines: 8,
        // 显示行数
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: '请输入发布内容',
//          contentPadding: EdgeInsets.symmetric(vertical: 40)
        ),
        onSubmitted: (value) {
          debugPrint('submit: ${value}');
          content = value;
        },
      ),
    );
  }
}
