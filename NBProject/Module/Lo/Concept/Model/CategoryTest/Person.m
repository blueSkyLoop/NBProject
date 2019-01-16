//
//  Person.m
//  NBProject
//
//  Created by Lucas on 2018/10/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name {
    _name = [name stringByAppendingString:@"---hahah"];
}

- (NSMutableArray *)dogs {
    if (!_dogs) {
        _dogs = [NSMutableArray array];
    }return _dogs;
}


@end
