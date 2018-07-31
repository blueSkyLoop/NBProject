//
//  NBOtherController.m
//  NBProject
//
//  Created by Lucas on 2018/7/26.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoOtherController.h"

@interface NBLoOtherController ()

@end

@implementation NBLoOtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)nb_setDataSource {
        NSDictionary *CallDic = @{@"title":@"获取通话记录",@"className":@"NBLoPhoneHisController"};
    
    NSArray *dics = @[CallDic];
    [self.viewModel.dataSoure addObjectsFromArray:[NBControllerModel controllersWithDics:dics]];
}
@end
