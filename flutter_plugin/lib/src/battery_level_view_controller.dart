import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class BatteryLevelViewController {
   StreamController _flutterToEvaluteStream;
   MethodChannel _battery_view_channel; 
  
   BatteryLevelViewController({@required int viewId, StreamController flutterToEvaluteStream})
   : _battery_view_channel = MethodChannel("flutter.io/batterylevel_view_${viewId}"),
    _flutterToEvaluteStream = flutterToEvaluteStream; 

   Future<void> sendMessageToNatvie(String message) async{
     await _battery_view_channel.invokeMethod('nativeToEvalute', message);
     return Future.value();
   }

   void bindNativeMethodCallBackHandler() {
      _battery_view_channel.setMethodCallHandler(this._handler);
   }

   Future<dynamic> _handler(MethodCall call) async {
     switch (call.method) {
       case "flutterToEvalute":
       _flutterToEvaluteStream.sink.add(call.arguments);
        break;
       default:
        throw MissingPluginException();
       break;
     }
   }
}