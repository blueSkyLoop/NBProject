//
//  NBBaseTableViewCell.h
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBBaseTableViewCell : UITableViewCell

+ (instancetype)nb_dequeueReusableCellWithTableView:(UITableView *)tableView;
@end
