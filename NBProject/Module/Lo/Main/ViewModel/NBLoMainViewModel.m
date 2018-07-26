//
//  NBLoMainViewModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainViewModel.h"
#import "NBControllerModel.h"


@implementation NBLoMainViewModel
- (void)mh_initialize {
    NSDictionary *gcdDic = @{@"title":@"多线程",@"className":@"NBLoGCDController"};
    NSDictionary *UIDic = @{@"title":@"UI",@"className":@"NBUIController"};
    NSDictionary *CallDic = @{@"title":@"获取通话记录",@"className":@"NBLoCallPhoneHistoryController"};
    
    NSArray *dics = @[gcdDic,UIDic,CallDic];

    [self.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end




