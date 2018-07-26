//
//  NSDate+Comparison.h
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.


//  时间值对比，转换时间差

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ComparisonType){
    
    /** 年差额 */
    ComparisonTypeYear  = 0,
    
    /** 月差额 */
    ComparisonTypeMonth    ,
    
    /** 日差额 */
    ComparisonTypeDay    ,
    
    /** 小时差额 */
    ComparisonTypeHour  ,
    
    /** 分钟差额 */
    ComparisonTypeMinute  ,
    
    /** 秒差额 */
    ComparisonTypeSecond  ,
    
    /* 时分秒 格式 ：hh:mm:ss */
    ComparisonTypeHMS ,
    
    /* 分秒 格式 ：mm分ss秒 */
    ComparisonTypeMS
};

@interface NSDate (Comparison)

/**
 *  两个日期对比，得出时间间隔
 *
 *  @parma   ComparisonType  枚举值，
 *           startDateStr    开始时间
 *           endDateStr      结束时间
 *  @return  时间间隔
 */

+ (NSString *)nb_comparisonDateWithType:(ComparisonType)type Start:(NSString *)startDateStr end:(NSString *)endDateStr ;

@end
