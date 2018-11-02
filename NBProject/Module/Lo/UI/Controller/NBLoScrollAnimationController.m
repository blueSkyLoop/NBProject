//
//  NBLoScrollAnimationController.m
//  NBProject
//
//  Created by Lucas on 2018/8/22.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoScrollAnimationController.h"
#import "WSLAnimationView.h"

#define BaseTag 10


/**
 动画偏移量 是指rightView相对于leftView的偏移量
 */
#define AnimationOffset 100


@interface NBLoScrollAnimationController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation NBLoScrollAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, MSafeAreaHeight_NaviBar, MScreenW, MScreenH - MSafeAreaHeight_NaviBar)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(MScreenW * 4, MScreenH - MSafeAreaHeight_NaviBar);
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    for (int i = 0; i < 4 ; i++) {
        WSLAnimationView * view = [[WSLAnimationView alloc] initWithFrame:CGRectMake(i * MScreenW, 0, MScreenW, MScreenH - MSafeAreaHeight_NaviBar)];
        view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        view.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        view.imageView.contentMode = UIViewContentModeScaleToFill;
        [_scrollView addSubview:view];
        view.tag = BaseTag + i;
    }
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat x = scrollView.contentOffset.x;
    
    NSInteger leftIndex = x/MScreenW;
    //    NSLog(@"%ld",leftIndex);
    
    //这里的left和right是区分拖动中可见的两个视图
    WSLAnimationView * leftView = [scrollView viewWithTag:(leftIndex + BaseTag)];
    WSLAnimationView * rightView = [scrollView viewWithTag:(leftIndex + 1 + BaseTag)];
    
    
    //    leftView.contentX = -(SCROLLVIEW_WIDTH - x + (leftIndex * SCROLLVIEW_WIDTH));
    //    rightView.contentX = (SCROLLVIEW_WIDTH + x - ((leftIndex + 1) * SCROLLVIEW_WIDTH));
    
    
    rightView.contentX = -(MScreenW - AnimationOffset) + (x - (leftIndex * MScreenW))/MScreenW * (MScreenW - AnimationOffset);
    leftView.contentX = ((MScreenW - AnimationOffset) + (x - ((leftIndex + 1) * MScreenW))/MScreenW * (MScreenW - AnimationOffset));
    
}


@end
