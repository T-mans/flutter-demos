//
//  DemoViewFactory.m
//  batterylevel
//
//  Created by Guo Longxiang, (Longxiang.Guo@partner.bmw.com) on 2019/11/26.
//

#import "DemoViewFactory.h"
#import "DemoViewController.h"

@implementation DemoViewFactory {
    NSObject<FlutterPluginRegistrar>* _registrar;
}

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    self = [super init];
    if (self) {
        _registrar = registrar;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    
    return [[DemoViewController alloc]initWithFrame:frame registrar:_registrar viewId:viewId args:args];
}
@end


