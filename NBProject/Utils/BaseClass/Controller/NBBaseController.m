//
//  NBBaseController.m
//  NBProject
//
//  Created by Lucas on 2018/7/11.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseController.h"

@interface NBBaseController ()

@end

@implementation NBBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self nb_setUI];
    [self nb_bindViewModel];
    [self nb_showNavigateionStyIeIines:NO];
    //    [self resetBackNaviItem];
}

// 返回按钮
- (void)resetBackNaviItem {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(nb_naviBack)];
    self.navigationItem.leftBarButtonItem = backItem ;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

// 忽略-导航栏分割线
- (void)nb_showNavigateionStyIeIines:(BOOL)isShow{
    [self.navigationController.navigationBar setValue:@(isShow)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle = isShow ? UIBarStyleDefault : UIBarStyleBlackTranslucent;
}

- (void)nb_naviBack {
    [self.navigationController popViewControllerAnimated:YES];
}

/* 父类重写以下方法 */
- (void)nb_setUI {
    
}

- (void)nb_bindViewModel {
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
