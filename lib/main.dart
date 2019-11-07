// 导入Material UI组件库
import 'package:flutter/material.dart';

// 导入navigator
// import 'navigator/tab_navigator.dart';

import 'home_page.dart';

// 应用的入口
void main() => runApp(MyApp());

// MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: '携程App',
      theme: ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue
      ),
      // 应用首页路由
      // home: TabNavigator(),
      home: HomePage(title: 'hahaha'),
    );
  }
}
