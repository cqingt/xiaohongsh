import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // 防止键盘弹出时超出屏幕，报错
        child: Column(
          children: <Widget>[
            _getPic(),
            _getTitle(),
            _getEditWidget(context),
            _buildLoginRegisterButton()
          ],
        ),
      ),
    );
  }

  // 背景图
  Widget _getPic() {
    return Container(
      child: Image.asset(
        "assets/loginbg.png",
        fit: BoxFit.cover,
      ),
    );
  }

  // 标题
  Widget _getTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      alignment: Alignment.center,
      child: Text(
        '系统登录',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  // 用户名，密码编辑框：
  Widget _getEditWidget(context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              //width: 1.0 / MediaQuery.of(context).devicePixelRatio,// 边框1
              width: ScreenUtil().setWidth(1),
              color: Colors.grey.withOpacity(0.5)
          )
      ),
      child: LoginPages(),
    );
  }

  // 登录、注册按钮
  Widget _buildLoginRegisterButton() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴居中
        children: <Widget>[
          Expanded( // 子元素均等分，flex
            child: Container(
              height: ScreenUtil().setHeight(70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.3)
              ),
              child: FlatButton(
                  onPressed: null,
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white),
                  )
              ),
            )
          ),
          SizedBox( // 设置盒子
            width: 15,
          ),
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Colors.green),
              ),
              child: FlatButton(
                  onPressed: null,
                  child: Text(
                    '注册新用户',
                    style: TextStyle(color: Colors.green),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController _usernameController; // 用户名
  TextEditingController _passwordController; // 密码

  final FocusNode _usernameFocusNode = FocusNode(); // 获取焦点
  final FocusNode _passwordFocusNode = FocusNode(); // 获取焦点

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _usernameController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  Widget _buildNameTextField() {
    return TextField(
      controller: _usernameController,
      focusNode: _usernameFocusNode,
      decoration: InputDecoration(
          hintText: '账号',
          border: InputBorder.none, // 无边框
          prefixIcon: Icon(Icons.account_circle),
          suffixIcon: (_usernameController.text ?? "").isEmpty
              ? IconButton(icon: Icon(Icons.code), onPressed: null)
              : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _usernameFocusNode.unfocus();
                  },
                )// 如果输入框文字不为空，则显示x清楚按钮
      ),
    );
  }

  Widget _buildPwdTextField() {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      decoration: InputDecoration(
          hintText: '密码',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.https),
          suffixIcon: (_passwordController.text ?? "").isEmpty
              ? FlatButton(
                  onPressed: () {
                    _passwordFocusNode.unfocus();
                    _usernameFocusNode.unfocus();
                  },
                  child: Text(
                    '忘记密码',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ))
              : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _passwordController.clear();
                    _passwordFocusNode.unfocus();
                  },
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildNameTextField(),
          Divider(height: 1, ),// 分割线
          _buildPwdTextField()
        ],
      ),
    );
  }
}
