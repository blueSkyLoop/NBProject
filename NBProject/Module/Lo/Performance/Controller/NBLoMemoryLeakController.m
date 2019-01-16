//
//  NBLoMemoryLeakController.m
//  NBProject
//
//  Created by Lucas on 2018/12/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoMemoryLeakController.h"

@interface NBLoMemoryLeakController ()

@property (nonatomic ,copy)NSString *str;

@property (nonatomic, copy) dispatch_block_t blcok;


@end

@implementation NBLoMemoryLeakController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.str = @"hello";
    
    __weak typeof(self) weakSelf = self;
    self.blcok = ^{
        // 不使用 weakSelf 都会引起内存泄漏
//        [self logString];
//         NSLog(@"%@",self.str);
        [self performSelector:@selector(logString) withObject:nil afterDelay:2.0];
//        NSLog(@"%@",weakSelf.str);
        
    };
    self.blcok();
}

- (void)logString {
    NSLog(@"%@",self.str);
    self.view.backgroundColor = [UIColor redColor];
}


- (void)dealloc {
    NSLog(@"CurrentVC Dealloc");
}

@end
