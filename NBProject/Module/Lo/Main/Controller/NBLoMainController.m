//
//  NBLoMainController.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainController.h"
#import "NBComHeaderFile.h"
#import "NBDeviceManager.h"
@interface NBLoMainController ()

@end

@implementation NBLoMainController


- (void)viewDidLoad {
    [super viewDidLoad];

   
   
}

- (void)nb_setDataSource {
    
    NSDictionary *racDic = @{@"title":@"Rac",@"className":@"NBLoRacListController"};
    NSDictionary *gcdDic = @{@"title":@"多线程",@"className":@"NBLoThreadListController"};
    NSDictionary *UIDic = @{@"title":@"UI",@"className":@"NBLoUIController"};
    NSDictionary *sqlDic = @{@"title":@"SQL",@"className":@"NBLoSQLController"};
    NSDictionary *perDic = @{@"title":@"性能优化",@"className":@"NBLoPerformanceController"};
    NSDictionary *runtimeDic = @{@"title":@"Runtime",@"className":@"NBLoRuntimeListController"};
    NSDictionary *ConceptDic = @{@"title":@"概念",@"className":@"NBLoConceptListController"};
    NSDictionary *otherDic = @{@"title":@"其他",@"className":@"NBLoOtherController"};
    
    
    NSArray *dics = @[racDic,gcdDic,UIDic,sqlDic,perDic,runtimeDic,ConceptDic,otherDic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end
