//
//  NBLoMainController.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainController.h"
#import "NBComHeaderFile.h"

@interface NBLoMainController ()

@end

@implementation NBLoMainController


- (void)viewDidLoad {
    [super viewDidLoad];
//    AdjustsScrollViewInsetNever(self, self.tableView);
}

- (void)nb_setDataSource {
    NSDictionary *gcdDic = @{@"title":@"多线程",@"className":@"NBLoGCDController"};
    NSDictionary *UIDic = @{@"title":@"UI",@"className":@"NBLoUIController"};
    NSDictionary *sqlDic = @{@"title":@"SQL",@"className":@"NBLoSQLController"};
    NSDictionary *otherDic = @{@"title":@"其他",@"className":@"NBLoOtherController"};
    
    NSArray *dics = @[gcdDic,UIDic,sqlDic,otherDic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end
