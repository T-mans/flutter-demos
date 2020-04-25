import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'battery_level_view_controller.dart';

class BatterLevelView extends StatefulWidget {

  StreamController<String> _nativeToEvalueStream;
  StreamController<String> _flutterToEvaluteStream;

  double _width;
  double _height;

  BatterLevelView(double width, double height, {StreamController nativeToEvalueStream,
   StreamController flutterToEvaluteStream
   }): this._nativeToEvalueStream = nativeToEvalueStream,
      this._flutterToEvaluteStream = flutterToEvaluteStream,
      this._width = width,
      this._height = height;

  @override
  _BatterLevelViewState createState() => _BatterLevelViewState();
}

class _BatterLevelViewState extends State<BatterLevelView> {

  static  String  PLUGIN_PLAT_FORM_BASIC_VIEW_NAME =  "flutter.io/batterylevel_view";
  BatteryLevelViewController _controller;
  StreamController get _nativeToEvalueStream => widget._nativeToEvalueStream;
  StreamController get  _flutterToEvaluteStream => widget._flutterToEvaluteStream;
  StreamSubscription _subscription;

  @override
  void initState() { 
    super.initState();
   _subscription = _nativeToEvalueStream.stream.listen((flutterText){
      setState(() {
        _controller.sendMessageToNatvie(flutterText);
      });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._width,
      height: widget._height ,
      child:_buildPlatformView(context),
    );
  }
  
  //Step1:创建对应的 PlatformView,AndroidView会根据对应的`viewType`去查找对应的 PlatformViewFactory,执行创建方法.
  Widget _buildPlatformView(BuildContext context){
      if (Platform.isAndroid) {
        return AndroidView(
          viewType: PLUGIN_PLAT_FORM_BASIC_VIEW_NAME,
          onPlatformViewCreated: onPlatformViewCreated ,
          creationParamsCodec: StandardMessageCodec(),
        );
      } else if (Platform.isIOS) {
        return UiKitView(
          viewType: PLUGIN_PLAT_FORM_BASIC_VIEW_NAME,
          onPlatformViewCreated: onPlatformViewCreated ,
          creationParamsCodec: StandardMessageCodec(),
        );
      } else {
        return Container();
      }
  }

  //Step2:当Native的视图创建完成后,会接到到`onPlatformViewCreated`的回调方法,根据对应的`viewId`生成methodChannel用于和当前生成的视图交互。
  void onPlatformViewCreated(int viewId) { 
     _controller = BatteryLevelViewController(viewId: viewId, flutterToEvaluteStream: _flutterToEvaluteStream);
     _controller.bindNativeMethodCallBackHandler();
  }
}