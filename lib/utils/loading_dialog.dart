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
  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;

  LoadingDialog(
      {this.loadingText = '加载中...',
      this.outsideDismiss = true,
      this.dismissCallback});

  @override
  Widget build(BuildContext context) {
    _dissmissDialog() {
      if (dismissCallback != null) {
        dismissCallback();
      }

      Navigator.of(context).pop(); // 消失
    }

    // TODO: implement build
    return GestureDetector(
        onTap: outsideDismiss ? _dissmissDialog : null,
        child: Material(
          type: MaterialType.transparency, //透明底
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        loadingText,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
