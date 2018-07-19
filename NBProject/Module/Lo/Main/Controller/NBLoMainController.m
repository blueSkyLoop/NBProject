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

#import "NBLoMainCell.h"
@interface NBLoMainController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NBLoMainViewModel  *viewModel;
@property (nonatomic, strong) NBLoMainDelegateModel  *delegateModel;
@end

@implementation NBLoMainController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)nb_bindViewModel {
    self.delegateModel = [[NBLoMainDelegateModel alloc] initWithDataArr:self.viewModel.dataSoure tableView:self.tableView cellClassNames:@[NSStringFromClass([NBLoMainCell class])] useAutomaticDimension:YES cellDidSelectedBlock:^(NSIndexPath *indexPath, id cellModel) {
        NBControllerModel *model = self.viewModel.dataSoure[indexPath.row];
        UIViewController *vc = [NSClassFromString(model.className) new];
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)nb_setUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [NBLoMainDelegateModel createTableWithStyle:UITableViewStylePlain rigistNibCellNames:@[NSStringFromClass([NBLoMainCell class])] rigistClassCellNames:nil];
    }return _tableView;
}

- (NBLoMainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [NBLoMainViewModel new];
    }return _viewModel;
}

@end
