//
//  UIView+QuickInstance.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "UIView+QuickInstance.h"


#import <Masonry.h>
#import "NBMacros.h"
@implementation UIView (QuickInstance)

#pragma mark - 快速创建控件
+ (UILabel *)quickCreateLabelWithFont:(UIFont *)afont textColor:(UIColor *)textColor{
    UILabel *alabel = [UILabel new];
    if(afont) alabel.font = afont;
    if(textColor) alabel.textColor = textColor;
    return alabel;
}
+ (UIButton *)quickCreateButtonWithFont:(UIFont *)afont normalTextColor:(UIColor *)normalColor selectTextColor:(UIColor *)selectTextColor{
    UIButton *button = [UIButton new];
    if(afont)  button.titleLabel.font = afont;
    if(normalColor) [button setTitleColor:normalColor forState:UIControlStateNormal];
    if(selectTextColor) [button setTitleColor:selectTextColor forState:UIControlStateSelected];
    return button;
}
+ (UIButton *)quickCreateButtonWithFont:(UIFont *)afont normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage{
    UIButton *button = [UIButton new];
    if(afont)  button.titleLabel.font = afont;
    if(normalImage) [button setImage:normalImage forState:UIControlStateNormal];
    if(selectImage) [button setImage:selectImage forState:UIControlStateSelected];
    return button;
}

#pragma mark - 空状态视图
+ (UIView *)emptyViewWithTitleStr:(NSString *)titleStr topSpace:(CGFloat)topSpace imageName:(NSString *)imageName{
    UIView *emptyView = [UIView new];
    emptyView.backgroundColor = MRGBColor(242, 244, 245);
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [UIImageView new];
    imageView.image =  imageName?[UIImage imageNamed:imageName]:nil;
    UILabel *label = [UIView quickCreateLabelWithFont:[UIFont systemFontOfSize:MScale * 18] textColor:MRGBColor(152, 160, 166)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = titleStr?:@"暂无内容";
    [bgView addSubview:imageView];
    [bgView addSubview:label];
    [emptyView addSubview:bgView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top);
        make.left.greaterThanOrEqualTo(bgView.mas_left);
        make.right.lessThanOrEqualTo(bgView.mas_right);
        make.centerX.equalTo(bgView.mas_centerX).priorityHigh();
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom);
        make.left.greaterThanOrEqualTo(bgView.mas_left);
        make.right.lessThanOrEqualTo(bgView.mas_right);
        make.centerX.equalTo(bgView.mas_centerX).priorityHigh();
        make.bottom.equalTo(bgView.mas_bottom);
    }];
    if(topSpace != NSNotFound){
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(emptyView.mas_centerX);
            make.top.equalTo(emptyView.mas_top).offset(topSpace);
            make.bottom.lessThanOrEqualTo(emptyView.mas_bottom);
        }];
    }else{
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(emptyView);
        }];
    }
    return emptyView;
}


@end
