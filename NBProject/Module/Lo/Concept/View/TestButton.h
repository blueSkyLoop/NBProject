//
//  TestButton.h
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+MethodSwizzling.h"

@interface TestButton : UIButton

- (void)testButtonLog;

@end
