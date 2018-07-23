//
//  NBControllerModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/17.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBControllerModel.h"

@implementation NBControllerModel

+ (instancetype)controllerModelWithTitle:(NSString *)title className:(NSString *)className {
    NBControllerModel *model = [NBControllerModel new];
    model.title = title;
    model.className = className;
    return model;
}


+ (NSArray *)controllersWithDics:(NSArray *)dics{
    
    NSMutableArray *m = [NSMutableArray array];
    
    for (NSDictionary * dic in dics) {
            NBControllerModel *d = [NBControllerModel controllerModelWithTitle:dic[@"title"] className:dic[@"className"]];
        [m addObject:d];
    }
    return m;
}

@end
