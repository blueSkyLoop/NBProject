//
//  NSDate+Current.m
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NSDate+Current.h"

@implementation NSDate (Current)

+ (NSString *)nb_dateCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

@end
