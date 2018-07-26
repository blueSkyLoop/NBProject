//
//  UIViewController+MHTelephone.m
//  WonderfulLife
//
//  Created by Beelin on 17/7/30.
//  Copyright © 2017年 WuHanMeiHao. All rights reserved.
//

#import "UIViewController+MHTelephone.h"
#import "MHHUDManager.h"
#import "NSObject+isNull.h"

@implementation UIViewController (MHTelephone)
- (void)mh_telephone:(NSString *)phoneNumber {
    if ([phoneNumber nb_isNull]) {
        [MHHUDManager showText:@"找不到电话号码"];
    } else {
        NSString *phoneStr = [[NSMutableString alloc] initWithFormat:@"tel://%@",phoneNumber];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:phoneNumber message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
