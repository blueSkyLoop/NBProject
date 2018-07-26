//
//  NBLoUIController.m
//  NBProject
//
//  Created by Lucas on 2018/7/19.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoUIController.h"

@interface NBLoUIController ()

@end

@implementation NBLoUIController



- (void)nb_setDataSource {
    NSDictionary *masonry =  @{@"title":@"masonry",@"className":@"NBBaseMasonryController"};;
    NSArray *dics = @[masonry];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end
