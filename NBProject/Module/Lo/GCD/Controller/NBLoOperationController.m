//
//  NBLoOperationController.m
//  NBProject
//
//  Created by Lucas on 2018/8/10.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoOperationController.h"
#import "UIView+QuickInstance.h"
#import <Masonry.h>
@interface NBLoOperationController ()
@end

@implementation NBLoOperationController

- (void)viewDidLoad {
    self.btns = @[@"Invocation sy",@"Invocation asy",@"BlockOperation sy",@"BlockOperation asy",@"Operation Queue",@"Depencey Operation",@"MaxConcurrent"];
    [super viewDidLoad];
    
}

#pragma mark -- NSInvocationOperation operation
- (void)test1 {
    //调用start方法执行，此执行方式在主线程中执行，没有开辟新的线程
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationTest) object:nil];
    [operation start];
}

- (void)test2 {
     //加入到队列中去执行，此种方式会开辟线程，在新的线程中执行代码
    NSInvocationOperation *operation  = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationTest) object:nil];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

- (void)invocationTest {
    NSLog(@"------------%@----", [NSThread currentThread]);
}


#pragma mark -- NSBlockOperation operation
- (void)test3 {
     //调用start方法执行，此执行方式在主线程中执行，没有开辟新的线程
    NSBlockOperation *operation  = [NSBlockOperation blockOperationWithBlock:^{
         NSLog(@"------operation------%@-----", [NSThread currentThread]);
    }];
    [operation start];
}

- (void)test4 {
    // 开启新线程
    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
    //添加任务
    [operation addExecutionBlock:^{
        NSLog(@"------block1------%@-----", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"------block2------%@-----", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"------block3------%@-----", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"------block4------%@-----", [NSThread currentThread]);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

#pragma mark -- NSOperationQueue operation
- (void)test5 {
    // 创建 queue 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //添加任务
    [queue addOperationWithBlock:^{
        NSLog(@"------block1------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block2------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block3------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block4------%@-----", [NSThread currentThread]);
    }];
}

#pragma mark --  使用场景介绍
/**
 使用场景一：任务的依赖执行
 */
- (void)test6 {
    NSBlockOperation *oper1 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"------operation1------%@-----", [NSThread currentThread]); // 2
    }];
    
    NSBlockOperation *oper2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"------operation2------%@-----", [NSThread currentThread]);  // 3
    }];
    
    NSBlockOperation *oper3 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"------operation3------%@-----", [NSThread currentThread]);   //  1
    }];
    
    // 依赖
    [oper1 addDependency:oper3];
    [oper2 addDependency:oper1];
    
    // 是否完成
    [oper1 isFinished];
    
    // 操作是否取消
    [oper1 isCancelled];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:@[oper1,oper2,oper3] waitUntilFinished:YES];
}

/*
 使用场景二：设置最大并发数量，为了保证app的整个生命周期不会占用过多的资源，在有大量并发线程执行的时候，一定要进行设置，不然可能会造成app闪退
 */
- (void)test7 {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     //设置线程的最大并发数量
    queue.maxConcurrentOperationCount = 3 ;
    
    // 暂停
//    [queue setSuspended:YES];
    
    // 取消全部线程
//    [queue cancelAllOperations];
    
    //添加任务
    [queue addOperationWithBlock:^{
        NSLog(@"------block1------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block2------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block3------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block4------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block5------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block6------%@-----", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"------block7------%@-----", [NSThread currentThread]);
    }];
}
@end
