//
//  NBLoMethodSwizzlingController.m
//  NBProject
//
//  Created by Lucas on 2018/8/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMethodSwizzlingController.h"
#import "NBLoBoy.h"
#import "NBLoGirl.h"

@interface NBLoMethodSwizzlingController ()

@end

@implementation NBLoMethodSwizzlingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self boy];
}

- (void)boy{
    NBLoBoy *b = [NBLoBoy new];
    [b playLady];
}


@end
