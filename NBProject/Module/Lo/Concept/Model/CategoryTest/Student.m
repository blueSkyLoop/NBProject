//
//  Student.m
//  NBProject
//
//  Created by Lucas on 2018/8/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "Student.h"

@implementation Student
{
@public
    NSString *frined;
@protected
    NSString *mother;
@private
    NSString *father;
@package
    NSInteger height;
    
}


- (void)read {
    NSLog(@"Student类 实现方法，Student+Skills 声明方法---read");
    
}


- (void)eat {
    NSLog(@"若stu.h没有声明方法， 但 stu.m 却实现了 eat 的方法， 可以用 performSelector：withObject： 此方法调用私有方法");
}

- (void)run {
    NSLog(@"run");
}


@end
