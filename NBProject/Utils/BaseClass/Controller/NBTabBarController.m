//
//  NBTabBarController.m
//  NBProject
//
//  Created by Lucas on 2018/7/11.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBTabBarController.h"

@interface NBTabBarController ()<UITabBarControllerDelegate>

@end

@implementation NBTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}
/** 防止在同一个 tabbar上，快速多次点击 tabbar 导致不良反应*/
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    UIViewController *selectVC = tabBarController.selectedViewController;
    if ([selectVC isEqual:viewController]) {
        return NO;
    }
    return YES;
}

@end
