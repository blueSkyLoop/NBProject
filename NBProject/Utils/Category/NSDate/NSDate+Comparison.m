//
//  NSDate+Comparison.m
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NSDate+Comparison.h"

@implementation NSDate (Comparison)


+ (NSString *)nb_comparisonDateWithType:(ComparisonType)type Start:(NSString *)startDateStr end:(NSString *)endDateStr {
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";

    // 截止时间 data格式
    NSDate *endDate = [dateFomatter dateFromString:endDateStr];
    // 当前时间 data格式
    NSDate *startDate = [dateFomatter dateFromString:startDateStr];
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
//    年差额 = dateCom.year, 月差额 = dateCom.month, 日差额 = dateCom.day, 小时差额 = dateCom.hour, 分钟差额 = dateCom.minute, 秒差额 = dateCom.second
    NSInteger tolSeconds = 0 ;
    
    
    switch (type) {
        case ComparisonTypeYear:
            tolSeconds = dateCom.year ;
            break;
        case ComparisonTypeMonth:
            tolSeconds = dateCom.month ;
            break;
        case ComparisonTypeDay:
            tolSeconds = dateCom.day ;
            break;
        case ComparisonTypeHour:
            tolSeconds = dateCom.hour ;
            break;
        case ComparisonTypeMinute:
            tolSeconds = dateCom.minute ;
            break;
        case ComparisonTypeSecond:
            tolSeconds = dateCom.second ;
            break;
        case ComparisonTypeHMS:
            return  [NSString stringWithFormat:@"%02ld:%02ld:%02ld",dateCom.hour,dateCom.minute,dateCom.second];
        case ComparisonTypeMS:
            return  [NSString stringWithFormat:@"%02ld分钟%02ld秒",dateCom.hour*60+dateCom.minute,dateCom.second];
        default:
            break;
    }
    return [NSString stringWithFormat:@"%ld",tolSeconds];
}

//传入 秒 得到 xx:xx:xx
+ (NSString *)getTimeWithHMS:(NSInteger)seconds{
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
}


//传入 秒 得到 xx分钟xx秒
+ (NSString *)getTimeWithMS:(NSInteger)seconds{
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@分钟%@秒",str_minute,str_second];
    return format_time;
}


@end
