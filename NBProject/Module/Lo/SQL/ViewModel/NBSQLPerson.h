//
//  NBSQLModel.h
//  NBProject
//
//  Created by Lucas on 2018/7/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BGFMDB.h" //添加该头文件,本类就具有了存储功能.
@class NBSQLTeacher,NBSQLStudent ;

@interface NBSQLPerson : NSObject

@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NBSQLTeacher  *teacher;
@property (nonatomic, assign) NSInteger person_id;

+ (NBSQLPerson *)Person ;

@end


@interface NBSQLTeacher : NSObject

@property (nonatomic, strong) NSMutableArray *students;

/* 科目 */
@property (nonatomic, copy) NSString *subjects;
@end



@interface NBSQLStudent : NSObject

/* 学号 */
@property (nonatomic, assign) NSInteger studentID;

@property (nonatomic, copy) NSString *name;
@end
