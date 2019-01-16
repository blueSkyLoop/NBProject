//
//  NBCustomKVOController.m
//  NBProject
//
//  Created by Lucas on 2019/1/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoCustomKVOController.h"
#import "NSObject+LoKVO.h"
#import "Person.h"
@interface NBLoCustomKVOController ()
@property (nonnull ,strong)Person *p;
@end

@implementation NBLoCustomKVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    _p = [Person new];
    
    /** KVO底层实现
     *  1.创建一个子类，NSKVONotyfing_Person
     *  2.重写setName方法！！
     *  3.外界改变isa指针！
     */
//    [_p nb_addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    
    [_p addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    
}

// 监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@---%@",change,_p.name);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a ;
    _p.name = [NSString stringWithFormat:@"%d",a++];
}


@end
