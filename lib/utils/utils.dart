import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'loading_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static save(String key, dynamic value) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    if (value is String) {
      pre.setString(key, value);
    } else if (value is bool) {
      pre.setBool(key, value);
    } else if (value is List) {
      pre.setStringList(key, value);
    }
  }

  static get(String key) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    return pre.get(key);
  }

  static remove(String key) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove(key);
  }

  static showSnackBar(String msg, GlobalKey<ScaffoldState> key) {
    key.currentState.showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(fontSize: 17),),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  // 显示弹窗
  static showLoadingDialog(context, showMsg) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return LoadingDialog(loadingText: showMsg);
        });
  }

  // 显示对话框
  static showFlutterToast(showMsg) {
    Fluttertoast.showToast(
        msg: showMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}