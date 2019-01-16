//
//  NBLoEBPushController.m
//  NBProject
//
//  Created by Lucas on 2018/12/10.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoEBPushController.h"
#import <EBBannerView.h>
#import <EBCustomBannerView.h>
#import "NBMacros.h"
@interface NBLoEBPushController ()

@end

@implementation NBLoEBPushController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)customMethod:(id)sender {
    [EBCustomBannerView showCustomView:self.view block:^(EBCustomBannerViewMaker *make) {
//        make.portraitFrame = CGRectMake(0, 0, MScreenW, 64);//竖屏时的 frame
        make.portraitMode = EBCustomViewAppearModeTop;//竖屏时弹出方向
        make.soundID = 1312;//声音
        make.stayDuration = 3.0;//停留时间
        //......
    }];
}

- (IBAction)customMethod2:(id)sender {
    //1.传入 view，并构造必要的参数
    EBCustomBannerView *customView = [EBCustomBannerView customView:self.view block:^(EBCustomBannerViewMaker *make) {
//        make.portraitFrame = CGRectMake(0, 0, MScreenW, 64);//竖屏时的 frame
        make.portraitMode = EBCustomViewAppearModeTop;//竖屏时弹出方向
        make.soundID = 1312;//声音
        make.stayDuration = 3.0;//停留时间
        //......
    }];
    
    //2.展示
    [customView show];
}

- (IBAction)systemMethod:(id)sender {
    [EBBannerView showWithContent:@"自定义内容"];
}


- (IBAction)systemMethod2:(id)sender {
    EBBannerView *banner = [EBBannerView bannerWithBlock:^(EBBannerViewMaker *make) {
        make.style = EBBannerViewStyleiOS9;//指定系统样式，不指定自动依据系统显示不同样式
        //make.style = 9;//展示 iOS9 样式
        make.content = @"MINE eye hath played the painter and hath stelled";
        //make.object = ...
        //make.icon = ...
        //make.title = ...
        //make.soundID = ...
    }];
    
    [banner show];
}
@end
