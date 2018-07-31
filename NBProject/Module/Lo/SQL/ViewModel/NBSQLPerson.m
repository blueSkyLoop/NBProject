//
//  NBSQLModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBSQLPerson.h"

@implementation NBSQLPerson

+ (NBSQLPerson *)Person {
    NBSQLPerson *person = [NBSQLPerson new];
    person.name = @"a";
    person.age = 28;
    person.sex = @"男";
    person.teacher = [NBSQLTeacher new];
    person.teacher.subjects = @"科目";
    person.person_id = arc4random()%10000 ;
    NBSQLStudent *s1 = [NBSQLStudent new];
    s1.studentID = 100;
    s1.name = @"吖菲";
    
    NBSQLStudent *s2 = [NBSQLStudent new];
    s2.studentID = 200;
    s2.name = @"吖波";
    
    NBSQLStudent *s3 = [NBSQLStudent new];
    s3.studentID = 300;
    s3.name = @"吖欣";
    
    person.teacher.students = [NSMutableArray arrayWithObjects:s1,s2,s3,nil];
    
    return person ;
}

@end


@implementation NBSQLTeacher

@end

@implementation NBSQLStudent

@end


