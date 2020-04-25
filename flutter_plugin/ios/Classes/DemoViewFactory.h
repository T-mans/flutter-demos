//
//  DemoViewFactory.h
//  batterylevel
//
//  Created by Guo Longxiang, (Longxiang.Guo@partner.bmw.com) on 2019/11/26.
//
#import <Flutter/Flutter.h>
#import <Foundation/Foundation.h>

@interface DemoViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar;

@end
