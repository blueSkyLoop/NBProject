//
//  NBArchiverModel.h
//  NBProject
//
//  Created by Lucas on 2018/11/1.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBArchiverModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, copy) NSString *sex;

+ (instancetype)shareManager;

// 保存
- (void)nb_saveArchive ;

// 清除
- (void)nb_clearArchive ;

- (void)nb_analyzingJson:(NSDictionary *)jsonDic ;
@end
