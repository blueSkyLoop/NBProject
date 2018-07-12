//
//  UIView+QuickInstance.h
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QuickInstance)

#pragma mark - 快速创建控件
+ (UILabel *)quickCreateLabelWithFont:(UIFont *)afont textColor:(UIColor *)textColor;
+ (UIButton *)quickCreateButtonWithFont:(UIFont *)afont normalTextColor:(UIColor *)normalColor selectTextColor:(UIColor *)selectTextColor;
+ (UIButton *)quickCreateButtonWithFont:(UIFont *)afont normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage;

#pragma mark - 空状态视图
/*titleStr 显示的标题  topSpace 距离顶部的距离，如果要居中，传 NSNotFound*/
+ (UIView *)emptyViewWithTitleStr:(NSString *)titleStr topSpace:(CGFloat)topSpace imageName:(NSString *)imageName;

@end
