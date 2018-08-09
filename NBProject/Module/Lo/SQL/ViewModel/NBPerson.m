//
//  NBRLMPerson.m
//  NBProject
//
//  Created by Lucas on 2018/7/31.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBPerson.h"

@implementation NBPerson

// 默认键值
+ (NSDictionary *)defaultPropertyValues {
    return @{@"sex":@"基佬",@"age":@18};
}

////设置忽略属性,即不存到realm数据库中,realm 将不会干涉这些属性的常规操作
+ (NSArray<NSString *> *)ignoredProperties {
    [super ignoredProperties];
    return @[@"job"];
}

//一般来说,属性为nil的话realm会抛出异常,但是如果实现了这个方法的话,就只有name为nil会抛出异常,也就是说现在cover属性可以为空了
//+ (NSArray *)requiredProperties {
//    return @[@"name"];
//}


@end


