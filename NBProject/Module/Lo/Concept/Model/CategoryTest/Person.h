//
//  Person.h
//  NBProject
//
//  Created by Lucas on 2018/10/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@interface Person : NSObject

@property (nonatomic, copy) NSString *name;




@property (nonatomic, assign) NSInteger money;

@property (nonatomic, strong) Dog  *dog;

/** 数组，容器类 */
@property (strong,nonatomic) NSMutableArray <Dog *>*dogs;

@end
