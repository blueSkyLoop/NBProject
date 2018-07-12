//
//  NBMacros.h
//  NBProject
//
//  Created by Lucas on 2018/7/11.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#ifndef NBMacros_h
#define NBMacros_h


/*  屏幕  */
#define WINDOW [UIApplication sharedApplication].keyWindow
#define MScreenW [UIScreen mainScreen].bounds.size.width
#define MScreenH [UIScreen mainScreen].bounds.size.height

/* 机型  */



/* 比例 */
#define MScale MScreenW/375

/*  系统判断  */
#define iOS8 [[UIDevice currentDevice] systemVersion].floatValue >= 8.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 9.0
#define iOS8_2_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 8.3

#define iOS9 [[UIDevice currentDevice] systemVersion].floatValue >= 9.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 10.0
#define iOS9_1_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 9.1

#define iOS10 [[UIDevice currentDevice] systemVersion].floatValue >= 10.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 11.0

#define iOS11 [[UIDevice currentDevice] systemVersion].floatValue >= 11.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 12.0

#define IPHONEX (MScreenW == 375.f && MScreenH == 812.f)

/* 颜色 */
#define MRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]// RGB色
#define MRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]// RGB色
#define MRandomColor MRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))// 随机色
#define MColorToRGB(value) MColorToRGBWithAlpha(value, 1.0f)
#define MColorToRGBWithAlpha(value, alpha1) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:alpha1]//十六进制转RGB色

#define MColorTitle MColorToRGB(0X324057)                  //文章标题文本色
#define MColorContent MColorToRGB(0XC0CCDA)               //文章正文文本色
#define MColorRed MColorToRGB(0XFF4949)                  //红

/*  默认头像  */
#define MAvatar  [UIImage imageNamed:@"com_defaultAvartar"]

#endif /* NBMacros_h */
