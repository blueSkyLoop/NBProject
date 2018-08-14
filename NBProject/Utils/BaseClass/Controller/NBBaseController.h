//
//  NBBaseController.h
//  NBProject
//
//  Created by Lucas on 2018/7/11.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBMacros.h"
@interface NBBaseController : UIViewController


// 返回按钮样式设置
- (void)resetBackNaviItem ;

- (void)nb_showNavigateionStyIeIines:(BOOL)isShow ;

#pragma mark - 子类重写以下方法
// 初始化UI
- (void)nb_setUI;

// 绑定 viewModel
- (void)nb_bindViewModel;

// 返回方法重设
- (void)nb_naviBack;

@end
