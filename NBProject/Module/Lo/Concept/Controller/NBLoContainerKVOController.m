//
//  NBLoContainerKVOController.m
//  NBProject
//
//  Created by Lucas on 2019/1/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoContainerKVOController.h"
#import "Person.h"
#import <objc/message.h>
@interface NBLoContainerKVOController ()

@property (nonatomic ,strong)Person *p;

@end

@implementation NBLoContainerKVOController


- (void)viewDidLoad {
    [super viewDidLoad];
    _p = [Person alloc];
//    _p = [_p init];
    //  有返回值，无参
    _p =((Person * (*)(id,SEL)) objc_msgSend)(_p , @selector(init));
    
    /** KVO底层实现
     *  1.创建一个子类，NSKVONotyfing_Person
     *  2.重写setName方法！！
     *  3.外界改变isa指针！
     */
    [_p addObserver:self forKeyPath:@"dogs" options:(NSKeyValueObservingOptionNew) context:nil];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"%@---%@",change,_p.dogs);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a ;
    a ++ ;
    NSMutableArray *temparr = [_p mutableArrayValueForKey:@"dogs"];
    [temparr addObject:[NSString stringWithFormat:@"%d",a]];
}

@end
