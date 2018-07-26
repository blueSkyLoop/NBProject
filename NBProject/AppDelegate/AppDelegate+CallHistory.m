//
//  AppDelegate+CallHistory.m
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "AppDelegate+CallHistory.h"


#import <objc/runtime.h>

#import "MHWeakStrongDefine.h"
#import "NSDate+Current.h"


@implementation AppDelegate (CallHistory)

- (void)nb_callHistory {
    MHWeakify(self);
     self.callCenter = [[CTCallCenter alloc] init];

    self.callCenter.callEventHandler=^(CTCall* call) {
        MHStrongify(self)
        if (call.callState == CTCallStateDisconnected) { // 号码拨打空号、忙音、对方拒绝接电、已完成通话，挂电话后都会进入此判断
            self.callM.endCallTime = [NSDate nb_dateCurrentTime];
            NSLog(@"Call has been disconnected/电话结束 ---%@",self.callM.endCallTime);
            [self postNotificationWithName:NB_CALLPHONE_FINISHTEL];
        } else if (call.callState == CTCallStateConnected) { // 双方成功建立通话
            
            //  因不是来电的时默认是 default，所以成功建立通话就是 callup; 否则就是来电接听而建立的通话
            self.callM.callResultType = NBCallResultSuccess ;
            self.callM.beginTelTime = [NSDate nb_dateCurrentTime];
            NSLog(@"Call has just been connected/电话已接听 ---%@",self.callM.beginTelTime);
            
        } else if(call.callState == CTCallStateIncoming) { // 来电

            self.callM.callType = NBCallIncoming ;
            
        } else if (call.callState ==CTCallStateDialing) { // 电话开始呼叫
        
            self.callM.startCallTime = [NSDate nb_dateCurrentTime];
             NSLog(@"Call has Dialing/电话开始呼叫 ---%@",self.callM.startCallTime);
        } else {
            NSLog(@"Nothing is done");
        }
    };
}


- (void)postNotificationWithName:(NSString *)keyName{
    NSNotification *notifi = [NSNotification notificationWithName:keyName object:self.callM userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notifi];
    self.callM = nil ;
}

- (NBCallPhoneModel *)callM {
    NBCallPhoneModel *call = objc_getAssociatedObject(self, @selector(callM));
    if (!call) {
        call = [NBCallPhoneModel new];
        objc_setAssociatedObject(self, @selector(callM), call, OBJC_ASSOCIATION_RETAIN);
    }
    return call ;
}

- (void)setCallM:(NBCallPhoneModel *)callM{
    objc_setAssociatedObject(self, @selector(callM), callM, OBJC_ASSOCIATION_RETAIN);
}

- (CTCallCenter *)callCenter {
   return  objc_getAssociatedObject(self, @selector(callCenter));
}

- (void)setCallCenter:(CTCallCenter *)callCenter {
    objc_setAssociatedObject(self, @selector(callCenter), callCenter, OBJC_ASSOCIATION_RETAIN);
}

@end
