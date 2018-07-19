//
//  NBLoMainCell.m
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainCell.h"
#import "NBControllerModel.h"
@implementation NBLoMainCell 

- (void)mh_configCellWithInfor:(NBControllerModel *)model {
    self.textLabel.text = model.title ;
}

@end
