//
//  NSObject+parser.m
//  LaiKeBaoNew
//
//  Created by lgh on 2017/12/14.
//  Copyright © 2017年 lgh. All rights reserved.
//

#import "NSObject+parser.h"

@implementation NSObject (parser)

- (id)ln_parseMake:(void(^)(NBParserMarker *make))block{
    NBParserMarker *amaker = [[NBParserMarker alloc] initWithData:self];
    block(amaker);
    return [amaker parserData];
}

@end
