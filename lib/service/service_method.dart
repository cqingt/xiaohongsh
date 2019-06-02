import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import '../config/service_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/loading_dialog.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';

Future httpPost(context, url, {formData, loadingText}) async {
  Utils.showLoadingDialog(context, loadingText != null ? loadingText : '请求中');

  try {
    print('开始获取数据..............');
    Response response;
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('login-token') ?? '';
    
    // 设置请求头:表单
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    //dio.options.headers = {'Authorization': "Bearer $token" }; // 用户登录

    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data:formData);
    }

    Navigator.pop(context);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口请求错误');
    }

  } catch (e) {
    print('Error:>>>>>>>>${e}');
  }
}

Future httpGet(url, {params}) async {
  try {
    print('开始请求数据.................');

    Response response;
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('login-token') ?? '';

    dio.options.headers = {'Authorization': "Bearer $token" }; // 用户登录

    if (params == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url], queryParameters: params);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口请求错误');
    }
  } catch (e) {
    print('Error: >>>>>>>>>>${e}');
  }
}