import 'package:activity_indicator/activity_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: ActivityIndicatorExample(),
));

class ActivityIndicatorExample extends StatelessWidget{
  
  ActivityIndicatorController controller;
  
  void _onActivityIndicatorControllerCreated(ActivityIndicatorController _controller){
    controller = _controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("flutter加载测试"),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          new Container(
            child: new Stack(
              children: <Widget>[
                UIActivityIndicator(
                  hexColor: "FF0000",
                  onActivityIndicatorWidgetCreated: _onActivityIndicatorControllerCreated,
                ),
                new Container(
                  alignment: Alignment.center,
                  child: new Text("我是flutter控件，没有被遮挡~"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0,right: 45.0,top: 0.0,bottom: 50.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: (){
                    ///开始
                    controller.start();
                  },
                  child: new Text("Start"),
                ),
                FloatingActionButton(
                  onPressed: (){
                    ///结束
                    controller.stop();
                  },
                  child: new Text("Stop"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
