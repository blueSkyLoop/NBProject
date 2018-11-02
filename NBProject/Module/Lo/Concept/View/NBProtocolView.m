//
//  NBProtocolView.m
//  NBProject
//
//  Created by Lucas on 2018/10/31.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBProtocolView.h"
@interface NBProtocolView ()

@end
@implementation NBProtocolView


- (void)nb_protocolMethod:(id)sender {
    NSLog(@"diao");
    if (self.delegate && [self.delegate respondsToSelector:@selector(nb_protocolDelegateMethod:)]) {
        [self.delegate nb_protocolDelegateMethod:self];
    }
}


@end
