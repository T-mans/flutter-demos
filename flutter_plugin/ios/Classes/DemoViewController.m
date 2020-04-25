//
//  DemoViewController.m
//  batterylevel
//
//  Created by Guo Longxiang, (Longxiang.Guo@partner.bmw.com) on 2019/11/26.
//

#import "DemoViewController.h"

@implementation DemoViewController {
    NSObject<FlutterPluginRegistrar>* _registrar;
    DemoView* _view;
    FlutterMethodChannel* _channel;
    FlutterEventChannel* _eventChannel;
    FlutterEventSink _eventSink;
}

- (instancetype)initWithFrame:(CGRect)frame
                    registrar:(NSObject<FlutterPluginRegistrar>*)registrar
                       viewId:(int64_t)viewId
                         args: (id _Nullable)args {
    self = [super init];
    if (self) {
        _view = [[DemoView alloc]initWithFrame:frame];
        [_view.sendButton addTarget:self action:@selector(clcikSendButton:) forControlEvents:UIControlEventTouchUpInside];
        [_view.recieveButton addTarget:self action:@selector(clickSinkEventButton:) forControlEvents:UIControlEventTouchUpInside];
        NSString* channelName = [NSString stringWithFormat:@"flutter.io/batterylevel_view_%lld",viewId];
        _channel = [[FlutterMethodChannel alloc]initWithName:channelName binaryMessenger:registrar.messenger codec:[FlutterStandardMethodCodec sharedInstance]];
        typeof(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            if ([call.method isEqualToString:@"nativeToEvalute"] && weakSelf){
                weakSelf->_view.recieveTextField.text = (NSString*)call.arguments;
            }
        }];
        
        NSString* eventChannelName = [NSString stringWithFormat:@"flutter.io/batterylevel_view_event_%lld",viewId];
        _eventChannel = [[FlutterEventChannel alloc]initWithName:eventChannelName binaryMessenger:registrar.messenger codec:[FlutterStandardMethodCodec sharedInstance]];
        [_eventChannel setStreamHandler:self];
    }
    return self;
}

- (void)clcikSendButton:(UIButton*)btn {
    [_channel invokeMethod:@"flutterToEvalute" arguments:_view.sendTextField.text];
}

- (void)clickSinkEventButton: (UIButton*)btn {
    if (_eventSink != NULL) {
        _eventSink(@"clicked eventSink button");
    }
}

#pragma mark <PlatformView>
- (UIView *)view {
    return _view;
}

#pragma mark <FlutterStreamHandler>
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    //typedef void (^FlutterEventSink)(id _Nullable event);
    _eventSink = events;
    return NULL;
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    _eventSink = NULL;
    return NULL;
}

@end

@implementation DemoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor grayColor];
        _sendTextField = [[UITextField alloc]init];
        [_sendTextField setPlaceholder:@"input message send to flutter"];
        [_sendTextField setBorderStyle:UITextBorderStyleRoundedRect];
        _sendButton = [[UIButton alloc]init];
        [_sendButton setTitle:@"send message to flutter" forState:UIControlStateNormal];
        _recieveTextField = [[UITextField alloc]init];
        [_recieveTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [_recieveTextField setPlaceholder:@"recieve message from flutter"];
        [_sendButton setBackgroundColor: [UIColor blueColor]];
        
        _recieveButton = [[UIButton alloc]init];
        [_recieveButton setTitle:@"eventSinkButton" forState:UIControlStateNormal];
         [_recieveButton setBackgroundColor:[UIColor blueColor]];
        
        [self addSubview:_sendTextField];
        [self addSubview:_sendButton];
        [self addSubview:_recieveTextField];
        [self addSubview:_recieveButton];
        
        _sendTextField.translatesAutoresizingMaskIntoConstraints = false;
        _sendButton.translatesAutoresizingMaskIntoConstraints = false;
        _recieveTextField.translatesAutoresizingMaskIntoConstraints = false;
        _recieveButton.translatesAutoresizingMaskIntoConstraints = false;
        
        _sendTextField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        NSArray<NSLayoutConstraint*>* constraints = @[
         [_sendTextField.topAnchor constraintEqualToAnchor:self.topAnchor constant:10.0],
         [_sendTextField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:10.0],
         [_sendTextField.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-20.0],
         [_sendTextField.heightAnchor constraintEqualToConstant:30.0],
         
         [_sendButton.topAnchor constraintEqualToAnchor:_sendTextField.bottomAnchor constant:10.0],
         [_sendButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:10.0],
         [_sendButton.heightAnchor constraintEqualToConstant:30.0],
         [_sendTextField.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-20.0],
         
          [_recieveTextField.topAnchor constraintEqualToAnchor:_sendButton.bottomAnchor constant:10.0],
         [_recieveTextField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:10.0],
         [_recieveTextField.heightAnchor constraintEqualToConstant:30.0],
           [_sendTextField.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-20.0],
         
         [_recieveButton.topAnchor constraintEqualToAnchor:_recieveTextField.bottomAnchor constant:10.0],
         [_recieveButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:10.0],
         [_recieveButton.heightAnchor constraintEqualToConstant:30.0],
         ];
        [NSLayoutConstraint activateConstraints:constraints];
    }
        
   return self;
 
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setNeedsUpdateConstraints];
}
@end

