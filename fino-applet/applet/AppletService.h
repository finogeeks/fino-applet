//
//  AppletService.h
//  MyApplet
//
//  Created by 杨涛 on 2020/2/13.
//  Copyright © 2020 finogeeks. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppletService : NSObject

-(void)startApplet:(UINavigationController*)nav;

- (void)callSubscribeHandlerWithEvent:(NSString *)eventName param:(NSString *)param ;
@end

NS_ASSUME_NONNULL_END
