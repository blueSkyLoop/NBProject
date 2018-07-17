//
//  MHMacrosLog.m
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "MHMacrosLog.h"

inline NSString * HLGetNSLogMessage(NSString *format, ...)  {
    va_list args;
    va_start(args, format);
    NSString *msgString = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return msgString;
}
