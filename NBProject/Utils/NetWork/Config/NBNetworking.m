//
//  NBNetworking.m
//  WonderfulLife
//
//  Created by Lo on 2017/7/4.
//  Copyright © 2017年 WuHanMeiHao. All rights reserved.
//

#import "NBNetworking.h"
#import "AFNetworking.h"
#import "NSObject+isNull.h"
#import "NBDeviceManager.h"

#if DEBUG

#endif

//超时时间
static const NSTimeInterval  kTimeoutInterval = 30;

@implementation NBNetworking{
     AFHTTPSessionManager *_manager;
    //设备参数
    NSDictionary *_deviceDict;
}

+ (NBNetworking *)shareNetworking{
    static NBNetworking *request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[NBNetworking alloc] init];
        [request setupConfig];
    });
    return request;
}

/** 
 配置
 */
- (void)setupConfig {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = kTimeoutInterval;
     _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@""] sessionConfiguration:sessionConfiguration];
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",
                                                          @"text/plain",
                                                          @"application/json",nil];
    [_manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"app"];
    [_manager.requestSerializer setTimeoutInterval: kTimeoutInterval];
    
    _deviceDict = [NBDeviceManager getDeviceInfos];
}


/**
 内置参数 如token等
 */
- (NSDictionary *)builtInParams:(NSDictionary *)originParams {
     NSMutableDictionary * dictm = [NSMutableDictionary dictionaryWithDictionary:originParams];
    //添加必要的参数
    [dictm addEntriesFromDictionary:_deviceDict];
    //get token
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@""];
    if (![NSObject isNull:token]) [dictm setValue:token forKey:@"token"];
    return dictm.copy;
}



/*-------------------------This is a line without dream-----------------------------*/

#pragma mark - 网络监听
/** 开始监听网络变化 */
- (void)startMonitoring
{
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //发出网络更改通知广播
        [[NSNotificationCenter defaultCenter] postNotificationName:@"" object:[NSNumber numberWithInt:status]];
    }];
    [reachabilityManager startMonitoring];
}
/** 停止监听网络状态 */
- (void)stopMonitoring{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

/** 是否有网 */
- (BOOL)isReachable {
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

/** 是否Wifi */
- (BOOL)isWifi {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

/** 是否2G|3G|4G */
- (BOOL)isWWAN {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}






@end
