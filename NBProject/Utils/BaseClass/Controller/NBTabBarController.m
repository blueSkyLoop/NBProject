//
//  NBTabBarController.m
//  NBProject
//
//  Created by Lucas on 2018/7/11.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBTabBarController.h"
#import "NBNavigationController.h"
#import "NBLoMainController.h"
#import "NBBeelinMainController.h"

#import "NBMacros.h"

@interface NBTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) NSMutableArray  *navControllers;
@end

@implementation NBTabBarController

#pragma mark - Life Cycle
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (instancetype)init {
    if (self = [super init]) {
        self.viewControllers = self.navControllers;
        self.delegate = self;
    }return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //设置未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MColorTitle, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    //设置选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

}



#pragma mark - UITabBarControllerDelegate
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


#pragma mark - Getter
- (NSMutableArray *)navControllers {
    if (!_navControllers) {
        _navControllers = [NSMutableArray array];
        NBNavigationController *lo = [[NBNavigationController alloc] initWithController:[NBLoMainController new] title:@"Lo" image:@"LoMain_Normal" selectedImage:@"LoMain_Selected"];
        NBNavigationController *beelin = [[NBNavigationController alloc] initWithController:[NBBeelinMainController new] title:@"Beelin" image:@"Kite_Normal" selectedImage:@"Kite_Selected"];
        [_navControllers addObjectsFromArray:@[lo,beelin]];
    }return _navControllers;
}
@end
