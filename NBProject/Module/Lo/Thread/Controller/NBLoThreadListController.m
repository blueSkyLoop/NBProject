//
//  NBLoThreadListController.m
//  NBProject
//
//  Created by Lucas on 2018/8/9.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoThreadListController.h"

@interface NBLoThreadListController ()

@end

@implementation NBLoThreadListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)nb_setDataSource {
    NSDictionary *gcdDic = @{@"title":@"GCD",@"className":@"NBLoGCDController"};
    NSDictionary *operation = @{@"title":@"NSOperation",@"className":@"NBLoOperationController"};
    NSDictionary *thread = @{@"title":@"NSThread",@"className":@"NBLoThreadController"};
    NSDictionary *interView = @{@"title":@"线程面试题",@"className":@"NBLoInterViewController"};
    
    NSArray *dics = @[gcdDic,operation,thread,interView];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end
