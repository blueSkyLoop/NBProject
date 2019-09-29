//
//  LKKeyBoardView.h
//  NBProject
//
//  Created by Lucas on 2019/8/30.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, LKKeyBoardStyle){
    
    /** 普通*/
    LKKeyBoardStyle_Normal,
    
    /** 带标题*/
    LKKeyBoardStyle_title
};


typedef NS_ENUM(NSInteger, LKKeyBoardInputType){
    
    /** 普通状态*/
    LKKeyBoardInputType_Normal,
    
    /** 要求全号输入：“*”号不能点击 */
   LKKeyBoardInputType_fullNum
    
   
} ;


typedef void(^KeyBoardInputBlock)(NSString *text);

@interface LKKeyBoardView : UIView



/**
 *   参数1：键盘风格
 *   参数2：输入类型（全号，隐号）两种输入方法
 *   参数3：对应的 textField
 *   参数4：输出内容
 */

- (instancetype)initWithStyle:(LKKeyBoardStyle)style type:(LKKeyBoardInputType)type textField:(UITextField *)textField block:(KeyBoardInputBlock)block;
@end

NS_ASSUME_NONNULL_END
