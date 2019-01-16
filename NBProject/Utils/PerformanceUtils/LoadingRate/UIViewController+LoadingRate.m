//
//  UIViewController+LoadingRate.m
//  NBProject
//
//  Created by Lucas on 2018/9/6.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "UIViewController+LoadingRate.h"
#import <objc/runtime.h>
#import "MHMacrosLog.h"
#import "NSObject+MethodSwizzling.h"
@implementation UIViewController (LoadingRate)

#ifdef DEBUG
static char *viewLoadStartTimeKey = "viewLoadStartTimeKey";
-(void)setViewLoadStartTime:(CFAbsoluteTime)viewLoadStartTime{
    objc_setAssociatedObject(self, &viewLoadStartTimeKey, @(viewLoadStartTime), OBJC_ASSOCIATION_COPY);
    
}
-(CFAbsoluteTime)viewLoadStartTime{
    return [objc_getAssociatedObject(self, &viewLoadStartTimeKey) doubleValue];
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL origSel = @selector(viewDidAppear:);
        SEL swizSel = @selector(swiz_viewDidAppear:);
        [self nb_exchangeInstanceOriginSEL:origSel currentSEL:swizSel];
        
        SEL vcWillAppearSel=@selector(viewWillAppear:);
        SEL swizWillAppearSel=@selector(swiz_viewWillAppear:);
        [self nb_exchangeInstanceOriginSEL:vcWillAppearSel currentSEL:swizWillAppearSel];
        
        SEL vcDidLoadSel=@selector(viewDidLoad);
        SEL swizDidLoadSel=@selector(swiz_viewDidLoad);
        [self nb_exchangeInstanceOriginSEL:vcDidLoadSel currentSEL:swizDidLoadSel];
        
        SEL vcDidDisappearSel=@selector(viewDidDisappear:);
        SEL swizDidDisappearSel=@selector(swiz_viewDidDisappear:);
        [self nb_exchangeInstanceOriginSEL:vcDidDisappearSel currentSEL:swizDidDisappearSel];
        
        SEL vcWillDisappearSel=@selector(viewWillDisappear:);
        SEL swizWillDisappearSel=@selector(swiz_viewWillDisappear:);
        [self nb_exchangeInstanceOriginSEL:vcWillDisappearSel currentSEL:swizWillDisappearSel];
    });
}


- (void)swiz_viewDidAppear:(BOOL)animated
{
    [self swiz_viewDidAppear:animated];
    if (self.viewLoadStartTime) {
        CFAbsoluteTime linkTime = (CACurrentMediaTime() - self.viewLoadStartTime);
        NSLog(@" %f s--------------------ssssss   %@:速度：         %f s",self.viewLoadStartTime, self.class,linkTime);
        self.viewLoadStartTime = 0;
    }
}

-(void)swiz_viewWillAppear:(BOOL)animated
{
    [self swiz_viewWillAppear:animated];
}

-(void)swiz_viewDidDisappear:(BOOL)animated
{
    [self swiz_viewDidDisappear:animated];
}

-(void)swiz_viewWillDisappear:(BOOL)animated
{
    [self swiz_viewWillDisappear:animated];
}
-(void)swiz_viewDidLoad
{
    self.viewLoadStartTime =CACurrentMediaTime();
    NSLog(@" %@swiz_viewDidLoad startTime:%f",self.class, self.viewLoadStartTime );
    [self swiz_viewDidLoad];
}
#endif

@end
