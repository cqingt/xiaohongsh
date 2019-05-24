import 'package:flutter/material.dart';
import 'my_data_edit.dart';
import 'my_data_name.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class MyData extends StatefulWidget {
  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  File _avatar;
  bool _upload = false;
  String _newValue = '未知';
  String _birthday = '2001-01-01';
  String _address = '福建泉州';

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
            InkWell(child: _getAvatar(), onTap: _getImage),
            Divider(
              height: 1,
            ),
            _getItem('名字', '我的名字', () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (BuildContext context) {
                return MyDataName();
              }));


            }),
            Divider(
              height: 1,
            ),
            _getItem('性别', _newValue, () async {
              await _selectGender(context);
            }),
            Divider(
              height: 1,
            ),
            _getItem('常住地', _address, () async {
              var result = await CityPickers.showCityPicker(
                context: context,
              );

              setState(() {
                _address = result.provinceName + result.cityName; // areaName
              });
            }),

            Divider(
              height: 1,
            ),

            _getItem('生日', _birthday, () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1919, 1, 1),
                  maxTime: DateTime(2019, 1, 1), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                setState(() {
                  _birthday = date.toString().substring(0, 10);
                });
              },
                  currentTime: DateTime(1990, 1, 1),
                  theme: DatePickerTheme(
                    doneStyle: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  //DateTime.now() 当前时间
                  locale: LocaleType.zh);
            }),
            Divider(
              height: 1,
            ),
            _getSignature(), // 签名
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSignature() {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MyDataEdit();
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 10, bottom: 15),
              child: Text(
                '个性签名',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
                child: Padding(
              child: Text(
                '我是小红书的模仿着，在我看来，小红书越来越黄了。',
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            )),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ));
  }

  Future _selectGender(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Text(
                "请选择性别",
                style: TextStyle(fontSize: 18),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey[200]))),
            ),
            contentPadding: EdgeInsets.all(0),
            content: StatefulBuilder(builder: (context, StateSetter  setState) {
              return Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(200),
                child: Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      value: '男',
                      title: Text('男'),
                      groupValue: _newValue,
                      selected: _newValue == '男',
                      onChanged: (value) {
                        setState(() {
                          _newValue = value;
                        });
                      },
                    ),

                    RadioListTile<String>(
                      value: '女',
                      title: Text('女'),
                      groupValue: _newValue,
                      selected: _newValue == '女',
                      onChanged: (value) {
                        setState(() {
                          _newValue = value;
                        });
                      },
                    )
                  ],
                ),
              );
            }),
            actions: <Widget>[
              FlatButton(
                child: new Text("确定"),
                onPressed: () {
                  setState(() {
                    _newValue = _newValue;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _getAvatar() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(top: 15, left: 10, bottom: 15),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: _upload ? FileImage(_avatar) : NetworkImage(
              'https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg',
            ),
          ),
        ),
        Expanded(
            child: Padding(
          child: Text(
            '修改头像',
            style: TextStyle(color: Colors.grey),
          ),
          padding: EdgeInsets.only(left: 40),
        )),
        Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _getItem(String lable, String value, onSelect) {
    return InkWell(
        onTap: () {
          onSelect();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              margin: EdgeInsets.only(top: 15, left: 10, bottom: 15),
              child: Text(
                '$lable',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
                child: Padding(
              child: Text(
                '$value',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              padding: EdgeInsets.only(left: 20),
            )),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ));
  }

  // 打开图片浏览器
  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _avatar = image;
      _upload = true;
    });
  }
}
