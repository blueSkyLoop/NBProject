//
//  NSString+Font.h
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Font)
#pragma mark 字体适配
+ (UIFont *)nb_fontWithSize:(CGFloat)fontSize;
+ (UIFont *)nb_weightMediumFontWithSize:(CGFloat)fontSize;
+ (UIFont *)nb_semiboldFontWithSize:(CGFloat)fontSize;
@end
