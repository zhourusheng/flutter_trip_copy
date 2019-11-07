// 导入Material UI组件库
import 'package:flutter/material.dart';

import './routes/new_route.dart';

// HomePage 继承自StatefulWidget类，表示它是一个有状态的组件（Stateful widget）
class HomePage extends StatefulWidget {
  HomePage({ Key key, this.title }) : super (key: key);
  final String title;
  @override
  _HomePageState createState() => new _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     _counter++; 
    });
  }

  @override
  // Flutter框架会调用Widget的build方法来构建widget树，最终将widget树渲染到设备屏幕上
  Widget build(BuildContext context) {

    /***
     * Scaffold 是 Material组件库中提供的一个组件，它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性。组件树可以很复杂。
     * **/ 
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return NewRoute();
                    }
                  )
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

