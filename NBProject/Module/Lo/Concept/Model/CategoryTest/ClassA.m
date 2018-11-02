//
//  ClassA.m
//  NBProject
//
//  Created by Lucas on 2018/8/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "ClassA.h"
#import <objc/runtime.h>

#import "ClassB.h"
#import "ClassC.h"

@implementation ClassA

- (id)forwardingTargetForSelector:(SEL)aSelector {
    ClassB * b = [ClassB new];
    ClassC * c = [ClassC new];
    
    
    if ([b respondsToSelector:aSelector]) {
        return b;
    }else if ([c respondsToSelector:aSelector]){
        return c;
    }
    return nil;
}

@end
