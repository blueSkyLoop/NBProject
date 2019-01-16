//
//  NSObject+MethodSwizzling.h
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/20.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (MethodSwizzling)


/**
 交换两个实例方法
 */
+ (void)nb_exchangeInstanceOriginSEL:(SEL)originSEl currentSEL:(SEL)currentSEL;
/**
 交换两个类方法
 */
+ (void)nb_exchangeClassOriginSEL:(SEL)originSEL currentSEL:(SEL)currentSEL;

@end


