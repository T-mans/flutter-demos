import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_plugin/flutter_plugin.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  timeDilation = 50;
  runApp(MyApp());
}

//Constants:

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _batterylevel = -1;

  StreamController<String> _nativeToEvaluteStream;
  StreamController<String> _flutterToEvaluteStream;
  StreamSubscription<String> _subscription;

  TextEditingController _textEditRecieveNative;
  TextEditingController _textEditSendToNative;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _nativeToEvaluteStream = StreamController();
    _flutterToEvaluteStream = StreamController();
    _subscription = _flutterToEvaluteStream.stream.listen((natvieText){
      setState(() {
        _textEditRecieveNative.text = natvieText;
      });
    });
    _textEditRecieveNative = TextEditingController();
    _textEditSendToNative = TextEditingController();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    int batteryLevel;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Batterylevel.platformVersion;
      batteryLevel = await Batterylevel.getBatteryLevel;
    } catch(e) {
      platformVersion = 'Failed to get platform version.';
      batteryLevel = -1;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _batterylevel =  batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Running on: $_platformVersion\n'),
            ),
            ListTile(
              title: Text('Batterylevel: $_batterylevel\n'),
            ),
            ListTile(
              title: Text("below is native: ${_viewTitle}"),
            ),
            _buildNativeView(context),
            ListTile(
              title: Text('below is an Flutter View'),
            ),
            _buildFlutterView(context)
          ],
        ),
      ),
    );
  }

  Widget _buildNativeView(BuildContext context) {
    // double width =  MediaQuery.of(context).size.width - 20.0;
    // double height = MediaQuery.of(context).devicePixelRatio * 220;
    return Column(
      children: <Widget>[
        Container(
          width: 300.0,
          height: 180.0,
          child: BatterLevelView(300.0, 180.0,flutterToEvaluteStream: _flutterToEvaluteStream, nativeToEvalueStream: _nativeToEvaluteStream,),
        )
      ],
    );
  }

  Widget _buildFlutterView(BuildContext context) {
    //  double width =  MediaQuery.of(context).size.width - 20.0;
    //  double height = MediaQuery.of(context).devicePixelRatio * 220;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          width: 300,
          height: 300,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.accessible),
                  helperText: "输入文字发送到native端",
                ),
                controller: _textEditSendToNative,
                onFieldSubmitted: (text){
                  if (_nativeToEvaluteStream.sink != null){
                    _nativeToEvaluteStream.sink.add(text);
                  }
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("发送至Natvie", overflow: TextOverflow.fade, softWrap: true, textAlign: TextAlign.center,),
                onPressed: (){
                  if (_nativeToEvaluteStream.sink != null){
                    _nativeToEvaluteStream.sink.add( _textEditSendToNative.text);
                  }
                },),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.add),
                  helperText: "接受来自Native的文字",
                ),
                controller: _textEditRecieveNative,
                onFieldSubmitted: (text){

                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("开始接收Native的信息", overflow: TextOverflow.fade, softWrap: true, textAlign: TextAlign.center,),
                onPressed: (){ },
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _flutterToEvaluteStream.close();
    _nativeToEvaluteStream.close();
    super.dispose();
  }

  String get _viewTitle {
    if (Platform.isIOS) {
      return "UIKitView";
    } else if (Platform.isAndroid) {
      return "AndroidView";
    } else {
      return "unkownView";
    }
  }
}
