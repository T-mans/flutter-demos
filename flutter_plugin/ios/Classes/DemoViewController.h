//
//  DemoViewController.h
//  batterylevel
//
//  Created by Guo Longxiang, (Longxiang.Guo@partner.bmw.com) on 2019/11/26.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface DemoViewController : NSObject<FlutterStreamHandler, FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
                    registrar:(NSObject<FlutterPluginRegistrar>*)registrar
                       viewId:(int64_t)viewId
                         args: (id _Nullable)args;

@end

@interface DemoView : UIView

@property (nonatomic, strong) UITextField *sendTextField;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UITextField *recieveTextField;
@property (nonatomic, strong) UIButton *recieveButton;

@end

