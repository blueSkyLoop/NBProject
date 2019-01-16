//
//  NSObject+MethodIvar.m
//  NBProject
//
//  Created by Lucas on 2018/8/29.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NSObject+MethodIvar.h"

@implementation NSObject (MethodIvar)

-(Ivar*)nb_objectWithIvars:(id)obj{
    
    unsigned int numIvars; //成员变量个数
    Ivar *vars = class_copyIvarList([obj class], &numIvars);
    
#ifdef DEBUG
    NSString *key = nil;
    NSString *type = nil;
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];  //获取成员变量的名字
        type = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)]; //获取成员变量的数据类型
        NSLog(@"variable name :%@\ntype:%@", key,type);
        
//        NSLog(@"variable type :%@", type);
    }
#endif

    
    return vars ;
}

-(Method*)nb_objectWithMethods:(id)obj{
    Method *meth = [self nb_objectWithCopyMethodList:obj];
    return meth ;

}



-(Method*)nb_objectWithCopyMethodList:(id)obj{
    unsigned int numIvars; //成员变量个数
    Method *meth = class_copyMethodList([obj class], &numIvars);
    
#ifdef DEBUG
    for(int i = 0; i < numIvars; i++) {
        Method thisIvar = meth[i];
        SEL sel = method_getName(thisIvar);
        const char *name = sel_getName(sel);
        NSLog(@"zp method :%s", name);
    }
#endif
    return meth ;
}



@end
