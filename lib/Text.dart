import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("文本组件"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Text("Hello， text Compent 文本组件使用的",
              textScaleFactor: 1,
              textAlign: TextAlign.left,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                height: 3.0,
                fontFamily: "Courier",
                background: new Paint()..color= Colors.red,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),

            Text.rich(TextSpan(
                children: [
                  TextSpan(text: "Home:"),
                  TextSpan(text: "https://flutterchina.club",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      /// 后续讲解手势识别的内容
                  ),
                ]
              ),
            ),

          ],
        ),

      ),

    );
  }
}