//
//  NBProtocolView.h
//  NBProject
//
//  Created by Lucas on 2018/10/31.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseView.h"
#import "ProtocolConfig.h"

@class NBProtocolView ;
@protocol NBProtocolViewDelegate <NSObject>

@optional
-(void)nb_protocolDelegateMethod:(NBProtocolView *)view;

@end


@interface NBProtocolView : NBBaseView <ProtocolConfig>

@property (nonatomic,weak) id<NBProtocolViewDelegate> delegate;
@end
