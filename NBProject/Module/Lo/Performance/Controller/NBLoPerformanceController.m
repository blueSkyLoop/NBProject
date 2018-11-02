//
//  NBLoPerformanceController.m
//  NBProject
//
//  Created by Lucas on 2018/8/22.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoPerformanceController.h"

@interface NBLoPerformanceController ()

@end

@implementation NBLoPerformanceController

- (void)nb_setDataSource {
    NSDictionary *YYFPS = @{@"title":@"YYFPS检测帧数",@"className":@"NBLoYYFPSController"};
    NSDictionary *LoadingRate = @{@"title":@"页面加载速率",@"className":@"NBLoRateController"};
    NSArray *dics = @[YYFPS,LoadingRate];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
