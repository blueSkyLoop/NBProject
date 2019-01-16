//
//  UINavigationController+LoLeaks.m
//  NBProject
//
//  Created by Lucas on 2018/12/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "UINavigationController+LoLeaks.h"
#import <objc/runtime.h>
const char * LoPopFlag = "LoVCPopFlag";
@implementation UINavigationController (LoLeaks)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originSel  = class_getInstanceMethod([self class], @selector(popViewControllerAnimated:));
        
        Method currentSel = class_getInstanceMethod([self class], @selector(nb_popViewControllerAnimated:));

        method_exchangeImplementations(originSel, currentSel);
    });
}



- (UIViewController *)nb_popViewControllerAnimated:(BOOL)animated {
    UIViewController *popViewController = [self nb_popViewControllerAnimated:animated];
    extern const char *LoPopFlag;
    objc_setAssociatedObject(popViewController, LoPopFlag, @(YES), OBJC_ASSOCIATION_ASSIGN);
    return popViewController;
}
@end
