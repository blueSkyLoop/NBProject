//
//  UIViewController+LoadingRate.h
//  NBProject
//
//  Created by Lucas on 2018/9/6.
//  Copyright © 2018年 com.cn. All rights reserved.
//  测试界面打开速度

#import <UIKit/UIKit.h>

@interface UIViewController (LoadingRate)
@property(nonatomic,assign) CFAbsoluteTime viewLoadStartTime;
@end
