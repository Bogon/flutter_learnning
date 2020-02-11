import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Text.dart';   /// 文本组件

class ComponentWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// 可进行路由跳转的子页面
    return CupertinoApp(

      title: "所有组件",
      theme: CupertinoThemeData(
        primaryColor: Colors.white
      ),

      /// 构建路由表
      routes: {
        "/":(context) => ComponentPage(title: '所有组件'),
        /// 文本组件使用
        "text": (context) {
          return TextWidget();
        },
      },

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

class ComponentPage extends StatefulWidget {

  ComponentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComponentPageState createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(

      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            /// 文本组件
            CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: Text('文本组件'),
                onPressed: (){
                  //导航到新路由
                  Navigator.pushNamed(context, "text");
                }
            ),

          ],
        ),

    );

  }
}