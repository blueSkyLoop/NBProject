//
//  LKKeyBoardView.m
//  NBProject
//
//  Created by Lucas on 2019/8/30.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "LKKeyBoardView.h"
#import <Masonry.h>
#import "LKHeader.h"
#import "UITextField+Selection.h"
@interface LKKeyBoardView ()
@property(nonatomic ,strong)UITextField *textField;
@property (nonatomic, assign) LKKeyBoardStyle style;
@property (nonatomic, assign) LKKeyBoardInputType type;
@property (nonatomic, copy) KeyBoardInputBlock block;


/** title 内容视图 */
@property (nonatomic, strong) UIView  *titContentV;


/** 键盘 内容视图 */
@property (nonatomic, strong) UIView  *numView;

@property (nonatomic, strong) UIButton  *bStar;
@end

@implementation LKKeyBoardView

- (instancetype)initWithStyle:(LKKeyBoardStyle)style type:(LKKeyBoardInputType)type textField:(UITextField *)textField block:(KeyBoardInputBlock)block{
    self = [super init];
    if (self) {
        _textField  = textField ;
        _style = style;
        _type = type;
        _block = block;
        [self lk_initUI];
    }return self;
}


- (void)lk_initUI {
    [self addSubview:self.numView];
    
    
    if (self.type == LKKeyBoardInputType_fullNum) {
        self.bStar.backgroundColor = LO_COLOR_RGB(242, 242, 242);
        self.bStar.enabled = NO;
    }
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.style == LKKeyBoardStyle_title) {
        [self addSubview:self.titContentV];
        [self.titContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(LOScale_Value(50));
        }];
        
        [self.numView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.titContentV.mas_bottom).offset(0);
        }];
    }else {
        [self.numView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
}


#pragma mark - Lazy
/** 标题视图 */
- (UIView *)titContentV {
    if (!_titContentV) {
        UIView *contentV  = [UIView new];
        contentV.backgroundColor = LO_COLOR_RGB(242, 242, 242);
        
        
        UILabel  *titLab = [[UILabel alloc] init];
        titLab.textColor = LO_COLOR_RGB(153, 153, 153);
        //    LOScale_Value(13) weight:UIFontWeightRegular
        titLab.font = [UIFont systemFontOfSize:LOScale_Value(15)];
        titLab.text = self.textField.placeholder;
        titLab.textAlignment = NSTextAlignmentCenter;
        [contentV addSubview:titLab];
        
        
        UIView *line = [UIView new];
        line.backgroundColor = LO_COLOR_RGB(229, 229, 229);
        [contentV addSubview:line];
        
        [titLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.centerX.centerY.mas_equalTo(contentV);
            make.top.mas_equalTo(LOScale_Value(20));
            make.bottom.mas_equalTo(LOScale_Value(-20));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(contentV);
            make.height.mas_equalTo(1);
            make.bottom.mas_offset(-1);
        }];
        _titContentV = contentV;
    }return _titContentV;
}

static NSInteger Com_Tag = 1000;
static NSInteger Del_Tag  = 2000;
- (UIView *)numView {
    if (!_numView) {
        _numView  = [UIView new];
        _numView.backgroundColor = LO_COLOR_RGB(242, 242, 242);
        
        
        UIFont  *font = [UIFont systemFontOfSize:LOScale_Value(24)];
        UIColor *textColor = LO_Font_NormalColor;
        UIColor *bgColor = [UIColor whiteColor];
        
        
        
        UIButton *b1 = [self lk_creatWithFont:font title:@"1" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b2 = [self lk_creatWithFont:font title:@"2" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b3 = [self lk_creatWithFont:font title:@"3" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b4 = [self lk_creatWithFont:font title:@"4" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b5 = [self lk_creatWithFont:font title:@"5" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b6 = [self lk_creatWithFont:font title:@"6" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b7 = [self lk_creatWithFont:font title:@"7" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b8 = [self lk_creatWithFont:font title:@"8" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b9 = [self lk_creatWithFont:font title:@"9" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *b0 = [self lk_creatWithFont:font title:@"0" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        UIButton *bStar = [self lk_creatWithFont:font title:@"*" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        bStar.titleEdgeInsets = UIEdgeInsetsMake(25, 30, 21, 30);
        self.bStar = bStar;
        
        UIButton *bDel = [self lk_creatWithFont:font title:@"删除" textColor:textColor backgroundColor:bgColor imageName:nil superView:_numView];
        bDel.tag = Del_Tag;
        UIButton *bComplete = [self lk_creatWithFont:font title:@"完成" textColor:[UIColor whiteColor] backgroundColor:LO_COLOR_RGB(28, 130, 255) imageName:nil superView:_numView];
        bComplete.tag = Com_Tag ;
        [bComplete.titleLabel setFont:[UIFont systemFontOfSize:LOScale_Value(18)]];
        
        CGSize btnS = CGSizeMake(LOScale_Value(81), LOScale_Value(50));
        CGSize zeroS = CGSizeMake(LOScale_Value(172), btnS.height);
        CGSize comS = CGSizeMake(LOScale_Value(82), LOScale_Value(170));
        
        CGFloat magir = LOScale_Value(10);
        CGFloat magir_bottom = LOScale_Value(45);
        
        // 设置控件的大小
        [@[b1,b2,b3,b4,b5,b6,b7,b8,b9,bStar,bDel] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(btnS);
        }];
        
        [b0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(zeroS);
        }];
        
        [bComplete mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(comS);
        }];
        
        
        // 第一,二，三，四 排按钮的 top 约束
        [@[b1,b2,b3,bDel] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(magir);
        }];
        
        [@[b4,b5,b6,bComplete] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(b1.mas_bottom).offset(magir);
        }];
        
        [@[b7,b8,b9] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(b4.mas_bottom).offset(magir);
        }];
        
        [@[b0,bStar] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(b7.mas_bottom).offset(magir);
        }];
        
        // 第一,二，三，四 排按钮的 left 约束
        [@[b1,b4,b7,b0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(magir);
        }];
        
        [@[b2,b5,b8] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(b1.mas_right).offset(magir);
        }];
        
        [@[b3,b6,b9,bStar] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(b2.mas_right).offset(magir);
        }];
        
        [@[bDel,bComplete] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(b3.mas_right).offset(magir);
            make.right.mas_offset(-magir);
        }];
        
        // 第四 排按钮的 bottom 约束
        [@[b0,bStar,bComplete] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-magir_bottom).priorityLow();
        }];
        
        
    }return _numView;
}


- (UIButton *)lk_creatWithFont:(UIFont *)font title:(NSString *)title textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor imageName:(NSString *)imageName superView:(UIView *)superView{
    
    UIButton *btn = [UIButton new];
    
    if (title && title.length) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (imageName && imageName.length) {
        btn.imageView.image = [UIImage imageNamed:imageName];
    }
    [btn setTitleColor:textColor forState:UIControlStateNormal] ;
    btn.backgroundColor = backgroundColor;
    btn.titleLabel.font = font;
    if (superView) {
        [superView addSubview:btn];
    }
    
    [btn addTarget:self action:@selector(inputAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[self createImageWithColor:LO_COLOR_RGB(242, 242, 242)] forState:UIControlStateHighlighted];
    return btn;
}


- (UIImage*)createImageWithColor:(UIColor*)color

{
    
        CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
        UIGraphicsBeginImageContext(rect.size);
    
        CGContextRef context = UIGraphicsGetCurrentContext();
    
        CGContextSetFillColorWithColor(context, [color CGColor]);
    
        CGContextFillRect(context, rect);
    
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        return theImage;
    
}


- (void)inputAction:(UIButton *)sender {
    
    if (sender.tag != Com_Tag && sender.tag != Del_Tag) {
        
        NSRange tf_range = [self.textField lo_selectedRange];
        
        NSMutableString *str = [[NSMutableString alloc] initWithString:self.textField.text];
        
        [str insertString:[sender currentTitle] atIndex:tf_range.location];
        
        self.block(str);
        [self.textField lo_setSelectedRange:NSMakeRange(tf_range.location + 1, tf_range.length)];
        return;
    }

    if (sender.tag == Com_Tag) {
        [self.textField resignFirstResponder];
        self.block(self.textField.text);
    }else if (sender.tag == Del_Tag) {
        [self.textField  deleteBackward];
        self.block(self.textField.text);
    }
}


@end
