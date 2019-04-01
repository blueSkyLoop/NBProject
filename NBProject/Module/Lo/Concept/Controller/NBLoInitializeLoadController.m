//
//  NBLoInitializeLoadController.m
//  NBProject
//
//  Created by Lucas on 2018/8/30.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoInitializeLoadController.h"


#import "TestButton.h"
#import "SubclassButton.h"
#import "SubclassButton+color.h"
#import "SubclassButton+border.h"
#import "TestButton+Frame.h"


@interface NBLoInitializeLoadController ()


@property (nonatomic , strong)SubclassButton *btn;
@property (nonatomic , strong)TestButton *testBtn;

@end

@implementation NBLoInitializeLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        SubclassButton *btn = [[SubclassButton alloc] init];
        self.btn = btn;
        btn.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:btn];
        [btn setBorderWidth:3];
        [btn setColor:[UIColor redColor]];
    }
    
    {
        TestButton *btn = [[TestButton alloc] init];
        self.testBtn = btn;
        btn.frame = CGRectMake(100, 210, 100, 100);
        [self.view addSubview:btn];
        btn.backgroundColor = [UIColor blueColor];
    }
    
    /* 结论:
     分类和类自身都实现的initialize方法,会调用分类的initialize,不调用类自身的initialize
     
     load方法按照 父类 --> 子类 --> 类自身 --> Category的顺序被调用
     */
    /*
     2018-08-30 16:20:55.551241+0800 NBProject[39793:1959864] TestButton         Frame initialize (分类)
     2018-08-30 16:20:55.553416+0800 NBProject[39793:1959864] TestButton         load
     2018-08-30 16:20:55.555236+0800 NBProject[39793:1959864] SubclassButton     color initialize
     2018-08-30 16:20:55.556034+0800 NBProject[39793:1959864] SubclassButton SubclassButton load
     2018-08-30 16:20:55.621864+0800 NBProject[39793:1959864] TestButton         Frame load
     2018-08-30 16:20:55.622055+0800 NBProject[39793:1959864] SubclassButton     border load
     2018-08-30 16:20:55.622207+0800 NBProject[39793:1959864] SubclassButton     color load
     */
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 会先调用 Swizzling 添加的类方法 xl_testButtonLog ，然后再调用 父类的 testButtonLog
    /*
     2018-08-30 16:31:49.171117+0800 NBProject[40008:1982460] -[SubclassButton xl_testButtonLog]
     2018-08-30 16:31:54.554644+0800 NBProject[40008:1982460] TestButton -[TestButton testButtonLog]
     */
    [self.btn testButtonLog];
    [self.testBtn testButtonLog];
}
@end
