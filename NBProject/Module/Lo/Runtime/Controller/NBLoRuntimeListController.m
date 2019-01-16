//
//  NBLoRuntimeListController.m
//  NBProject
//
//  Created by Lucas on 2018/8/29.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoRuntimeListController.h"
#import <objc/objc.h>
@interface NBLoRuntimeListController ()

@end

@implementation NBLoRuntimeListController


- (void)nb_setDataSource {
    NSDictionary *Method = @{@"title":@"属性、方法遍历",@"className":@"NBLoRuntimeMethodController"};
    NSDictionary *Method1 = @{@"title":@"方法交互",@"className":@"NBLoMethodSwizzlingController"};
    
    NSArray *dics = @[Method,Method1];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
