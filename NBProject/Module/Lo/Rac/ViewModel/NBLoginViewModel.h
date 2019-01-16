//
//  NBLoginViewModel.h
//  NBProject
//
//  Created by Lucas on 2019/1/14.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface NBLoginViewModel : NSObject
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) RACSignal  *loginEnableSignal;
@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic, strong) RACSubject *statusSubject;
@property (nonatomic) BOOL islogining;

@end
