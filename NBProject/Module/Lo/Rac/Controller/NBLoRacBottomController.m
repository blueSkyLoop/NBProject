//
//  NBLoRacBottomController.m
//  NBProject
//
//  Created by Lucas on 2019/1/11.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoRacBottomController.h"
#import <ReactiveObjC.h>
@interface NBLoRacBottomController ()
@property (nonatomic, strong) RACDisposable *dispos;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) id<RACSubscriber> kcSubscriber;
@property (nonatomic, strong) RACSignal *signal;
@property (nonatomic, strong) RACMulticastConnection *connect;
@end

@implementation NBLoRacBottomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1 创建信号
    // 产生 signal 与 didSubscribe Block
    
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self)
        self.kcSubscriber  = subscriber;
        NSLog(@"来了,请求网络");
        // 3:发送信号
        [subscriber sendNext:@"Cooci"];
        // 4:销毁
        // return self.dis; 销毁回调
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"我们销毁了");
        }];
    }];
    self.signal = signal;
    
    // 2 订阅信号
    // 订阅者 包含有 subscriber、signal、disposable
    // a.创建 subscribe 对象 并保存 Next Error、Completed 三个Block
    // b.传入 subscribe 并创建 disposable，
    // c. disposable、signal、subscribe 三者合成 （RACPassthroughSubscriber*）subscribe
    // 把 signal.didSubscribe(subscribe)传出
    RACDisposable *disp = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"0:订阅到了:%@",x);
    }];
    
    
    //  signal subscriber 销毁 --- RAC
    // 以下两个方法，要是被调用一次后，
    [signal subscribeError:^(NSError * _Nullable error) {
        NSLog(@"subscribeError");
    }];
    
    
    [signal subscribeCompleted:^{
        NSLog(@"subscribeCompleted");
    }];

    
}

- (IBAction)sendNext:(id)sender {
    // subsrcribe 是 RACPassthroughSubscriber 类型
    [self.kcSubscriber sendNext:@"RAC"];
}

- (IBAction)errorAction:(id)sender {
    NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:10088 userInfo:@{@"LGError":@"hhaha "}];
    [self.kcSubscriber sendError:error];
}

- (IBAction)compAction:(id)sender {
    
    [self.kcSubscriber sendCompleted];
}
@end
