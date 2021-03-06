//
//  NBHttpConfig.m
//  LaiKeBaoNew
//
//  Created by lgh on 2017/12/14.
//  Copyright © 2017年 lgh. All rights reserved.
//

#import "NBHttpConfig.h"

@implementation NBHttpConfig

+ (NBHttpConfig *)defaultHttpConfig{
    NBHttpConfig *config = [[NBHttpConfig alloc] initWithDefaultHttpConfig];
    return config;
}

//返回一个默认配置的请求配置
- (id)initWithDefaultHttpConfig{
    self = [super init];
    if(self){
        self.method = LNRequestMethodPost;
        self.needShow = YES;
        self.checkClassName = NSStringFromClass([NSDictionary class]);
        self.errorShowMessage = YES;
    }
    return self;
}

@end
