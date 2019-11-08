import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // controller
  TextEditingController _usernameController = TextEditingController();

  // input 焦点控制
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _usernameController.addListener(() {
      // debugPrint('input:${_usernameController.text}');
      print(_usernameController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _usernameController, // 关联controller
              focusNode: focusNode1, // 关联focusNode1
              onChanged: (v) {
                print(v);
              },
              decoration: InputDecoration(
                // labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(
                // labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock)
              ),
            ),
            RaisedButton(
              child: Text('移动焦点'),
              onPressed: () {
                //将焦点从第一个TextField移到第二个TextField
                // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                // 这是第二种写法
                if (focusScopeNode == null) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            RaisedButton(
              child: Text('隐藏键盘'),
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            )
          ],
        ),
      ),
    );
  }
}