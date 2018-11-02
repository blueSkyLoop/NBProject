//
//  NBLoGCDController.m
//  NBProject
//
//  Created by Lucas on 2018/7/16.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoGCDController.h"


@interface NBLoGCDController ()

@end

@implementation NBLoGCDController

- (void)viewDidLoad {
    self.btns = @[@"串行异步",@"串行同步",@"并行异步",@"并行同步",@"串行：异步转同步",@"串行：同步转异步",@"并发：异步转同步",@"并发：同步转异步",@"全局队列创建",@"线程组",@"GCD快速迭代方法",@"栅栏",@"挂起与恢复",@"信号量使用"];
    [super viewDidLoad];
 
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}




// 串行异步
- (void)test1{
    
    /** 创建了一个串行队列，然后往串行队列中添加了10个异步任务，从打印结果可以看出：先在主线程中执行打印start—，然后将异步任务添加到串行队列中（只是添加，并没有立即执行），之后在主线程打印end—，最后才会从串行队列中依次取出一个任务，并在子线程中执行，因此异步任务打印是有序的。所以， 主线程会在执行完dispatch_async方法后，立即返回执行主线程后续相关操作，主线程任务执行完毕后，才会在子线程中依次执行异步任务。由于串行队列中的任务是依次取出来执行的，即前一个任务在子线程执行完毕后，才能取出后一个任务来执行，所以只需要创建一个子线程即可。*/
    
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_SERIAL);
    NSLog(@"start--%@",[NSThread currentThread]); // 1
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i); //3
        });
    }
    NSLog(@"end--%@",[NSThread currentThread]); //2
    // 结论：串行队列 异步任务，会创建子线程，且只创建一个子线程，异步任务执行是有序的。
}

// 串行同步
- (void)test2{
    dispatch_queue_t q = dispatch_queue_create("dsb", DISPATCH_QUEUE_SERIAL);
    NSLog(@"start--%@",[NSThread currentThread]);//1
    for (int i = 0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);//2
        });
    }
    NSLog(@"end--%@",[NSThread currentThread]);//3
    
    // 结论： 串行队列 同步任务，不创建新线程，同步任务执行是有序的。
}


// 并行异步
- (void)test3{
    dispatch_queue_t q  = dispatch_queue_create("fs", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"start--%@",[NSThread currentThread]);//1
    for (int i = 0; i<10 ; i++) {
        dispatch_async(q, ^{
            NSLog(@"aaaaaaaaaaaaa---%d",i);  // 3 无序打印
        });
        
        dispatch_async(q, ^{
            NSLog(@"bbbbbbbbbbbbb---%d",i);  // 3 无序打印
        });
    }
    NSLog(@"end--%@",[NSThread currentThread]); // 2
    
    // 结论：并行队列 异步任务 创建子线程，且多个子线程，异步任务打印结果无序
}

// 并行同步
- (void)test4{
    dispatch_queue_t q = dispatch_queue_create("fd", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"start--%@",[NSThread currentThread]);//1
    for (int i = 0; i<10 ; i++) {
        dispatch_sync(q, ^{
            NSLog(@"aaaaaaaaaaaaa---%d",i); // 2 无序打印
        });
        
        dispatch_sync(q, ^{
            NSLog(@"bbbbbbbbbbbbb---%d",i);  // 2 无序打印
        });
    }
    NSLog(@"end--%@",[NSThread currentThread]);     //3
    //    结论： 并行队列 同步任务，不创建新线程，同步任务执行是有序的。
}


/**  (1)同步、异步决定是否创建子线程，同步任务不创建子线程，都是在主线程中执行，异步任务创建子线程。
 （2）串行、并行决定创建子线程的个数，串行创建一个子线程，并行创建多个子线程（具体几个由系统决定）。*/


//  串行： 异步转同步
- (void)test5{
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"start--%@",[NSThread currentThread]);//1
    
    for (int i = 0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i); // 3
        });
    }
    
    NSLog(@"end1--%@",[NSThread currentThread]);  // 2
    
    for (int i = 0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);  // 4
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);  // 5
}



// 串行： 同步转异步
- (void)test6{
    dispatch_queue_t q = dispatch_queue_create("dsb", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"start--%@",[NSThread currentThread]);//1
    
    for (int i = 0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);  //2
        });
    }
    
    
    NSLog(@"end1--%@",[NSThread currentThread]);  // 3
    
    for (int i = 0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);  // 5
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);  // 4
    
}


// 并发： 异步转同步
- (void)test7{
    dispatch_queue_t q = dispatch_queue_create("dsb", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"start--%@",[NSThread currentThread]);//1
    
    for (int i = 0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"aaaaaa--%@---%d",[NSThread currentThread],i);  //3
        });
    }
    
    
    NSLog(@"end1--%@",[NSThread currentThread]);  // 2
    
    for (int i = 0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"bbbbbb--%@---%d",[NSThread currentThread],i);  // 4
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);  // 5
    
}


// 并发 ： 同步转异步
- (void)test8{
    dispatch_queue_t q = dispatch_queue_create("dsb", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"start--%@",[NSThread currentThread]);//1
    
    for (int i = 0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);  //2
        });
    }
    
    
    NSLog(@"end1--%@",[NSThread currentThread]);  // 3
    
    for (int i = 0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);  // 5  无序打印
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);  // 4
}

/**  全局队列创建 */
- (void)test9 {
    /** 对于并行队列，还可以使用dispatch_get_global_queue来创建全局并行队列。GCD默认提供了全局的并行队列，需要传入两个参数。第一个参数表示队列优先级，一般用DISPATCH_QUEUE_PRIORITY_DEFAULT。第二个参数暂时没用，用0即可。*/
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) ;
}

// 线程组
- (void)test10 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    // 添加队列到组中
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3333; i ++) {
            NSLog(@"aaaaa----i:%ld",i);
        }
        
    });
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 66666; i ++) {
            NSLog(@"bbbbb----i:%ld",i);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"通知到线程组里");
    });
    
    // DISPATCH_TIME_FOREVER ：永久等待
//   dispatch_time_t time = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    // 设置指定时间
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 100*1000*1000*1000);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
//        dispatch group的全部处理执行结束
    }else {
//        dispatch groupe的某一处理还在执行中
    }
    
}

// GCD apply 遍历， 以0开始遍历到 N-1的 index
- (void)test11 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        dispatch_apply(6666, queue, ^(size_t index) {
            NSLog(@"%zd------%@",index, [NSThread currentThread]);
        });
    });
    
    
}

// 栅栏  dispatch_barrier_async
- (void)test12 {
//    dispatch_queue_t queue = dispatch_queue_create("12312312", DISPATCH_QUEUE_SERIAL); //
    dispatch_queue_t queue = dispatch_queue_create("12312312", DISPATCH_QUEUE_CONCURRENT); //
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"aaaaa----i:%ld",i);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"bbbbb----i:%ld",i);
        }
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"停！");
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"ccccc----i:%ld",i);
        }
    });
    
}

// 恢复与挂起
- (void)test13 {
    dispatch_queue_t queue  = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_suspend(queue);
    dispatch_async(queue, ^{
        dispatch_apply(5, queue, ^(size_t index) {
            NSLog(@"index:%ld -----%@",index,[NSThread currentThread]);
        });
    });
     NSLog(@"aaa！-----%@",[NSThread currentThread]);
    dispatch_resume(queue);
}

// 信号量使用
- (void)test14 {
    /*
     一般情况下，发送信号和等待信号是成对出现的。也就是说，一个dispatch_semaphore_signal(sem);对应一个dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
     */
    
    
    dispatch_group_t grp = dispatch_group_create();
    dispatch_queue_t queue =  dispatch_queue_create("去你大爷的", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(grp, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        
            NSLog(@"task1 begin : %@",[NSThread currentThread]);   // 1
        
        dispatch_async(queue, ^{
            NSLog(@"task1 finish : %@",[NSThread currentThread]);  // 2
            dispatch_semaphore_signal(sem);
        });
        
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(grp, queue, ^{
        
      dispatch_semaphore_t sem =  dispatch_semaphore_create(0);
        
        NSLog(@"task2 begin : %@",[NSThread currentThread]);   // 1
        
        dispatch_async(queue, ^{
           NSLog(@"task2 finish : %@",[NSThread currentThread]);  // 2
            dispatch_semaphore_signal(sem);
        });
        
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_notify(grp, dispatch_get_main_queue(), ^{
        NSLog(@"refresh UI");  // 3
    });
}

@end
