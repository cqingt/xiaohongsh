import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'register_page.dart';
import 'reset_password_page.dart';
import 'home_page.dart';
import 'home_page.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return HomePage();
          }));
        }),
      ),
      body: GestureDetector(
        onTap: () {
          debugPrint('ontab');
        },

        child: Container(
            padding: EdgeInsets.only(top: 10,left: 30,right: 30),
            margin: EdgeInsets.only(top: 50),
            child: Form(
//          autovalidate: true,
              child: Column(
                children: <Widget>[
                  _getTitle(),
//                  _getUsername(),
//                  _getPassword(),
                  _getTelephone(),
                  SizedBox(height: 6,),
                  _getPwd(),
                  _loginBtn(context),
                  _getBottom(context),
                ],
              ),
            )
        ),
      )
    );
  }
  
  Widget _getTitle() {
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

  Widget _getUsername() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3))
          ),
          contentPadding: EdgeInsets.only(left: 20,top: 15,bottom: 5),
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
          contentPadding: EdgeInsets.only(left: 20,top: 15,bottom: 5),
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
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(2)
//      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return HomePage();
          }));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context){
                  return RegisterPage();
                }));
              },
              child: Padding(padding: EdgeInsets.only(top: 8,bottom: 8,right: 50), child: Text('快速注册'),),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context){
                  return ResetPasswordPage();
                }));
              },
              child: Padding(padding: EdgeInsets.only(top: 8,bottom: 8,left: 50), child: Text('忘记密码'),),
            ),
          )
        ],
      ),
    );
  }
}
