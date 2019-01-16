//
//  TestButton.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "TestButton.h"
#import "NSObject+MethodSwizzling.h"

@implementation TestButton

+ (void)initialize
{
    NSLog(@"%@ \t\tinitialize",[self class]);
}

+ (void)load
{
    NSLog(@"%@ \t\tload",[self class]);
    [self nb_exchangeInstanceOriginSEL:NSSelectorFromString(@"dealloc") currentSEL:@selector(xl_dealloc)];
}

- (void)xl_dealloc
{ 
    NSLog(@"TestButton %s",__func__);
    [self xl_dealloc];
}

- (void)testButtonLog
{
    NSLog(@"TestButton %s",__func__);
}

@end
