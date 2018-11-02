//
//  NBBaseMasonryController.m
//  NBProject
//
//  Created by Lucas on 2018/7/19.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBMasonryController.h"

#import "NBComHeaderFile.h"

#import "NBBaseTableDelegateModel.h"
#import "NBBaseViewModel.h"
#import "NBCommonCell.h"
#import "UIView+QuickInstance.h"

@interface NBMasonryController ()

@property (nonatomic, strong)NBBaseViewModel *viewModel;
@property (nonatomic, strong)NBBaseTableDelegateModel *delegateModel;
@property (nonatomic, strong)UITableView  *tableView;

@property (nonatomic, strong) UIButton  *blackV;
@property (nonatomic, strong) UIButton  *redV;
@property (nonatomic, strong) UIButton  *centerBtn;
@end

@implementation NBMasonryController
/*
 1.mas_makeConstraints 只负责新增约束,Autolayout 不能同时存在两条针对于同一对象约束 否则会报错
 2.mas_remakeConstraints 会清除之前的所有约束 仅保留最新的约束
 3.mas_updateConstraints 针对上面的情况 会更新block中出现的约束 不会导致出现两个相同的约束的情况
 注意：mas_updateConstraints只能更新已有约束。如果第一次使用的是left, right设置的相对宽度。更新的时候想换成使用width。不能使用mas_updateConstraints，因为已有约束里面没有width的约束，新增width之后会跟原有left, right约束冲突。此时应该使用mas_remakeConstraints
 
 
 
 4. equalTo（）一般用控件做参数    ； mas_equalTo（）一般用数值
 
 insets: 用来设置left, right, top, bottom。接受MASEdgeInsets类型值
 sizeOffset: 用来设置width, height。接受CGSize类型的值
 centerOffset: 用来设置centerX, centerY。接受CGPoint类型的值
 offset: 可以用来设置所有的东西。接受CGFloat类型的值
 
*/

- (void)viewDidLoad {
    [super viewDidLoad];
}

#define margir 30
#define BtnSize CGSizeMake(100, 100)
- (void)nb_setUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    
    self.blackV = [UIView quickCreateButtonWithFont:[UIFont systemFontOfSize:18.0] normalTextColor:[UIColor blueColor] selectTextColor:[UIColor whiteColor] text:@"mas_update"];
    self.blackV.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.blackV];
    [self.blackV addTarget:self action:@selector(blackV_mas_update) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.redV = [UIView quickCreateButtonWithFont:[UIFont systemFontOfSize:18.0] normalTextColor:[UIColor blueColor] selectTextColor:[UIColor whiteColor] text:@"remake"];
    self.redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redV];
    [self.redV addTarget:self action:@selector(redV_mas_remake) forControlEvents:UIControlEventTouchUpInside];

    [self mas_makeConstraintsWithBtns];
    
    self.centerBtn = [UIView quickCreateButtonWithFont:[UIFont systemFontOfSize:18.0] normalTextColor:[UIColor blueColor] selectTextColor:[UIColor whiteColor] text:@"resetLayout"];
    self.centerBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.centerBtn];
    [self.centerBtn addTarget:self action:@selector(resetLayout) forControlEvents:UIControlEventTouchUpInside];
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(BtnSize);
        
    }];
}

- (void)mas_makeConstraintsWithBtns {
    [self.blackV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(MSafeAreaNaviBarHeight + margir);
        make.left.equalTo(self.view).offset(margir);
//      make.size.mas_equalTo(BtnSize);
    }];
    [self.redV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blackV);
//      make.size.and.height.mas_equalTo(BtnSize);
        make.right.mas_equalTo(self.view.mas_right).offset(-margir);
    }];
    
    // 批量添加  size
    NSValue *sizeValue = [NSValue valueWithCGSize:BtnSize];
    [@[self.blackV,self.redV] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(sizeValue);
    }];
}





// 以现有的约束参照物为主，更新约束
- (void)blackV_mas_update {
    [self.blackV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [self.redV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(MSafeAreaNaviBarHeight + margir * 2, margir, MSafeAreaTabBarHeight, margir));
    }];
}

// 清除之前的约束，重新设置
- (void)redV_mas_remake {
    [self.redV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self.centerBtn);
        make.left.mas_equalTo(self.centerBtn.mas_right).offset(margir);
        make.right.lessThanOrEqualTo(self.view.mas_right).offset(-margir);
    }];
}

// 重设布局
- (void)resetLayout {
    [self mas_makeConstraintsWithBtns];
}


- (UIView *)quickCreatViewWithColor:(UIColor *)color {
    UIView *view = [UIView new];
    view.backgroundColor = color;
    [self.view addSubview:view];
    return view;
}

@end
