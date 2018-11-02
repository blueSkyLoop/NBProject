//
//  SubclassButton+color.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "SubclassButton+color.h"

@implementation SubclassButton (color)

+ (void)initialize
{
    NSLog(@"%@ \tcolor initialize",[self class]);
}

+ (void)load
{
    NSLog(@"%@ \tcolor load",[self class]);
}

- (void)setColor:(UIColor *)color
{
    self.backgroundColor = color;
}

@end
