//
//  NSObject+MethodSwizzling.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/20.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "NSObject+MethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzling)

#pragma mark    -   交换两个方法的实现
/**
 交换两个实例方法
 */
+ (void)nb_exchangeInstanceMethod1:(SEL)originalSelector method2:(SEL)swizzledSelector
{
    Class class = [self class]; // 这个地方要注意
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

/**
 交换两个类方法
 */
+ (void)nb_exchangeClassMethod1:(SEL)originalSelector method2:(SEL)swizzledSelector
{
    Class class = object_getClass((id)self); // 这个地方要注意
    Class class2 = [self class];
#ifdef DEBUG
    NSLog(@" class = %@ , class hash = %zd",class,[class hash]);
    NSLog(@" class2 = %@ , class2 hash = %zd",class2,[class2 hash]);
#endif
    
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



@end
