//
//  UIViewController+LoLeaks.m
//  NBProject
//
//  Created by Lucas on 2018/12/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "UIViewController+LoLeaks.h"
#import <objc/runtime.h>
const char *LoVCPopFlag = "LoVCPopFlag";

@implementation UIViewController (LoLeaks)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self nb_exchangeInstanceOriginSEL:@selector(viewWillAppear:) currentSEL:@selector(nb_viewWillAppear:)];
        
        [self nb_exchangeInstanceOriginSEL:@selector(viewDidDisappear:) currentSEL:@selector(nb_viewDidDisappear:)];
        
    });
}

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



- (void)nb_viewWillAppear:(BOOL)animate {
    [self nb_viewWillAppear:animate];
    // 标识
    objc_setAssociatedObject(self, LoVCPopFlag, @(NO), OBJC_ASSOCIATION_ASSIGN);
}


- (void)nb_viewDidDisappear:(BOOL)animate {
    [self nb_viewDidDisappear:animate];
    if ([objc_getAssociatedObject(self, LoVCPopFlag) boolValue]) {
        [self nb_WillDealloc];
    }
}

- (void)nb_WillDealloc{
    // 给 nil 对象发送消息
    // pop - 回收内存
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"\n内存泄漏 ------ nb_NotDealloc : %@",NSStringFromClass([strongSelf class]));
    });
}

@end
