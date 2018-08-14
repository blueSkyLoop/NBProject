//
//  NBLoThreadController.m
//  NBProject
//
//  Created by Lucas on 2018/8/10.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoThreadController.h"

@interface NBLoThreadController ()
@property (nonatomic, assign) NSInteger  ticket_counts;
@property (nonatomic, strong) NSThread   *thread1;
@property (nonatomic, strong) NSThread   *thread2;
@property (nonatomic, strong) NSThread   *thread3;
@property (nonatomic, strong) NSThread   *thread4;
@property (nonatomic, strong) NSLock   *lock;
@end

@implementation NBLoThreadController

- (void)viewDidLoad {
    self.btns = @[@"thread base",@"detachNewThread",@"perform",@"thread no safe",@"thread safe"];
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postFunc) name:@"A" object:nil];
}


- (void)test1 {
    //创建线程的第一种方法，此种方式创建的线程不会自启动，需要调用start来启动线程
    //    NSThread *thread = [[NSThread alloc] initWithBlock:<#^(void)block#>];这种方式创建的线程的执行代码直接放在代码块里面执行
    
    //先创建对象，然后调用perform的一系列方法，也能执行线程的执行
    //    NSThread *thread = [[NSThread alloc] init];
    //    [thread performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>];
    //    [thread performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>];
    //    [thread performSelector:<#(SEL)#> withObject:<#(id)#>];
    //    [thread performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>];
    //    [thread performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>];
    
    NSThread * t = [[NSThread alloc] initWithTarget:self selector:@selector(threadRun) object:nil];
    [t start];
}

- (void)test2 {
    [NSThread detachNewThreadSelector:@selector(threadRun) toTarget:self withObject:nil];
}

- (void)test3 {
    //创建线程的第三种方式，隐试的创建线程
    //    [self performSelector:@selector(threadRun) withObject:self afterDelay:0];afterDelay表示可以延时多长时间执行线程
    //    [self performSelectorOnMainThread:@selector(threadRun) withObject:self waitUntilDone:<#(BOOL)#>];waitUntilDone表示是否等待线程执行完再往下进行,会阻塞当前程序运行
    //    [self performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>];在后台运行线程，意味着开辟新线程
    
    
//    以下两种方法都为异步
//    -(void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes;
//    -(void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
    
    
    
    
    
    // 在主线程运行，与runtime有关
    [self performSelector:@selector(threadRun) withObject:nil];
}


- (void)threadRun {
    NSLog(@"=========%@", [NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"A" object:nil];
}

- (void)postFunc { // 通知的方法从哪个线程post，方法就会在哪里执行
    NSLog(@"=========postFunc%@", [NSThread currentThread]);
}



#pragma mark -- 线程安全问题
- (void)test4 {
    self.thread1 = [self threadConfigWithSelName:@"saleTicket_notsafe_model" threadName:@"thread1"];
    self.thread2 = [self threadConfigWithSelName:@"saleTicket_notsafe_model" threadName:@"thread2"];
    self.thread3 = [self threadConfigWithSelName:@"saleTicket_notsafe_model" threadName:@"thread3"];
    self.thread4 = [self threadConfigWithSelName:@"saleTicket_notsafe_model" threadName:@"thread4"];
    
}

- (void)test5 {
    self.thread1 = [self threadConfigWithSelName:@"saleTicket_safe_model" threadName:@"thread1"];
    self.thread2 = [self threadConfigWithSelName:@"saleTicket_safe_model" threadName:@"thread2"];
    self.thread3 = [self threadConfigWithSelName:@"saleTicket_safe_model" threadName:@"thread3"];
    self.thread4 = [self threadConfigWithSelName:@"saleTicket_safe_model" threadName:@"thread4"];
}

- (NSThread *)threadConfigWithSelName:(NSString *)selName threadName:(NSString *)threadName{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:NSSelectorFromString(selName) object:nil];
    thread.name = threadName;
    //开启线程
    [thread start];
    return thread;
}

- (void)saleTicket_notsafe_model{
    self.ticket_counts = 100;
     // 不安全，会抢断资源
    while (true) {
            if (self.ticket_counts > 0) {
                self.ticket_counts -= 1;
                NSLog(@"thread.name----%@       tickets_left-------%ld",[NSThread currentThread].name, self.ticket_counts);
            } else {
                return;
            }
    }
}



- (void)saleTicket_safe_model{
    self.ticket_counts = 100;
    // 安全，添加线程锁
    while (true) {
        @synchronized(self.lock) {
            if (self.ticket_counts > 0) {
                self.ticket_counts -= 1;
                NSLog(@"thread.name----%@       tickets_left-------%ld",[NSThread currentThread].name, self.ticket_counts);
            } else {
                return;
            }
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSLock *)lock {
    if (_lock ==nil) {
        _lock = [NSLock new];
    }return _lock ;
}

@end
