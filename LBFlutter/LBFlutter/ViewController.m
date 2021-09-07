//
//  ViewController.m
//  LBFlutter
//
//  Created by 理享学 on 2021/6/28.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()<FlutterStreamHandler>

@property (nonatomic, strong) UIView* navView;

@property (nonatomic, strong) FlutterViewController *flutterViewController;
@property (nonatomic, strong) FlutterMethodChannel *methodChannel;

@property (nonatomic, copy) FlutterEventSink eventSink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
        
    self.title = @"Flutter与iOS交互";
        UIButton *button = [UIButton new];
        button.frame = CGRectMake(100, 200, 200, 30);
        [button setTitle:@"点击打开Flutter" forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.grayColor];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(itemClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = [UIButton new];
        [button2 setTitle:@"点击向Flutter发送消息" forState:UIControlStateNormal];
        [button2 setBackgroundColor:UIColor.grayColor];
        
        button2.frame = CGRectMake(100, 300, 200, 30);
//        [self.view addSubview:button2];
        [button2 addTarget:self action:@selector(itemClickx) forControlEvents:UIControlEventTouchUpInside];
}

-(void)itemClickx{
    //发消息给flutter
//    [self.methodChannel invokeMethod:@"MSGChannel" arguments:@"我是iOS发送过来的消息"];
}

-(void)itemClick{
    [self openFlutterViewController];
}

-(void)openFlutterViewController{
    //初始化FlutterViewController
    self.flutterViewController = [[FlutterViewController alloc] init];
    //为FlutterViewController指定路由以及路由携带的参数
    [self.flutterViewController setInitialRoute:@"{\"msg\":\"88\"}"];
    
    //设置模态跳转满屏显示
//    self.flutterViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:self.flutterViewController animated:YES completion:nil];
    
    NSString *eventChannelName = @"MSGEvent";
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:self.flutterViewController.binaryMessenger];
    [eventChannel setStreamHandler:self];
    
    [self.navigationController pushViewController:self.flutterViewController animated:YES];
    self.navigationController.navigationBarHidden = YES;
    
    //创建MethodChannel消息
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"MSGChannel" binaryMessenger:self.flutterViewController.binaryMessenger];
    
    self.methodChannel = methodChannel;
    
    //监听返回
    __weak typeof(self) weakself = self;
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        __strong typeof(weakself) strongself = weakself;
        //dissmiss当前页面
        if([call.method isEqualToString:@"dismiss"]){
            NSLog(@"--------------");
            [strongself.navigationController popViewControllerAnimated:YES];
            self.navigationController.navigationBarHidden = NO;
//            [strongself dismissViewControllerAnimated:YES completion:nil];
        }
        if (result) {
            result(@"成功关闭页面");
        }
    }];
}

#pragma mark - <FlutterStreamHandler>
//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
-(FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    
    self.eventSink = events;
    // arguments flutter监听时,给native传送的参数
    if (self.eventSink) {
        self.eventSink(@"原生push到fluttet页面,传给flutter的值");
    }
    return nil;
}

// flutter不再接收
-(FlutterError *)onCancelWithArguments:(id)arguments{
    
    //
    self.eventSink = nil;
    return nil;
}

- (UIView *)navView {
    if (!_navView) {
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        _navView.backgroundColor = [UIColor whiteColor];
    }
    return _navView;
}

@end
