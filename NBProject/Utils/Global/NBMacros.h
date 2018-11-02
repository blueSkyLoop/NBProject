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


//iPhoneX系列
#define MSafeAreaHeight_Status ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 44.0 : 20.0) // 状态栏 高度
#define MSafeAreaHeight_TabBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 83.0 : 49.0)  // tabbar 高度  注： 83的高度已包含 MSafeAreaHeight_Bottom 的 “34”
#define MSafeAreaHeight_NaviBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 88.0 : 64.0)    // 导航栏高度 + 状态栏高度
#define MSafeAreaHeight_Bottom ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 34 : 0)   // tabbar 底部安全高度




#define kWJHeightCoefficient (MScreenH == 812.0 ? 667.0/667.0 : MScreenH/667.0)

#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

/* 比例 */
#define MScale MScreenW/375

/*  系统判断  */
#define iOS8 [[UIDevice currentDevice] systemVersion].floatValue >= 8.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 9.0
#define iOS8_2_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 8.3

#define iOS9 [[UIDevice currentDevice] systemVersion].floatValue >= 9.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 10.0
#define iOS9_1_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 9.1

#define iOS10 [[UIDevice currentDevice] systemVersion].floatValue >= 10.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 11.0

#define iOS11 [[UIDevice currentDevice] systemVersion].floatValue >= 11.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 12.0

#define iOS12 [[UIDevice currentDevice] systemVersion].floatValue >= 12.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 13.0

/* 判断机型 */
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define IS_Phone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define IS_Phone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define IS_Phone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)





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
#define MImage_Avatar  [UIImage imageNamed:@"com_defaultAvartar"]

#endif /* NBMacros_h */
