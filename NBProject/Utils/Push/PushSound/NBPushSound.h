//
//  NBPushSound.h
//  LaiKeBaoNew
//
//  Created by Lucas on 2018/12/11.
//  Copyright © 2018年 lgh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBPushSound : NSObject

// 传入推送的字典
- (void)nb_pushSound:(NSDictionary *)userInfo ;

+ (void)pushSound:(NSDictionary *)userInfo;
@end
