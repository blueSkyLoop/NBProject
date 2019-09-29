//
//  LKHeader.h
//  LaiKeBaoNew
//
//  Created by lgh on 2017/12/11.
//  Copyright © 2017年 lgh. All rights reserved.
//

#ifndef LKHeader_h
#define LKHeader_h

#import <UIKit/UIKit.h>






/*  屏幕  */
#define WINDOW [UIApplication sharedApplication].keyWindow
#define LOScreen_W [UIScreen mainScreen].bounds.size.width
#define LOScreen_H [UIScreen mainScreen].bounds.size.height

//比例
/** 宽度比例 */
#define LOScale_W LOScreen_W/375
/**  高度比例 ，812 以 iphone X 为参照物 */
#define LOScale_H LOScreen_H/812
#define LOScale_H_667 LOScreen_H/667
#define LOScale_Value(value) LOScale_W * value

//iPhoneX系列
#define LOSafeAreaHeight_StatusBar_height ([[UIApplication sharedApplication] statusBarFrame].size.height)
//#define LOSafeAreaHeight_StatusBar_height ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 44.0 : 20.0) // 状态栏 高度
#define LOSafeAreaHeight_TabBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 83.0 : 49.0)  // tabbar 高度  注： 83的高度已包含 LOSafeAreaHeight_Bottom 的 “34”
/** 导航栏高度 + 状态栏高度 */
#define LOSafeAreaHeight_NaviBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 88.0 : 64.0)
#define LOSafeAreaHeight_Bottom ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 34 : 0)   // tabbar 底部安全高度

#define LoHeightCoefficient (LOScreen_H == 812.0 ? 667.0/667.0 : LOScreen_H/667.0)

#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}



/*  系统判断  */
#define iOS8 [[UIDevice currentDevice] systemVersion].floatValue >= 8.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 9.0
#define iOS8_2_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 8.3

#define iOS9 [[UIDevice currentDevice] systemVersion].floatValue >= 9.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 10.0
#define iOS9_1_OR_LATER [[UIDevice currentDevice] systemVersion].floatValue >= 9.1

#define iOS10 [[UIDevice currentDevice] systemVersion].floatValue >= 10.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 11.0

#define iOS11 [[UIDevice currentDevice] systemVersion].floatValue >= 11.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 12.0

#define iOS12 [[UIDevice currentDevice] systemVersion].floatValue >= 12.0 && [[UIDevice currentDevice] systemVersion].floatValue <= 13.0

//版本判断
#define SYSTEM_VERSION [[[UIDevice currentDevice]systemVersion] doubleValue]


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


// 十六进制颜色
#define LO_COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define LO_COLOR_RGB(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

#define MColorMainGradientStart LO_COLOR_RGB(255,61,66)            //主调渐变开始色
#define MColorMainGradientEnd LO_COLOR_RGB(254,113,69)             //主调渐变结束色
#define MColorMainGradientHighlightStart LO_COLOR_WITH_HEX(0XFF6785)            //主调渐变高亮开始色
#define MColorMainGradientHighlightEnd LO_COLOR_WITH_HEX(0XFF9C6F)              //主调渐变高亮结束色

//主色
#define LO_Title_ThemeColor_One LO_COLOR_WITH_HEX(0x0073FF)
#define LO_Title_ThemeColor_Two LO_COLOR_WITH_HEX(0x1C82FF)
#define LO_Title_ThemeColor_Three LO_COLOR_WITH_HEX(0x27B4FF)
#define LO_Title_ThemeColor_Foure LO_COLOR_WITH_HEX(0xD2E6FF)
#define LO_Title_ThemeColor_Five LO_COLOR_WITH_HEX(0xE5F1FF)

//常规字体颜色黑 333333
#define LO_Text_NormalColor_One LO_COLOR_WITH_HEX(0x333333)
#define LO_Text_NormalColor_Two LO_COLOR_WITH_HEX(0x555555)
#define LO_Text_NormalColor_Three LO_COLOR_WITH_HEX(0x777777)
#define LO_Text_NormalColor_Foure LO_COLOR_WITH_HEX(0x999999)
#define LO_Text_NormalColor_Five LO_COLOR_WITH_HEX(0xBBBBBB)

//线条 颜色
#define LO_Line_NormalColor_One LO_COLOR_WITH_HEX(0x999999)
#define LO_Line_NormalColor_Two LO_COLOR_WITH_HEX(0xCCCCCC)
#define LO_Line_NormalColor_Three LO_COLOR_WITH_HEX(0xDDDDDD)
#define LO_Line_NormalColor_Foure LO_COLOR_WITH_HEX(0xEEEEEE)

//状态 警告 颜色 橙色
#define LO_Orange_NormalColor_One LO_COLOR_WITH_HEX(0xFF5A00)
#define LO_Orange_NormalColor_Two LO_COLOR_WITH_HEX(0xFF6F21)
#define LO_Orange_NormalColor_Three LO_COLOR_WITH_HEX(0xFF9B2E)
#define LO_Orange_NormalColor_Foure LO_COLOR_WITH_HEX(0xFFE2D3)
#define LO_Orange_NormalColor_Five LO_COLOR_WITH_HEX(0xFFEEE5)

//状态 警告 颜色 o红色
#define LO_Red_NormalColor_One LO_COLOR_WITH_HEX(0xEC0016)
#define LO_Red_NormalColor_Two LO_COLOR_WITH_HEX(0xFF1A2F)
#define LO_Red_NormalColor_Three LO_COLOR_WITH_HEX(0xFF3A4C)
#define LO_Red_NormalColor_Foure LO_COLOR_WITH_HEX(0xFFD7DA)
#define LO_Red_NormalColor_Five LO_COLOR_WITH_HEX(0xFFE7E9)


#define LO_FontFitAndName(f_size,name)  [UIFont fontWithName:name size:(LOScale_W * f_size)]

#define LO_Font_NormalColor LO_COLOR_RGB(51,51,51)


/*  默认头像  */
#define LO_Image_Default  [UIImage imageNamed:@"defaualt"]
#define LO_Image_Avatar  [UIImage imageNamed:@"icon-tx-1"]

/** tableView 点击颜色 */
#define LO_COLOR_TableViewCell_HightLight LO_COLOR_WITH_HEX(0XF6F6F6)              //主调渐变高亮结束色

//常用字段
static NSString *const LO_Item_Key = @"LO_Item_Key";
static NSString *const LO_Contenct_Key = @"LO_Contenct_Key";
static NSString *const LO_PlayHolder_Key = @"LO_PlayHolder_Key";

//版本更新指引key 2019.08.15
static NSString *const LO_HomePage_Version_Update_Tip_Key = @"LO_HomePage_Version_Update_Tip_Key";
static NSString *const LO_Mine_Version_Update_Tip_Key = @"LO_Mine_Version_Update_Tip_Key";

//间隙
#define kCell_15_Margin     suitW(15.0f)
#define kCell_10_Margin     suitW(10.0f)
#define LO_BtnRadius_Scale  25


#ifndef LOWeakify
#if __has_feature(objc_arc)
#define LOWeakify(object)  __weak __typeof__(object) weak##_##object = object;
#else
#define LOWeakify(object)  __block __typeof__(object) block##_##object = object;
#endif
#endif

#ifndef LOStrongify
#if __has_feature(objc_arc)
#define LOStrongify(object)  __typeof__(object) object = weak##_##object;
#else
#define LOStrongify(object)  __typeof__(object) object = block##_##object;
#endif
#endif

// 本地账号密码
#define LO_UserDefaults_Account  [[NSUserDefaults standardUserDefaults] valueForKey:@"lk_userAccount"]
#define LO_UserDefaults_Password [[NSUserDefaults standardUserDefaults] valueForKey:@"lk_userPassword"]

#define LO_UserDefaults_SetAccount(account) [[NSUserDefaults standardUserDefaults] setValue:account forKey:@"lk_userAccount"]
#define LO_UserDefaults_SetPassword(password) [[NSUserDefaults standardUserDefaults] setValue:password forKey:@"lk_userPassword"]

#define LO_UserDefaults_Set(value,key) [[NSUserDefaults standardUserDefaults] setValue:value forKey:key]
#define LO_UserDefaults_Get(value)     [[NSUserDefaults standardUserDefaults] valueForKey:value]

#define LO_Notif    [NSNotificationCenter defaultCenter]

//打印类调用的方法
#define LOG_SELF_METHOD LKLog(@"Class<< %@ >> called Method < %@ >",[self class],NSStringFromSelector(_cmd));

#ifdef DEBUG
#define LKLog(...) NSLog(__VA_ARGS__)
#else
#define LKLog(...)
#endif


//UIView及其子类的最小tag值
#define LKMinTag        100

#endif /* LKHeader_h */
