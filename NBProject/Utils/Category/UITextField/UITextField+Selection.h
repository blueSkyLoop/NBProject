//
//  UITextField+Selection.h
//  NBProject
//
//  Created by Lucas on 2019/9/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Selection)

- (NSRange)lo_selectedRange;
- (void)lo_setSelectedRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
