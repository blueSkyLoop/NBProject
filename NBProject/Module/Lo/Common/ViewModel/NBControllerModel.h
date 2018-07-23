//
//  NBControllerModel.h
//  NBProject
//
//  Created by Lucas on 2018/7/17.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBControllerModel : NSObject
@property (nonatomic, copy)   NSString * title;
@property (nonatomic, copy)   NSString * className;

+ (instancetype)controllerModelWithTitle:(NSString *)title className:(NSString *)className;

+ (NSArray *)controllersWithDics:(NSArray *)dics;
@end
