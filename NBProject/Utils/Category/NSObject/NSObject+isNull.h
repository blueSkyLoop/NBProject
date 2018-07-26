//
//  NSObject+isNull.h
//  WonderfulLife
//
//  Created by Lo on 2017/7/5.
//  Copyright © 2017年 WuHanMeiHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (isNull)

// 判断对象是否为空 (YES:空、NO:非空)
+(BOOL)isNull:(id)object ;

-(BOOL)nb_isNull;

- (NSMutableDictionary *)createDictionayFromModelProperties;

@end
