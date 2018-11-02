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
    
    NBBaseTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:[self cellIndentifier]];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellReuseIdentifier:[self cellIndentifier]];
        cell = [tableView dequeueReusableCellWithIdentifier:[self cellIndentifier]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    return cell;
}

+ (NSString *)cellIndentifier {
    return NSStringFromClass([self class]);
}

@end
