import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'english_words.dart';
import 'Counter.dart';
import 'Text.dart';
import 'Component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      // 注册路由表 路由注册信息
      routes:{
        "new_page":(context) => NewRoute(),
        "tip_page":(context) => TipRoute(text: 'Flutter Demo Home Page'),
        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "transParams_page":(context) => EchoRoute(),
        "tip2": (context){
          return TipRoute(text: ModalRoute.of(context).settings.arguments);},
        "counter": (context) {
          return CounterWidget();
        },

        /// 文本组件使用
        "text": (context) {
          return TextWidget();
        },

        /// 组件使用
        "component": (context) {
          return ComponentPage(title: "所有组件",);
        },

      } ,

      //home: MyHomePage(title: 'Flutter Demo Home Page 2'),

      /// 路由生成钩子
      /// 注意，onGenerateRoute只会对命名路由生效。
      onGenerateRoute:(RouteSettings settings){
          return MaterialPageRoute(builder: (context){
            String routeName = settings.name;
            /// 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            /// 引导用户登录；其它情况则正常打开路由。
            /// 导航到新路由
            Navigator.pushNamed(context, routeName);
          }
          );
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            /// 添加扁平按钮
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return NewRoute();
                    }));
              },
            ),

            /// 新路由传参
            FlatButton(
              child: Text("路由传参"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return TipRoute(text: "我是传值路由");
                    }));
              },
            ),

            /// 通过使用路由名字，完成页面跳转
            FlatButton(
              child: Text("通过路由名字，跳转界面"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.pushNamed(context, "new_page");
              },
            ),

            /// 通过路由名字，跳转，并传递参数
            FlatButton(
              child: Text("通过路由名字，跳转，并传递参数"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.of(context).pushNamed("transParams_page", arguments: "hello world");
              },
            ),

            /// 在路由表中接收参数传递
            FlatButton(
              child: Text("在路由表中接收参数传递"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
                //导航到新路由
                Navigator.of(context).pushNamed("tip2", arguments: "hello world tip2");
              },
            ),

            /// 自建计数器
            FlatButton(
              child: Text("自建计数器"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
                //导航到新路由
                Navigator.of(context).pushNamed("counter", arguments: "0");
              },
            ),

            /// 展示文本组件的使用范例
            FlatButton(
              child: Text("文本组件"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
                //导航到新路由
                Navigator.of(context).pushNamed("text");
              },
            ),

            /// 展示所有组件的使用范例
            FlatButton(
              child: Text("所有组件的使用范例"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
                //导航到新路由
                Navigator.of(context).pushNamed("component");
              },
            ),


            /// 生成随机的英文字符串
            RandomWordsWidget(),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 新路由界面
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}


/// 路由传值
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由传参展示 Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开`TipRoute`，并等待返回结果
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "我是提示xxxx",
                );
              },
            ),
          );
          //输出`TipRoute`路由返回结果
          print("路由返回值: $result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}

/// 通过路由名字，跳转，并传递参数
class EchoRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// 获取路由参数
    var args=ModalRoute.of(context).settings.arguments;
    print(args);
    return  Scaffold(
      appBar: AppBar(
        title: Text("通过路由名字跳转打印接收参数"),
      ),
      body: Center(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '打印接收参数:',
              ),

              Text(
                '传递的参数 $args',
                style: Theme.of(context).textTheme.subtitle,
              ),
          ],
        ),
      ),
    );
  }
}