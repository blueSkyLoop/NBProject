//
//  NBNavigationController.m
//  NBProject
//
//  Created by Lucas on 2018/7/9.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBNavigationController.h"

@interface NBNavigationController ()<UINavigationControllerDelegate>

@end

@implementation NBNavigationController

+ (void)load {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // do something
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}


@end
