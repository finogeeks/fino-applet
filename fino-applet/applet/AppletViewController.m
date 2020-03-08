//
//  AppletViewController.m
//  MyApplet
//
//  Created by 杨涛 on 2020/2/13.
//  Copyright © 2020 finogeeks. All rights reserved.
//

#import "AppletViewController.h"
#import <WebKit/WebKit.h>

@interface AppletViewController ()<WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;


@end

@implementation AppletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *imgClose = [UIImage imageNamed:@"miniapps_close_dark"];
    
    [cancleButton setImage:imgClose forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    WKUserContentController *userContentController = [WKUserContentController new];
    NSString *souce = @"window.__fcjs_environment='miniprogram'";
    WKUserScript *script = [[WKUserScript alloc] initWithSource:souce injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:true];
    [userContentController addUserScript:script];
    [userContentController addScriptMessageHandler:self name:@"publishHandler"];
    
    WKWebViewConfiguration *wkWebViewConfiguration = [WKWebViewConfiguration new];
    wkWebViewConfiguration.allowsInlineMediaPlayback = YES;
    wkWebViewConfiguration.userContentController = userContentController;
    
    if (@available(iOS 9.0, *)) {
        [wkWebViewConfiguration.preferences setValue:@(true) forKey:@"allowFileAccessFromFileURLs"];
    }
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
//    preferences.minimumFontSize = 40.0;
    wkWebViewConfiguration.preferences = preferences;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:wkWebViewConfiguration];
    self.webView.clipsToBounds = YES;
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    [self.view addSubview:self.webView];
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"view.html" ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
    [self.webView loadFileURL:fileURL allowingReadAccessToURL:fileURL];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (void)onClose:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)callSubscribeHandlerWithEvent:(NSString *)eventName param:(NSString *)jsonParam
{
    NSString *js = [NSString stringWithFormat:@"FinChatJSBridge.subscribeHandler('%@',%@)",eventName,jsonParam];
    [self evaluateJavaScript:js completionHandler:nil];
    
    
}

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void(^)(id result,NSError *error))completionHandler
{
    
    [self.webView evaluateJavaScript:javaScriptString completionHandler:completionHandler];
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"publishHandler"]) {
        NSString *e = message.body[@"event"];
        [self.service callSubscribeHandlerWithEvent:e param:message.body[@"paramsString"]];
    }
}
@end
