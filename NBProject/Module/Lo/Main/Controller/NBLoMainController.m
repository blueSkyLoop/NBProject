//
//  NBLoMainController.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMainController.h"

#import <Masonry.h>

#import "NBLoMainDelegateModel.h"
#import "NBLoMainViewModel.h"
#import "NBControllerModel.h"

#import "NBMacros.h"

#import "NBCommonCell.h"
@interface NBLoMainController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NBLoMainViewModel  *viewModel;
@property (nonatomic, strong) NBLoMainDelegateModel  *delegateModel;
@end

@implementation NBLoMainController


- (void)viewDidLoad {
    [super viewDidLoad];
//    AdjustsScrollViewInsetNever(self, self.tableView);
}

- (void)nb_bindViewModel {
    
    self.delegateModel = [[NBLoMainDelegateModel alloc] initWithDataArr:self.viewModel.dataSoure tableView:self.tableView cellClassNames:@[NSStringFromClass([NBCommonCell class])] useAutomaticDimension:YES cellDidSelectedBlock:^(NSIndexPath *indexPath, id cellModel) {
        NBControllerModel *model = self.viewModel.dataSoure[indexPath.row];
        UIViewController *vc = [NSClassFromString(model.className) new];
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}




#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [NBLoMainDelegateModel createTableWithStyle:UITableViewStylePlain superView:self.view rigistNibCellNames:@[NSStringFromClass([NBCommonCell class])] rigistClassCellNames:nil];
    }return _tableView;
}

- (NBLoMainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [NBLoMainViewModel new];
    }return _viewModel;
}

@end
