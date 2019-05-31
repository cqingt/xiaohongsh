import 'package:flutter/material.dart';

///
///  打开弹窗
/// showDialog<Null>(
///    context: context, //BuildContext对象
///     barrierDismissible: false,
///     builder: (BuildContext context) {
///        return new LoadingDialog( //调用对话框
///            text: '正在获取详情...',
///         );
///    });
///
/// 关闭弹窗
/// Navigator.pop(context); //关闭对话框
///

class LoadingDialog extends Dialog {
  String text;

  LoadingDialog(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency, //透明底
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(

                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}