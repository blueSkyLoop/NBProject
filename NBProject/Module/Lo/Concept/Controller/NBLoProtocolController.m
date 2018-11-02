//
//  NBLoProtocolController.m
//  NBProject
//
//  Created by Lucas on 2018/10/31.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoProtocolController.h"
#import "NBProtocolView.h"
#import <Masonry.h>
@interface NBLoProtocolController ()<NBProtocolViewDelegate>

@end

@implementation NBLoProtocolController
static NSString *const postKey = @"postKey";
- (void)viewDidLoad {
    [super viewDidLoad];
    NBProtocolView <ProtocolConfig>*view = [NBProtocolView loadViewFromXib];
    view.delegate = self;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.size.width.height.equalTo(@100);
    }];
    dispatch_queue_t q = dispatch_queue_create("fa", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q, ^{
        [view nb_protocolMethod:self];
    });
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postMethod) name:postKey object:nil];
    dispatch_async(q, ^{
        // 异步线程执行
        [[NSNotificationCenter defaultCenter] postNotificationName:postKey object:nil];
    });
    // 主线发送
    [[NSNotificationCenter defaultCenter] postNotificationName:postKey object:nil];
    
}


- (void)nb_protocolDelegateMethod:(NBProtocolView *)view {
    // 在异步线程执行
    NSLog(@"view:%@\n%@",view,[NSThread currentThread]);
}


- (void)postMethod {
    // 在哪个线程发出，就会在哪个线程执行
     NSLog(@"currentThread:%@",[NSThread currentThread]);
}

@end
