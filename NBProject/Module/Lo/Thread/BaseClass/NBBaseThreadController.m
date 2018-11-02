//
//  NBBaseThreadController.m
//  NBProject
//
//  Created by Lucas on 2018/8/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseThreadController.h"
#import "UIView+QuickInstance.h"
#import <Masonry.h>
@interface NBBaseThreadController ()


@end

@implementation NBBaseThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)nb_setUI {
    // 位置参照物
    UIButton * refBtn ;
    // 列数
    NSInteger column = 2 ;
    // 间隔
    CGFloat Margin = 30 ;
    // 宽度
    CGFloat btn_W = (MScreenW - (column + 1) *Margin) / column ;
    // 高度
    CGFloat btn_H = 30 ;
    CGSize btn_size = CGSizeMake(btn_W, btn_H);
    
    for (NSInteger i = 1 ; i < self.btns.count + 1; i ++) {
        NSString *btnTitle = self.btns[i-1];
        UIButton *btn = [UIView quickCreateButtonWithFont:[UIFont systemFontOfSize:17] normalTextColor:[UIColor blackColor] selectTextColor:[UIColor grayColor] text:btnTitle];
        btn.layer.borderColor = [UIColor blueColor].CGColor;
        btn.layer.cornerRadius = 0.5;
        btn.layer.borderWidth  = 1;
        btn.layer.masksToBounds = YES;
        [self.view addSubview:btn];
        
        NSString *funcName = [NSString stringWithFormat:@"test%ld",i];
        SEL func = NSSelectorFromString(funcName);
        [btn addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 1) {
                make.left.equalTo(self.view).offset(Margin);
                make.top.equalTo(self.view).offset(Margin + MSafeAreaHeight_NaviBar);
            }else{
                if (i%column == 1) {
                    make.left.equalTo(self.view).offset(Margin);
                    make.top.equalTo(refBtn.mas_bottom).offset(Margin);
                }else{
                    make.left.equalTo(refBtn.mas_right).offset(Margin);
                    make.top.equalTo(refBtn);
                }
            }
            make.size.sizeOffset(btn_size);
        }];
        [self.view layoutIfNeeded];
        refBtn = btn;
    }
}

@end
