import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_page.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 50,left: 20,right: 20),
            child: Form(
//            autovalidate: true,
              child: Column(
                children: <Widget>[
                  _getLogo(),
                  _getTelephone(),
                  SizedBox(height: 6),
                  _getCode(),
                  SizedBox(height: 6),
                  _getPwd(),
//                  _getConfirmPwd(),
                  _registerBtn(),
                  _showLogin(context),
                ],
              ),
            )),
      )
    );
  }

  Widget _getLogo() {
    return Container(
        alignment: Alignment.center,
        child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 50, // 控制图片大小
            backgroundColor: Colors.transparent,//透明底
            child: Image.asset("assets/logo4.png", ),
          ),
        )
    );
  }

  Widget _showLogin(context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return LoginPage();
          }));
        },
        child: Padding(padding: EdgeInsets.only(top: 8,bottom: 8,left: 30), child: Text('已有账号？去登录'),),
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

  Widget _getTelephone() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: '请输入账号',
          border: InputBorder.none,

          prefixIcon: Container(
            width: 80,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: Text('账号'),
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        validator: (v) {
          return v.trim().length == 11 ? null : "请输入正确的手机号码";
        },
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          color: Colors.grey.withOpacity(0.1),
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      ),
    );
  }

  Widget _getPwd() {
    return Container(
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          hintText: '请输入密码',
//          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          prefixIcon: Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('密码'),
            color: Colors.grey.withOpacity(0.2),
            margin: EdgeInsets.only(right: 10),
          ),
          suffixIcon: Icon(Icons.remove_red_eye),

        ),
        validator: (v) {
          return v.trim().length >= 6 ? null : "请输入密码";
        },
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          color: Colors.grey.withOpacity(0.1),
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      ),
    );
  }

  Widget _getConfirmPwd() {
    return Container(
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          hintText: '请输入确认密码',
//          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          prefixIcon: Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('确认密码'),
            color: Colors.grey.withOpacity(0.2),
            margin: EdgeInsets.only(right: 10),
          ),
          suffixIcon: Icon(Icons.remove_red_eye),

        ),
        validator: (v) {
          return v.trim().length >= 6 ? null : "请输入确认密码";
        },
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          color: Colors.grey.withOpacity(0.1),
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      ),
    );
  }

  Widget _getCode() {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '请输入验证码',
                    border: InputBorder.none,
                    prefixIcon: Container(
                      width: 80,
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: Text('验证码'),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  validator: (v) {
                    return v.trim().length != 6 ? null : "请输入6位验证码";
                  },
                ),
                decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                    color: Colors.grey.withOpacity(0.1),
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                height: ScreenUtil().setHeight(80),
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  onPressed: () {},
                  color: Colors.pink,
                  child: Text(
                    '获取验证码',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ));
  }
/**
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
  }*/
}
