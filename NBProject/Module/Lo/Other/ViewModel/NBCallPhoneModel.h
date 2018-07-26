//
//  NBCallPhoneModel.h
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NB_CALLPHONE_FINISHTEL @"NB_CALLPHONE_FINISHTEL"

typedef NS_ENUM(NSInteger, NBCallType){
    /** 通话成功：打出号码*/
    NBCallDialOut  = 0,
    /** 通话成功：接听来电*/
    NBCallIncoming,
};


typedef NS_ENUM(NSInteger, NBCallResultType){
    
    /**（默认） 通话失败：对方繁忙、空号、对拒绝接听*/
    NBCallResultFail  = 0,
    
    /** 通话成功*/
    NBCallResultSuccess
};

@interface NBCallPhoneModel : NSObject

/* 拨打那一刻为起点：开始呼叫的时间 */
@property (nonatomic, copy) NSString *startCallTime;

/* 双方成功建立通话，已接听：开始时间 */
@property (nonatomic, copy) NSString *beginTelTime;

/*  挂电话时间*/
@property (nonatomic, copy) NSString *endCallTime;

@property (nonatomic, copy) NSString * lengthTime;

/*  通话方式 ： 主动拨打、来电接听*/
@property (nonatomic, assign) NBCallType callType;

@property (nonatomic, assign) NBCallResultType callResultType;

@end
