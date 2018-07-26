//
//  AppDelegate+CallHistory.h
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "AppDelegate.h"
#import "NBCallPhoneModel.h"

#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>


@interface AppDelegate (CallHistory)

@property (nonatomic, strong)NBCallPhoneModel *callM;

@property (strong,nonatomic) CTCallCenter * callCenter;

/* 获取通话记录 */
- (void)nb_callHistory ;

@end
