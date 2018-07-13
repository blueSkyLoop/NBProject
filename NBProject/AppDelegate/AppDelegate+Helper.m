//
//  AppDelegate+Helper.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "AppDelegate+Helper.h"
#import "NBTabBarController.h"
#import "IQKeyboardManager.h"
#import <Bugly/Bugly.h>
@implementation AppDelegate (Helper)

- (void)nb_enterMianUI {
    self.window.rootViewController = [[NBTabBarController alloc] init];
}

- (void)nb_keyBoardConfig {
    //keyboard
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)nb_bugly {
    BuglyConfig *config = [[BuglyConfig alloc]init];
    config.viewControllerTrackingEnable = YES;
    config.unexpectedTerminatingDetectionEnable = YES;
    config.blockMonitorEnable = YES;
    
    NSString *buglyKey = @"55041713-239d-47ab-b439-7b3a55fd5eb4";
    [Bugly startWithAppId:buglyKey config:config];
}
@end
