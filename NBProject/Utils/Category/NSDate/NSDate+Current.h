//
//  NSDate+Current.h
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Current)

/* 获取当前日期 格式为：yyyy-MM-dd HH:mm:ss */
+ (NSString *)nb_dateCurrentTime;

@end
