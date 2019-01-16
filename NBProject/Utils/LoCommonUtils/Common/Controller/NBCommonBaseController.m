//
//  NBCommonBaseController.m
//  NBProject
//
//  Created by Lucas on 2018/7/26.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBCommonBaseController.h"
#import "MHMacrosLog.h"

@interface NBCommonBaseController ()

@end

@implementation NBCommonBaseController

- (void)viewDidLoad {
    [self nb_setDataSource];
    [super viewDidLoad];
}

- (void)nb_bindViewModel {
    __weak typeof(self) weakSelf = self;
    self.delegateModel = [[NBCommonTableDelegateModel alloc] initWithDataArr:self.viewModel.dataSoure tableView:self.tableView cellClassNames:@[NSStringFromClass([NBCommonCell class])] useAutomaticDimension:YES cellDidSelectedBlock:^(NSIndexPath *indexPath, id cellModel) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NBControllerModel *model = strongSelf.viewModel.dataSoure[indexPath.row];
        UIViewController *vc = [NSClassFromString(model.className) new];
        vc.title = model.className;
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
}


#pragma mark - 需要重写此方法  添加viewModel.dataSoure
- (void)nb_setDataSource {
    
}


#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [NBCommonTableDelegateModel createTableWithStyle:UITableViewStylePlain superView:self.view rigistNibCellNames:@[NSStringFromClass([NBCommonCell class])] rigistClassCellNames:nil];
    }return _tableView;
}


- (NBCommonViewMoedel *)viewModel {
    if (!_viewModel) {
        _viewModel = [NBCommonViewMoedel new];
    }return _viewModel;
}

- (void)dealloc {
    NSLog(@"%@ delalloc",NSStringFromClass([self class]));
}
@end
