//
//  NBLoCallPhoneHistoryController.m
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoCallPhoneHistoryController.h"
#import "NBCallPhoneModel.h"

#import "UIView+QuickInstance.h"
#import "UIViewController+MHTelephone.h"

#import <Masonry.h>
#import "NBMacros.h"
@interface NBLoCallPhoneHistoryController ()

@property (strong, nonatomic) UITextField *phoneTF;

@property (strong, nonatomic) UILabel *callResultLB;

@property (strong, nonatomic) UILabel *callTypeLB;

@property (strong, nonatomic) UILabel *callStartLB;

@property (strong, nonatomic) UILabel *callBeginLB;

@property (strong, nonatomic) UILabel *callEndLB;

// 通话时长
@property (strong, nonatomic) UILabel *callLengthLB;

/** callModel */
@property (strong,nonatomic) NBCallPhoneModel *callM;

@end

@implementation NBLoCallPhoneHistoryController
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callFinish:) name:NB_CALLPHONE_FINISHTEL object:nil];
}

#define Magir 30
#define Hight 40
#define SubViews_Size CGSizeMake(300, 40)
- (void)nb_setUI {
    
    self.phoneTF = [UITextField new];
    self.phoneTF.borderStyle = UITextBorderStyleBezel;
    self.phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing ;
    self.phoneTF.keyboardType = UIKeyboardTypePhonePad ;
    self.phoneTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.phoneTF.leftView.userInteractionEnabled = NO;
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.phoneTF];
    self.phoneTF.text = @"10000";
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(MSafeAreaNaviBarHeight + Magir);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(SubViews_Size);
    }];
    
    __block UIView *currentView = self.phoneTF ;
    self.callResultLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    self.callTypeLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    self.callStartLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    self.callBeginLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    self.callEndLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    self.callLengthLB = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    
    NSMutableArray *subViews = [NSMutableArray arrayWithObjects:self.callResultLB,self.callTypeLB,self.callStartLB,self.callBeginLB,self.callEndLB,self.callLengthLB, nil];
    for (NSInteger i = 0 ; i < subViews.count ; i ++) {
        UILabel * lb  = subViews[i];
        lb.backgroundColor = [UIColor grayColor];
        lb.text = @"未知";
        lb.textAlignment =  NSTextAlignmentCenter;
        [self.view addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(currentView.mas_bottom).offset(Magir);
            make.centerX.equalTo(currentView);
            make.size.equalTo(currentView);
            currentView = lb ;
        }];
    }
    
    UIButton *callBtn = [UIView quickCreateButtonWithFont:[UIFont systemFontOfSize:18] normalTextColor:[UIColor blackColor] selectTextColor:nil text:@"拨打"];
    callBtn.layer.borderWidth = 2;
    callBtn.layer.borderColor = [UIColor blackColor].CGColor;
    [callBtn addTarget:self action:@selector(callUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callBtn];
    [callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(Magir);
        make.centerX.equalTo(currentView);
        make.size.equalTo(currentView);
    }];
    
}

// 拨打电话
- (void)callUp {
    
    [self mh_telephone:self.phoneTF.text];
}


- (void)callFinish:(NSNotification *)notifi {
    self.callM = (NBCallPhoneModel *)notifi.object ;
    dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];
    });
}


- (void)reloadData {

    self.callResultLB.text = [NSString stringWithFormat:@"通话状态：%@",self.callM.callResultType == NBCallResultFail ? @"未接通" : @"已接通"];
    self.callTypeLB.text = [NSString stringWithFormat:@"通话方式：%@",self.callM.callType == NBCallIncoming ? @"来电" : @"拨出"];
    self.callStartLB.text = [NSString stringWithFormat:@"拨打时间：%@",self.callM.startCallTime];
    self.callBeginLB.text = [NSString stringWithFormat:@"接通时间：%@",self.callM.beginTelTime];
    self.callEndLB.text = [NSString stringWithFormat:@"结束时间：%@",self.callM.endCallTime];
    self.callLengthLB.text = [NSString stringWithFormat:@"通话时长：%@",self.callM.lengthTime];
}
@end
