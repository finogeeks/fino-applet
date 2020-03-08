//
//  ViewController.m
//  MyApplet
//
//  Created by 杨涛 on 2020/2/13.
//  Copyright © 2020 finogeeks. All rights reserved.
//

#import "ViewController.h"
#import "AppletService.h"
#import <WebKit/WebKit.h>
#import <FinApplet/FinApplet.h>


@interface ViewController ()
@property (nonatomic, strong) AppletService *service;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    [btn setTitle:@"打开小程序" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onTestClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor clearColor];
    btn.tintColor = [UIColor redColor];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:10.0];
    [btn.layer setBorderWidth:1.0];
    [btn.layer setBorderColor: [UIColor grayColor].CGColor];
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
       [btn1 setTitle:@"打开画图小程序" forState:UIControlStateNormal];
       [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [btn1 addTarget:self action:@selector(onCanvasClick:) forControlEvents:UIControlEventTouchUpInside];
       btn1.backgroundColor = [UIColor orangeColor];
       btn1.tintColor = [UIColor redColor];
       [btn1.layer setMasksToBounds:YES];
       [btn1.layer setCornerRadius:10.0];
       [btn1.layer setBorderWidth:1.0];
       [btn1.layer setBorderColor: [UIColor grayColor].CGColor];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 200, 40)];
       [btn2 setTitle:@"打开官方小程序" forState:UIControlStateNormal];
       [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [btn2 addTarget:self action:@selector(onDemoClick:) forControlEvents:UIControlEventTouchUpInside];
       btn2.backgroundColor = [UIColor orangeColor];
       btn2.tintColor = [UIColor redColor];
       [btn2.layer setMasksToBounds:YES];
       [btn2.layer setCornerRadius:10.0];
       [btn2.layer setBorderWidth:1.0];
       [btn2.layer setBorderColor: [UIColor grayColor].CGColor];
    
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
       [btn3 setTitle:@"智能对账单" forState:UIControlStateNormal];
       [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [btn3 addTarget:self action:@selector(onProfileClick:) forControlEvents:UIControlEventTouchUpInside];
       btn3.backgroundColor = [UIColor orangeColor];
       btn3.tintColor = [UIColor redColor];
       [btn3.layer setMasksToBounds:YES];
       [btn3.layer setCornerRadius:10.0];
       [btn3.layer setBorderWidth:1.0];
       [btn3.layer setBorderColor: [UIColor grayColor].CGColor];
    
    [self.view addSubview:btn];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    
}
- (void)onTestClick:(id)sender {
    
    self.service = [[AppletService alloc] init];
    [self.service startApplet:self.navigationController];
}

- (void)onFinAppletClick:(id)sender {
    NSString *appId = @"5e4d123647edd60001055df1";
    // 打开小程序
    [[FATClient sharedClient] startRemoteApplet:appId startParams:nil InParentViewController:self completion:^(BOOL result, NSError *error) {
        NSLog(@"result:%d---error:%@", result, error);
    }];
}

- (void)onCanvasClick:(id)sender {
    
    NSString *appId = @"5e3c147a188211000141e9b1";
    // 打开小程序
    [[FATClient sharedClient] startRemoteApplet:appId startParams:@{
        @"path": @"/pages/index/index",
        @"query": @""
    } InParentViewController:self completion:^(BOOL result, NSError *error) {
        NSLog(@"result:%d---error:%@", result, error);
    }];
}

- (void)onDemoClick:(id)sender {
    
    NSString *appId = @"5e4d123647edd60001055df1";
    // 打开小程序
    [[FATClient sharedClient] startRemoteApplet:appId startParams:nil InParentViewController:self completion:^(BOOL result, NSError *error) {
        NSLog(@"result:%d---error:%@", result, error);
    }];
}

- (void)onProfileClick:(id)sender {
    
    NSString *appId = @"5e637a18cbfae4000170fa7a";
    // 打开小程序
    [[FATClient sharedClient] startRemoteApplet:appId startParams:nil InParentViewController:self completion:^(BOOL result, NSError *error) {
        NSLog(@"result:%d---error:%@", result, error);
    }];
}

@end
