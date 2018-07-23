//
//  NBUIViewModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/19.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBUIViewModel.h"
#import "NBControllerModel.h"
@implementation NBUIViewModel

- (void)mh_initialize {
    NSDictionary *masonry =  @{@"title":@"masonry",@"className":@"NBBaseMasonryController"};;
    NSArray *dics = @[masonry];
    [self.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

@end
