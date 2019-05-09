import 'package:flutter/material.dart';
import 'package:xiaohongshu/pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/current_index.dart';

void main() {
  var providers = Providers();
  var currentIndex = CurrentIndexProvide();

  providers..provide(Provider<CurrentIndexProvide>.value(currentIndex));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IndexPage(),
    );
  }
}
