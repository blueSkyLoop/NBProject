//
//  NBUIController.m
//  NBProject
//
//  Created by Lucas on 2018/7/19.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBUIController.h"
#import "NBUIDelegateModel.h"
#import "NBUIViewModel.h"
#import "NBCommonCell.h"
#import "NBControllerModel.h"
@interface NBUIController ()
@property (nonatomic,strong) UITableView *tableView;

//因为无聊，多创建了一层子类去玩
@property (nonatomic, strong) NBUIViewModel  *viewModel;
@property (nonatomic, strong) NBUIDelegateModel  *delegateModel;
@end

@implementation NBUIController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)nb_bindViewModel {
    self.delegateModel = [[NBUIDelegateModel alloc] initWithDataArr:self.viewModel.dataSoure tableView:self.tableView cellClassNames:@[@"NBCommonCell"] useAutomaticDimension:YES cellDidSelectedBlock:^(NSIndexPath *indexPath, id cellModel) {
        NBControllerModel *model = self.viewModel.dataSoure[indexPath.row];
        UIViewController *vc = [NSClassFromString(model.className) new];
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}


- (NBUIViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [NBUIViewModel new];
    }return _viewModel;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [NBUIDelegateModel createTableWithStyle:UITableViewStylePlain superView:self.view rigistNibCellNames:@[@"NBCommonCell"] rigistClassCellNames:nil];
    }return _tableView;
}

@end
