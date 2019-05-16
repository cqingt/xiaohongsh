import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoLoginPage extends StatefulWidget {
  @override
  _LogoLoginPageState createState() => _LogoLoginPageState();
}

class _LogoLoginPageState extends State<LogoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 150,left: 30,right: 30),
//          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getLogoWidget(),
              SizedBox(height: 50,),
              _getNameWidget(),
              SizedBox(height: 20,),
              _getPwdWidget(),
              SizedBox(height: 30,),
              _loginButtonWidget(),
              SizedBox(height: 10,),
          FlatButton(
            onPressed: (){},
            child: new Text('Forget Password?',style: new TextStyle(color: Colors.black54),),
          )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLogoWidget() {
    return Container(
      alignment: Alignment.center,
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 60, // 控制图片大小
            backgroundColor: Colors.transparent,//透明底
            child: Image.asset("assets/logo.png", ),
          ),
      )
    );
  }

  Widget _getNameWidget() {
    return Container(
      child: TextFormField(
        initialValue: '15000000001',
        keyboardType: TextInputType.phone, // 键盘类型
        decoration: InputDecoration(
          hintText: 'Phone',
          contentPadding: EdgeInsets.fromLTRB(20, 14, 20, 14), // 控制input框高度
          border: OutlineInputBorder( // 边框圆角
            borderRadius: BorderRadius.circular(30),
          )
        ),
      ),
    );
  }

  Widget _getPwdWidget() {
    return Container(
      child: TextFormField(
        obscureText: true,
//        initialValue: '15000000001',
        keyboardType: TextInputType.url, // 键盘类型
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20, 14, 20, 14), // 控制input框高度
            border: OutlineInputBorder( // 边框圆角
              borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }

  Widget _loginButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        color: Colors.lightBlue,
        elevation: 5,//阴影面积
        shadowColor: Colors.lightBlue.shade100, // 阴影颜色
        borderRadius: BorderRadius.circular(32),
        child: MaterialButton(
          minWidth: double.infinity,
          height: ScreenUtil().setHeight(40),
          onPressed: null,
          child: Text('Login', style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
