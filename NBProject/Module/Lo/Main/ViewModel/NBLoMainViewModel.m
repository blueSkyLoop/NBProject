//
//  NBLoMainViewModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainViewModel.h"
#import "NBLoGCDController.h"
@implementation NBLoMainViewModel
- (void)mh_initialize {
    [self.dataSoure addObjectsFromArray:@[@"NBLoGCDController",
                                          @"NBLoGCDController"]];
}
@end
