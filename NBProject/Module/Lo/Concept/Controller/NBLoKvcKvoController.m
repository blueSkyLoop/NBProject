//
//  NBKvcKvoController.m
//  NBProject
//
//  Created by Lucas on 2018/10/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoKvcKvoController.h"
#import "Student.h"

#import "Person.h"
#import "Dog.h"

@interface NBLoKvcKvoController ()

@property (nonatomic ,strong)Person *p ;

@end

@implementation NBLoKvcKvoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p = [Person new];

//    [self p1];
//    [self p2];
//    [self p3];
//    [self p5];
    [self kvo];
}


- (void)p1 {
    //    使用setValue: forKey:方法能够给属性赋值,等价于直接给属性赋值
    [self.p setValue:@"rose" forKey:@"name"];
    [self.p setValue:@"22.2" forKey:@"money"];
}

- (void)p2 {
    self.p.dog = [Dog new];
    [self.p.dog setValue:@"wangcai" forKeyPath:@"name"];
    [self.p setValue:@"3" forKeyPath:@"dog.age"];
    [self.p.dog setValue:@"4" forKeyPath:@"_age"];
    
    Dog * dog = self.p.dog;
    
}


- (void)p3 {
    NSDictionary *dict = @{
                           @"name" : @"jack",
                           @"money": @"22.2",
                           @"dog" : @{
                                   @"name" : @"wangcai",
                                   @"age": @"11.1",
                                   }
                           };
    Person *p = [[Person alloc]init]; // p是一个模型对象
    p.dog = [self videoWithDict:dict[@"dog"]];
}


- (Dog *)videoWithDict:(NSDictionary *)dict
{
    Dog *videItem = [[Dog alloc] init];
    //以前
    //    videItem.name = dict[@"name"];
    //    videItem.money = [dict[@"money"] doubleValue] ;
    
    //KVC,使用setValuesForKeysWithDictionary:方法,该方法默认根据字典中每个键值对,调用setValue:forKey方法
    // 缺点:字典中的键值对必须与模型中的键值对完全对应,否则程序会崩溃
    [Dog setValuesForKeysWithDictionary:dict];
    return videItem;
}


// KVC 取值
- (void)p4 {
    Person *p = [[Person alloc]init];
    p.name = @"jack";
    p.money = 11.1;
    //KVC取值
    NSLog(@"%@ %@", [p valueForKey:@"name"], [p valueForKey:@"money"]);
    
    //模型转字典, 根据数组中的键获取到值,然后放到字典中
    NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name", @"money"]];
    NSLog(@"%@", dict);

}

// KVC 取值 2
- (void)p5 {
    Dog *d1 = [[Dog alloc] init];
    d1.name = @"5分钟突破iOS开发";
    d1.age = 10.7;
    
    Dog *d2 = [[Dog alloc] init];
    d2.name = @"4分钟突破iOS开发";
    d2.age = 109.7;
    
    Dog *d3 = [[Dog alloc] init];
    d3.name = @"1分钟突破iOS开发";
    d3.age = 1580.7;
    
    NSArray *ds = @[d1, d2, d3];
    NSArray *names = [ds valueForKeyPath:@"name"];
    NSLog(@"%@", names);
    
    Person *p = [Person new];
    p.dogs = ds ;
    
    NSArray *names2 = [p valueForKeyPath:@"dogs.name"];
    
    NSLog(@"%@", names2);
}



- (void)kvo {
    self.p.name = @"jack";
    
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew  | NSKeyValueObservingOptionOld context:@"123"];
    self.p.name = @"jackaaaa";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // NSKeyValueChangeNewKey == @"new"
    NSString *new = change[NSKeyValueChangeNewKey];
    // NSKeyValueChangeOldKey == @"old"
    NSString *old = change[NSKeyValueChangeOldKey];
    
    NSLog(@"%@-%@",new,old);
    
}

@end
