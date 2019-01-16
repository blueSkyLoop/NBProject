//
//  NBLoRacController.m
//  NBProject
//
//  Created by Lucas on 2019/1/11.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoRacListController.h"

@interface NBLoRacListController ()

@end

@implementation NBLoRacListController

- (void)nb_setDataSource {
    NSDictionary *racDic = @{@"title":@"RAC底层原理分析上",@"className":@"NBLoRacBottomController"};
    NSDictionary *loginDic = @{@"title":@"RAC代码总结，登录界面",@"className":@"NBLoRacLoginController"};
    
    NSArray *dics = @[racDic,loginDic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
