//
//  NBSQLListController.m
//  NBProject
//
//  Created by Lucas on 2018/7/26.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoSQLController.h"

@interface NBLoSQLController ()

@end

@implementation NBLoSQLController

- (void)nb_setDataSource {
    NSDictionary *fmdbDic = @{@"title":@"FMDB",@"className":@"NBFMDBController"};
    NSDictionary *realmDic = @{@"title":@"Realm",@"className":@"NBRealmController"};
    NSArray *dics = @[fmdbDic,realmDic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}
@end