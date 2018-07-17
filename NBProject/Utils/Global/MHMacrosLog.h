//
//  MHMacrosLog.h
//  NBProject
//
//  Created by Lucas on 2018/7/13.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
// 打印宏
#ifdef DEBUG
#define NSLog(...)  NSLog(@"\n**** log begain ****\n%@  %@ 第%d行 \n%@\n**** log  end ****\n",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],[[NSString stringWithUTF8String:__FUNCTION__] lastPathComponent],__LINE__, HLGetNSLogMessage(__VA_ARGS__))
#else
#define NSLog(...)  while(0){}
#endif

extern NSString * HLGetNSLogMessage(NSString *format, ...);
