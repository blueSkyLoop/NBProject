//
//  MidStudent.m
//  NBProject
//
//  Created by Lucas on 2018/8/28.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "MidStudent.h"
#import "MHMacrosLog.h"
@implementation MidStudent

- (instancetype)init {
    self = [super init];
    if (self) {
        // 访问成员变量可以通过 sekf->变量名字，也可以直接通过变量名字去访问
//        self->_age ;
        self->_name = @"傻逼";
        _name = @"索嗨";
        _source = 99 ;
        NSLog(_name);
        NSLog([NSString stringWithFormat:@"%ld",_source]);
    }return self;
}

@end
