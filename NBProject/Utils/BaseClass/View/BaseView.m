//
//  BaseView.m
//  NBProject
//
//  Created by Lucas on 2018/7/9.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+ (id)loadViewFromXib {
    UIView * aview = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
    return aview;
}

@end
