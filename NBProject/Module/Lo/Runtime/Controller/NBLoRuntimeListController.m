//
//  NBLoRuntimeListController.m
//  NBProject
//
//  Created by Lucas on 2018/8/29.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoRuntimeListController.h"

@interface NBLoRuntimeListController ()

@end

@implementation NBLoRuntimeListController


- (void)nb_setDataSource {
    NSDictionary *Method = @{@"title":@"属性、方法遍历",@"className":@"NBLoRuntimeMethodController"};
    NSArray *dics = @[Method];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
