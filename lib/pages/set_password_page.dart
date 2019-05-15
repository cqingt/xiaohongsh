import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_page.dart';

class SetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置新密码'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 50),
          child: Form(
//            autovalidate: true,
            child: Column(
              children: <Widget>[
                _getPassword(),
                _getRePeat(),
                _registerBtn(context),
              ],
            ),
          )),
    );
  }

  Widget _registerBtn(context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return LoginPage();
          }));
        },
        color: Colors.pink,
        child: Text(
          '保存',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _getPassword() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: '新密码',
          hintText: '请输入新密码',
//            icon: Icon(Icons.remove_red_eye)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "密码不能为空";
        },
      ),
    );
  }

  Widget _getRePeat() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: '确认密码',
          hintText: '请输入确认密码',
//            icon: Icon(Icons.remove_red_eye)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "密码不能为空";
        },
      ),
    );
  }
}
