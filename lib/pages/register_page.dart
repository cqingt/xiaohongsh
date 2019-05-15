import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 50),
          child: Form(
//            autovalidate: true,
            child: Column(
              children: <Widget>[
                _getUsername(),
                _getPassword(),
                _getRePeat(),
                _registerBtn(),
                _getBottom(context),
              ],
            ),
          )),
    );
  }

  Widget _getBottom(context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return LoginPage();
          }));
        },
        child: Text('去登录'),
      ),
    );
  }

  Widget _registerBtn() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: RaisedButton(
        onPressed: () {},
        color: Colors.pink,
        child: Text(
          '注册',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _getUsername() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '手机号',
          hintText: '请输入手机号',
//            icon: Icon(Icons.account_circle)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "手机号不能为空";
        },
      ),
    );
  }

  Widget _getPassword() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: '密码',
          hintText: '请输入密码',
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
