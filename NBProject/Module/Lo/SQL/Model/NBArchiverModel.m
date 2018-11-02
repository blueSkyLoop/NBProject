//
//  NBArchiverModel.m
//  NBProject
//
//  Created by Lucas on 2018/11/1.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBArchiverModel.h"
#import <YYModel.h>
@implementation NBArchiverModel

#define SavePath [NSHomeDirectory() stringByAppendingPathComponent:@"NBArchiverModel.archiver"]

static NBArchiverModel * _manager = nil ;


+ (instancetype)shareManager {
    @synchronized(_manager){
        // 解档
        id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:SavePath];
        if(obj){
            _manager = obj;
        }else {
            _manager = [[self alloc] init];
        }
    }return _manager;
}


// 实现归档方法,aCoder就是归档时传过来的归档对象，对象被归档时会调用这个方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeInteger:self.age forKey:@"age"];
//    [aCoder encodeObject:self.sex forKey:@"sex"];
    
    // 结合 yy model 的使用方法
    [self yy_modelEncodeWithCoder:aCoder];
    
}

// 实现解归档方法，对象解归档是会调用这个方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.age = [aDecoder decodeIntegerForKey:@"age"];
//        self.sex = [aDecoder decodeObjectForKey:@"sex"];

    // 结合 yy model 的使用方法
        [self yy_modelInitWithCoder:aDecoder];
    }return self;
}


// 归档 保存
- (void)nb_saveArchive {
    [NSKeyedArchiver archiveRootObject:_manager toFile:SavePath];
}

// 归档 清除
- (void)nb_clearArchive {
    _manager = nil;
    [NSKeyedArchiver archiveRootObject:_manager toFile:SavePath];
}

- (void)nb_analyzingJson:(NSDictionary *)jsonDic {
    _manager = [NBArchiverModel yy_modelWithDictionary:jsonDic];
    [self nb_saveArchive];
}


- (NSString *)description {
    return [self yy_modelDescription];
}

@end
