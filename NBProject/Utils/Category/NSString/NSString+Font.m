//
//  NSString+Font.m
//  NBProject
//
//  Created by Lucas on 2018/7/12.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NSString+Font.h"
#import "NBMacros.h"
@implementation NSString (Font)


#pragma mark 字体适配
+ (UIFont *)nb_fontWithSize:(CGFloat)fontSize{
    return [UIFont systemFontOfSize:MScale * fontSize];
}
+ (UIFont *)nb_weightMediumFontWithSize:(CGFloat)fontSize{
    UIFont *afont ;
    if([UIDevice  currentDevice].systemVersion.floatValue >= 8.2){
        afont = [UIFont systemFontOfSize:MScale * fontSize weight:UIFontWeightMedium];
    }else{
        afont = [UIFont systemFontOfSize:MScale * fontSize];
    }
    return afont;
}
+ (UIFont *)nb_semiboldFontWithSize:(CGFloat)fontSize{
    UIFont *afont ;
    if([UIDevice  currentDevice].systemVersion.floatValue >= 8.2){
        afont = [UIFont systemFontOfSize:MScale * fontSize weight:UIFontWeightSemibold];
    }else{
        afont = [UIFont systemFontOfSize:MScale * fontSize];
    }
    return afont;
}

@end
