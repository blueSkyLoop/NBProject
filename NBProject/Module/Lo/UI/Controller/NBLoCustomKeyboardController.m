//
//  NBLoCustomKeyboardController.m
//  NBProject
//
//  Created by Lucas on 2019/8/29.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoCustomKeyboardController.h"
#import "LKKeyBoardView.h"
#import "UITextField+Selection.h"
@interface NBLoCustomKeyboardController ()
@property(nonatomic ,strong)UITextField *textfield;
@end

@implementation NBLoCustomKeyboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textfield];
    
    [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"keyboard:%@",x);
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidHideNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"keyboard:%@",x);
    }];
    
    
    LKKeyBoardView *v = [[LKKeyBoardView alloc] initWithStyle:LKKeyBoardStyle_title type:LKKeyBoardInputType_Normal textField:self.textfield block:^(NSString * _Nonnull text) {
        self.textfield.text = text;
    }];
    [v setFrame:CGRectMake(0, 0, self.view.bounds.size.width, LOScale_Value(350))];
    v.backgroundColor = LO_COLOR_RGB(242, 242, 242);
    self.textfield.inputView = v ;
    
    
    
}


#pragma mark - Lazy
- (UITextField *)textfield {
    if (!_textfield) {
        _textfield  = [[UITextField alloc] init];
        _textfield.borderStyle = UITextBorderStyleLine ;
        _textfield.placeholder = @"请输入电话号码";
        _textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    }return _textfield;
}
@end
