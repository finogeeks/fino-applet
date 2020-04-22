//
//  AppDelegate.m
//  MyApplet
//
//  Created by 杨涛 on 2020/2/13.
//  Copyright © 2020 finogeeks. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <FinApplet/FinApplet.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *appKey = @"22LyZEib0gLTQdU3MUauAR1TgQsjmhH3rHM7vRrbY6UA";
    FATConfig *config = [FATConfig configWithAppSecret:@"9628ad1684944587" appKey:appKey];
    config.apiServer = @"https://mp.finogeeks.com";
    config.apiPrefix = @"/api/v1/mop";
    
    [[FATClient sharedClient] initWithConfig:config error:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init] ];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
