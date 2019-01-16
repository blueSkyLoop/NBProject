//
//  NBLoConceptListController.m
//  NBProject
//
//  Created by Lucas on 2018/8/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoConceptListController.h"

@interface NBLoConceptListController ()

@end

@implementation NBLoConceptListController

- (void)nb_setDataSource {
    NSDictionary *categoryDic = @{@"title":@"类别、扩展、继承",@"className":@"NBLoCategoryController"};
    NSDictionary *proDic = @{@"title":@"成员变量、属性",@"className":@"NBLoPropertyController"};
    NSDictionary *initDic = @{@"title":@"Initialize、Load加载顺序",@"className":@"NBLoInitializeLoadController"};
    NSDictionary *kDic = @{@"title":@"KVC,KVO",@"className":@"NBLoKvcKvoController"};
    
    NSDictionary *pDic = @{@"title":@"协议",@"className":@"NBLoProtocolController"};
    NSDictionary *customKVODic = @{@"title":@"自定义KVO",@"className":@"NBLoCustomKVOController"};
    NSDictionary *containerKVODic = @{@"title":@"KVO容器类",@"className":@"NBLoContainerKVOController"};
    
    NSArray *dics = @[categoryDic,proDic,initDic,kDic,pDic,customKVODic,containerKVODic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
