//
//  NBCallPhoneModel.m
//  NBProject
//
//  Created by Lucas on 2018/7/24.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBCallPhoneModel.h"

#import "NSObject+isNull.h"
#import "NSDate+Comparison.h"

@implementation NBCallPhoneModel

- (NSString *)lengthTime {
    NSString *str = @"";
    if (self.callResultType != NBCallResultFail && ![self.beginTelTime nb_isNull] && ![self.endCallTime nb_isNull]) {
       str = [NSDate nb_comparisonDateWithType:ComparisonTypeHMS Start:self.beginTelTime end:self.endCallTime];
    }return str;
}

@end
