import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'set_password_page.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20),
        child: Form(
//          autovalidate: true,
          child: Column(
            children: <Widget>[
              _getUsername(),
              _getVerifyCode(),
              _loginBtn(context),
            ],
          ),
        )
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

  Widget _getVerifyCode() {
    return Container(
//      width: ScreenUtil().setWidth(600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '验证码',
                hintText: '请输入验证码',
//            icon: Icon(Icons.account_circle)
              ),
              validator: (v) {
                return v.trim().length > 0 ? null : "验证码不能为空";
              },
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: RaisedButton(
                onPressed: null,
                child: Text('获取验证码'),
              ),
            ),
            flex: 1,
          ),
        ],
      )
    );
  }

  Widget _loginBtn(context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return SetPasswordPage();
          }));
        },
        color: Colors.pink,
        child: Text(
          '下一步',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
