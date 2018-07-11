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
    
    
    [self nb_setUI];
    [self nb_bindViewModel];
}

- (void)resetBackNaviItem {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(nb_naviBack)];
    self.navigationItem.leftBarButtonItem = backItem ;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)nb_naviBack {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)nb_setUI {
    
}

- (void)nb_bindViewModel {
    
}
@end
