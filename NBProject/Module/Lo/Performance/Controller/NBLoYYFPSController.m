//
//  NBLoYYFPSController.m
//  NBProject
//
//  Created by Lucas on 2018/8/22.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoYYFPSController.h"
#import "UIViewController+YYFPSLabel.h"
@interface NBLoYYFPSController ()

@end

@implementation NBLoYYFPSController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)nb_setDataSource {
    NSMutableArray *dics = [NSMutableArray array];
    for (NSInteger i = 0; i < 100 ; i ++) {
        NSString *str  =[NSString stringWithFormat:@"%ld",i];
        NSDictionary *dic = @{@"title":str,@"className":str};
        [dics addObject:dic];
    }
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}

- (void)nb_bindViewModel {
    self.delegateModel = [[NBCommonTableDelegateModel alloc] initWithDataArr:self.viewModel.dataSoure tableView:self.tableView cellClassNames:@[NSStringFromClass([NBCommonCell class])] useAutomaticDimension:YES cellDidSelectedBlock:^(NSIndexPath *indexPath, id cellModel) {
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self nb_addFPSLabel];
}
@end
