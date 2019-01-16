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
+ (void)nb_exchangeInstanceOriginSEL:(SEL)originSEl currentSEL:(SEL)currentSEL
{
    Class class = [self class]; // 这个地方要注意
    Method originalMethod = class_getInstanceMethod(class, originSEl);
    Method swizzledMethod = class_getInstanceMethod(class, currentSEL);
    
    BOOL didAddMethod = class_addMethod(class, originSEl, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, currentSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

/**
 交换两个类方法
 */
+ (void)nb_exchangeClassOriginSEL:(SEL)originSEL currentSEL:(SEL)currentSEL
{
    Class class = object_getClass((id)self); // 这个地方要注意
    Class class2 = [self class];
#ifdef DEBUG
    NSLog(@" class = %@ , class hash = %zd",class,[class hash]);
    NSLog(@" class2 = %@ , class2 hash = %zd",class2,[class2 hash]);
#endif
    
    Method originalMethod = class_getClassMethod(class, originSEL);
    Method swizzledMethod = class_getClassMethod(class, currentSEL);
    
    BOOL didAddMethod = class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, currentSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



@end
