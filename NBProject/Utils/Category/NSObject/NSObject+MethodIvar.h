//
//  NSObject+MethodIvar.h
//  NBProject
//
//  Created by Lucas on 2018/8/29.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (MethodIvar)

// 获取一个对象所有属性以及属性的类型
- (Ivar *)nb_objectWithIvars:(id)obj;

// 获取一个类内部的所有方法（注意：被获取的方法必须要有实现并且是公开的！）
- (Method *)nb_objectWithMethods:(id)obj;


@end

