#import "FlutterPlugin.h"
#import "DemoViewFactory.h"

@implementation FlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter.io/batterylevel"
            binaryMessenger:[registrar messenger]];
  FlutterPlugin* instance = [[FlutterPlugin alloc] init];

  DemoViewFactory* factory = [[DemoViewFactory alloc]initWithRegistrar:registrar];
  [registrar registerViewFactory:factory withId:@"flutter.io/batterylevel_view"];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getBatteryLevel" isEqualToString:call.method]) {
      int batterylevel = (int)[UIDevice currentDevice].batteryLevel;
      result([NSNumber numberWithInt:batterylevel]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
