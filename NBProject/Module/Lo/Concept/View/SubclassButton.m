//
//  SubclassButton.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "SubclassButton.h"
#import <objc/runtime.h>
#import "NSObject+MethodSwizzling.h"
@implementation SubclassButton

+ (void)initialize
{
    NSLog(@"SubclassButton %@ initialize",[self class]);
}


#pragma mark    -   情景1: 推荐写法,调用class_addMethod方法,确保当前类有方法实现
/**
 *  说明:
 *  此写法结果: 方法交换只会交换SubclassButton类的testButtonLog方法 , TestButton类的testButtonLog方法不受任何影响
 *  SubclassButton类内可以实现也可以不实现testButtonLog方法 , 如果不实现testButtonLog方法class_getInstanceMethod(class, originalSelector)会获取到父类 TestButton 的testButtonLog方法实现,然后使用class_addMethod方法给SubclassButton添加testButtonLog方法的实现
 *
 */

+ (void)load
{
    NSLog(@"SubclassButton %@ load",[self class]);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(testButtonLog);
        SEL swizzledSelector = @selector(xl_testButtonLog);
        [self nb_exchangeInstanceMethod1:originalSelector method2:swizzledSelector];
    });
}

- (void)xl_testButtonLog
{
    NSLog(@"%s---叼你个死老王",__func__);
    [self xl_testButtonLog];
}

//- (void)testButtonLog
//{
//    NSLog(@"SubclassButton %s",__func__);
//}

#pragma mark    -   情景2.1: 有缺陷的写法,没有使用class_addMethod方法,但是不会闪退


//+ (void)load
//{
//    NSLog(@"SubclassButton %@ load",[self class]);
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(testButtonLog);
//        SEL swizzledSelector = @selector(xl_testButtonLog);
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    });
//    
//}
//
//- (void)xl_testButtonLog
//{
//    NSLog(@"%s",__func__);
//    [self xl_testButtonLog];
//}
//
//- (void)testButtonLog
//{
//    NSLog(@"SubclassButton %s",__func__);
//}

#pragma mark    -   情景2.2: 会闪退

//+ (void)load
//{
//    NSLog(@"SubclassButton %@ load",[self class]);
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(testButtonLog);
//        SEL swizzledSelector = @selector(xl_testButtonLog);
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    });
//
//}

//- (void)xl_testButtonLog
//{
//    NSLog(@"%s",__func__);
//    [self xl_testButtonLog];
//}

@end
