//
//  NBNavigationController.m
//  NBProject
//
//  Created by Lucas on 2018/7/9.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBNavigationController.h"
#import "NBMacros.h"
@interface NBNavigationController ()<UINavigationControllerDelegate>

@end

@implementation NBNavigationController

+ (void)load {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:MRGBColor(123, 208, 244)];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // 导航栏标题颜色设置
    [self.navigationBar setTitleTextAttributes:
      @{NSFontAttributeName:[UIFont systemFontOfSize:18],
        NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.topViewController.preferredStatusBarStyle;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // do something
    if (self.childViewControllers.count) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popBack)];
        viewController.navigationItem.leftBarButtonItem = backItem ;
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popBack {
    [self popViewControllerAnimated:YES];
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
