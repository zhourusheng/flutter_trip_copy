import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// pages
import '../page/home_page.dart';
import '../page/speak_page.dart';
import '../page/travel_page.dart';
import '../page/my_page.dart';


class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(
    initialPage: 0
  );
  final defaultColor = Colors.grey;
  final activeColor = Colors.blueAccent;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
           _currentIndex = index; 
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SpeakPage(),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // 页面跳转调用 jumpToPage()
          _controller.jumpToPage(index);
          setState(() {
           _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _navigationBarItem(Icons.home, '首页', 0),
          _navigationBarItem(Icons.search, '搜索', 1),
          _navigationBarItem(Icons.camera, '旅拍', 2),
          _navigationBarItem(Icons.account_box, '我的', 3),
        ],
      ),
    );
  }

  _navigationBarItem(IconData iconData, String itemName, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: defaultColor,
      ),
      activeIcon: Icon(
        iconData,
        color: activeColor,
      ),
      title: Text(
        itemName,
        style: TextStyle(
          color: _currentIndex == index ? activeColor : defaultColor 
        )
      )
    );
  }
}