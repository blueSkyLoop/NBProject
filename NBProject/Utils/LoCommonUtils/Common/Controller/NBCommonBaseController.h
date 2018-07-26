//
//  NBCommonBaseController.h
//  NBProject
//
//  Created by Lucas on 2018/7/26.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseController.h"
#import "NBComHeaderFile.h"

// 此类为了方便快速创建 tableView 和 数据源 
@interface NBCommonBaseController : NBBaseController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NBCommonViewMoedel  *viewModel;
@property (nonatomic, strong) NBCommonTableDelegateModel  *delegateModel;

- (void)nb_setDataSource ;
@end
