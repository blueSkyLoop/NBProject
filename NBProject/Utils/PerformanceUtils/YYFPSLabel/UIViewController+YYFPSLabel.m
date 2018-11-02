//
//  UIViewController+YYFPSLabel.m
//  NBProject
//
//  Created by Lucas on 2018/8/22.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "UIViewController+YYFPSLabel.h"
#import "YYFPSLabel.h"
@implementation UIViewController (YYFPSLabel)


#pragma mark - FPS demo

- (void)nb_addFPSLabel {
#ifdef DEBUG
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [fpsLabel sizeToFit];
    [self.view addSubview:fpsLabel];
#endif
    // 如果直接用 self 或者 weakSelf，都不能解决循环引用问题
    
    // 移除也不能使 label里的 timer invalidate
    //        [_fpsLabel removeFromSuperview];
}
@end
