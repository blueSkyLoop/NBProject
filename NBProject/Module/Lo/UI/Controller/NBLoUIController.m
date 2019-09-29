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
    NSDictionary *masonry =  @{@"title":@"masonry",@"className":@"NBLoMasonryController"};
    NSDictionary *AnimationScroll =  @{@"title":@"AnimationScrollView",@"className":@"NBLoScrollAnimationController"};
    NSDictionary *WLScroll =  @{@"title":@"WLScroll",@"className":@"NBLoWLScrollController"};
    NSDictionary *CALayer =  @{@"title":@"CALayer",@"className":@"NBCALayerController"};
    NSDictionary *keyboard =  @{@"title":@"CustomKeyboard",@"className":@"NBLoCustomKeyboardController"};
    
    
    NSArray *dics = @[masonry,AnimationScroll,WLScroll,CALayer,keyboard];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}


@end
