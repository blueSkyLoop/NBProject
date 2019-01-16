//
//  NBLoginViewModel.m
//  NBProject
//
//  Created by Lucas on 2019/1/14.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NBLoginViewModel.h"

@implementation NBLoginViewModel

- (instancetype)init {
    self = [super init];
    
    if (self) {
        // 监听 accunt 的值，并跳过一次， map 映射到 iconUrl 上
        RAC(self,iconUrl) = [[[RACObserve(self, account) skip:1] map:^id _Nullable(id  _Nullable value) {
            return [NSString stringWithFormat:@"icon_%@",value];
        }] distinctUntilChanged];;
        
        
        self.loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account),RACObserve(self, password)] reduce:^id (NSString *account , NSString *passWord){
            return @(account.length > 0 && passWord.length > 0);
        }];
        
        
        self.statusSubject = [RACSubject subject];
        
        [self setupLoginCommand];
        self.islogining = NO;
    }return self;
}


- (void)setupLoginCommand {
    @weakify(self)
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
        return [self loginRequest:input];
    }];
    
    // 成功
    [[self.loginCommand.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        NSLog(@"switchToLatest == %@",x);
        @strongify(self)
        self.islogining = NO;
        [self.statusSubject sendNext:@"登录成功"];
    }];
    
    
    // 失败
    [[self.loginCommand.errors skip:1] subscribeNext:^(NSError * _Nullable x) {
        NSLog(@"errors == %@",x);
        @strongify(self)
        self.islogining = NO;
        [self.statusSubject sendNext:@"登录失败"];
    }];
    
    
    // 状态
    [self.loginCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"executing == %@",x);
        @strongify(self)
        if ([x boolValue]) {
            [self statusLableAnimation];
        }
    }];
    

}


- (void)statusLableAnimation {
    self.islogining = YES;
    __block int num = 0;
    @weakify(self)
    RACSignal *timeSignal = [[[RACSignal interval:0.5 onScheduler:[RACScheduler mainThreadScheduler]] map:^id _Nullable(NSDate * _Nullable value) {
        NSLog(@"登录时间:%@",value);
        NSString *statusStr = @"登录中,请稍后";
        num += 1;
        int count = num % 3;
        switch (count) {
            case 0:
                statusStr = @"登录中,请稍后.";
                break;
            case 1:
                statusStr = @"登录中,请稍后..";
                break;
            case 2:
                statusStr = @"登录中,请稍后...";
                break;
            default:
                break;
        }
        
        return statusStr;
    }] takeUntilBlock:^BOOL(id  _Nullable x) {
        //  YES 跳出 block , NO 则继续 block内部代码
        @strongify(self)
        if (num > 10 || !self.islogining) {
            return YES;
        }
        return NO;
    }];
    
    [timeSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSLog(@"subscribeNext == %@",x);
        [self.statusSubject sendNext:x];
    }];
}


/** 发送请求，传入参数 */
- (RACSignal *)loginRequest:(id)parameter {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @strongify(self)
            [NSThread sleepForTimeInterval:2];
            
            if ([self.account isEqualToString:@"123"] && [self.password isEqualToString:@"123"]) {
                [subscriber sendNext:@"登录成功"];
                [subscriber sendCompleted];
            }else {
                NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{@"LGError":@"无法建立连接"}];
                
                [subscriber sendError:error];
            }
        });
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"销毁了");
        }];
    }];
}


- (NSString *)description{
    return [NSString stringWithFormat:@"%@-%@",self.account,self.password];
}
@end
