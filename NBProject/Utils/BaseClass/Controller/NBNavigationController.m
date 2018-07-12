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


/**
 * 初始化子控制器
 */
- (NBNavigationController *)initWithController:(UIViewController *)curreVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIViewController *vc = (UIViewController *)curreVC;
    
    // 设置文字和图片
    vc.title = title;
    [vc.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    return [[NBNavigationController alloc] initWithRootViewController:vc] ;
}


@end
