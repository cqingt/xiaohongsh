import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'register_page.dart';
import 'reset_password_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10,left: 30,right: 30),
        margin: EdgeInsets.only(top: 50),
        child: Form(
//          autovalidate: true,
          child: Column(
            children: <Widget>[
              _getTitle(),
              _getUsername(),
              _getPassword(),
              _loginBtn(context),
              _getBottom(context),
            ],
          ),
        )
      ),
    );
  }
  
  Widget _getTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text('登录解锁更多功能', style: TextStyle(fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold, color: Colors.black54),),
    );
  }

  Widget _getUsername() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3))
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 15,bottom: 5),
//            labelText: '手机号',
            hintText: '账号',
//            prefixIcon: Icon(Icons.account_circle)
            //border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.blueAccent))
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
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3))
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 15,bottom: 5),
//            labelText: '密码',
            hintText: '密码',
//            icon: Icon(Icons.remove_red_eye)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "密码不能为空";
        },
      ),
    );
  }

  Widget _loginBtn(context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return HomePage();
          }));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.pink,
        child: Text(
          '登录',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _getBottom(context) {
    return Container(

      child: Row(
//        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,//子组件的排列方式为主轴两端对齐
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return RegisterPage();
                }));
              },
              child: Text('快速注册'),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return ResetPasswordPage();
                }));
              },
              child: Text('忘记密码'),
            ),
          )
        ],
      ),
    );
  }
}
