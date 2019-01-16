//
//  NBCategoryController.m
//  NBProject
//
//  Created by Lucas on 2018/8/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoCategoryController.h"
#import "Student.h"
#import "Student+Skills.h"


#import "ClassC.h"
#import "ClassB.h"
#import "ClassA.h"
#import "ClassA+Methods.h"
@interface NBLoCategoryController ()

@end

@implementation NBLoCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 类别
//    [self category];
    
    // 继承
//    [self inheritance];
}


- (void)category {
    Student *stu = [Student new];
    // 1.stu.h声明 study 但没实现， 却在类别 Student+skills 实现方法
    // 注意，若 stu 类  与 类别 Student+skills 都实现了 study 方法的话， 类别方法会把  stu 类 的方法覆盖掉
    [stu study];
    
    // 2. 若stu.h 没有声明方法， 但 stu.m 实现了 eat 的方法， 可以用 performSelector：withObject： 此方法调用私有方法
    [stu performSelector:@selector(eat) withObject:nil];
    
    
    // 3. 类 stu.m 进行私有方法实现，分类.h进行私有声明。实现外部对私有方法的使用。这也叫做对私有方法向前引用。
    [stu read];
}

// 间接实现多继承的功能
- (void)inheritance {
    ClassA * a = [ClassA new];
    
    // 方法1：使用performSelector调用
    [a performSelector:@selector(methodB)];

    // 方法2：把ClassA的对象强转为ClassC的
    [(ClassC *)a methodC];
    
    // 方法3: ClassA.h中增加ClassA的分类，声明ClassB和ClassC中的方法
    [a methodB];
    [a methodC];
}

@end
