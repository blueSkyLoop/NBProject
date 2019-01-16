//
//  NBLoRacLoginController.m
//  NBProject
//
//  Created by Lucas on 2019/1/14.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoRacLoginController.h"
#import <ReactiveObjC.h>
#import "NBLoginViewModel.h"
@interface NBLoRacLoginController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UILabel *statusLB;

@property (nonatomic, strong) NBLoginViewModel  *loginViewModel;

@end

@implementation NBLoRacLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lo_bindViewModel];
}


- (void)lo_bindViewModel {
    // 按钮的点击能动性 --- account
    RAC(self.loginBtn,enabled) = self.loginViewModel.loginEnableSignal;
    
    // vm  <-- UI 传递
    RAC(self.loginViewModel,account) = self.accountTextField.rac_textSignal;
    RAC(self.loginViewModel,password) = self.passWordTextField.rac_textSignal;
    
    // 响应的发送 -- 响应的接受 --- vm -- > UI
    RAC(self.statusLB,text) = self.loginViewModel.statusSubject;
    
    @weakify(self)
    // vm ---> UI
    // RACObserve --> signal
    [RACObserve(self.loginViewModel,iconUrl) subscribeNext:^(id  _Nullable x) {
       @strongify(self)
        self.iconView.image = [UIImage imageNamed:x];
    }];
    
    
    // vm ---> signal
    [self.loginViewModel.loginEnableSignal subscribeNext:^(NSNumber *x) {
         @strongify(self)
        UIColor *color = (x.intValue == 0) ? [UIColor lightGrayColor] : [UIColor blueColor];
        [self.loginBtn setBackgroundColor:color];
    }];
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        // ----> vm  ---> 迁移
        // 涉及 ---> 网络 ---> 状态 -- 响应 ---- 命令 ---vm ---> 请求网络
        [self.loginViewModel.loginCommand execute:@{@"ApiUrl":@"loginApi"}];
        NSLog(@"按钮来了");
    }];
}


- (NBLoginViewModel *)loginViewModel {
    if (_loginViewModel == nil) {
        _loginViewModel = [[NBLoginViewModel alloc] init];
    } return _loginViewModel;
}

@end
