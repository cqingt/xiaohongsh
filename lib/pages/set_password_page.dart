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
//          fillColor: Colors.grey,
//          labelText: '新密码',
          hintText: ' 请输入新密码',
          border: InputBorder.none,
          prefixIcon: Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('密码'),
              color: Colors.grey.withOpacity(0.2),
          ),
//            icon: Icon(Icons.remove_red_eye)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "密码不能为空";
        },
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          color: Colors.grey.withOpacity(0.1),
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      ),
    );
  }

  Widget _getRePeat() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15,left: 30),
//          labelText: '确认密码',
          border: InputBorder.none,
          prefixIcon: Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('确认密码'),
            color: Colors.grey.withOpacity(0.2),
          ),
          hintText: '  请输入确认密码',
//            icon: Icon(Icons.remove_red_eye)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "密码不能为空";
        },
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0)),
          color: Colors.grey.withOpacity(0.1),

      ),
    );
  }
}
