//
//  NBLoBoy.m
//  NBProject
//
//  Created by Lucas on 2018/12/14.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoBoy.h"

#import "NBLoGirl.h"

#import <objc/runtime.h>
@implementation NBLoBoy


- (void)playFootBall {
    NSLog(@"踢足球");
}

- (void)playGuitar {
    NSLog(@"弹吉他");
}


static void goToYourGrandfather (id self ,SEL cmd ,id value){
     NSLog(@"去你大爷的 %@", value);
}

void unrecognizedSelector (){
    NSLog(@"unrecognizedSelector");
}


// 实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 若传进来的方法，只是声明了，没被实现； 可以用一个备用函数来防止崩溃
//    NSMethodSignature *sign = [NSMethodSignature methodSignatureForSelector:sel];
//    if (!sign) {
//        class_addMethod([self class], sel, (IMP)goToYourGrandfather, "v@:@");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

// 类方法
+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSMethodSignature *sign = [NSMethodSignature methodSignatureForSelector:aSelector];
    if (!sign) {
        NBLoGirl *girl = [NBLoGirl new];
    // 将 NBLoBoy里,未实现的 playLady 方法 转移到 NBLoGirl 里 playLady 的面去执行
        if ([girl respondsToSelector:aSelector]) {
            return girl;
        }
    }
    return [self forwardingTargetForSelector:aSelector];
}

@end
