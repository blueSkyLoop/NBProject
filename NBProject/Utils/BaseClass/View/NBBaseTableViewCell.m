//
//  NBBaseTableViewCell.m
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseTableViewCell.h"

@implementation NBBaseTableViewCell


+ (instancetype)nb_dequeueReusableCellWithTableView:(UITableView *)tableView {
    NSString *cellID = NSStringFromClass(self);
    NBBaseTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellReuseIdentifier:cellID];
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    return cell;
}

@end
