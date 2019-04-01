//
//  NBPushSound.m
//  LaiKeBaoNew
//
//  Created by Lucas on 2018/12/11.
//  Copyright © 2018年 lgh. All rights reserved.
//

#import "NBPushSound.h"
//#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface NBPushSound ()
@property (nonatomic , strong)NSLock *lock;
@end


@implementation NBPushSound

#pragma mark -播放音乐//初始化音乐播放器
static SystemSoundID SoundID = 0 ;

static NBPushSound *soundM = nil;


+ (void)pushSound:(NSDictionary *)userInfo {
    

    
#if TARGETS_Counselor 
    if (soundM == nil) {
        soundM = [NBPushSound new];
    }
    [soundM nb_pushSound:userInfo];
#endif
}

- (void)nb_pushSound:(NSDictionary *)userInfo {
    NSString * pushSound = [[userInfo objectForKey:@"aps"] objectForKey:@"sound"];//播放的声音
    [self.lock lock];
    if (![pushSound isEqualToString:@"default"]) {
        //// 1.需要指定声音的文件路径，这个方法需要加载不同的音效
        NSString*path = [[NSBundle mainBundle] pathForResource:pushSound ofType:nil];
        NSLog(@"path:%@",path);
        
        // 2.将路径字符串转换成url
        NSURL*url = [NSURL fileURLWithPath:path];
        if (path) {
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &SoundID);
            AudioServicesPlaySystemSound(SoundID);
        }
    }
    // 3.初始化音效
    // 3.1 url => CFURLRef
    // 3.2 SystemSoundIDSystemSoundIDsoundId;
    // url先写个错的，然后让xcode帮我们智能修订，这里的方法不要硬记！
//    AudioServicesPlaySystemSound(push);
    
    
    AudioServicesPlaySystemSoundWithCompletion(SoundID, ^{
        [self stopAlertSoundWithSoundID:SoundID];
        [self.lock unlock];
    });
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);// 让手机震动
    
}


-(void)stopAlertSoundWithSoundID:(SystemSoundID)sound {
    AudioServicesDisposeSystemSoundID(kSystemSoundID_Vibrate);
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesRemoveSystemSoundCompletion(sound);
}


- (NSLock *)lock {
    if (!_lock) {
        _lock = [NSLock new];
    }
    return _lock;
}

@end
