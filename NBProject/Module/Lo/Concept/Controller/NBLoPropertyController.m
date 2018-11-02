//
//  NBPropertyController.m
//  NBProject
//
//  Created by Lucas on 2018/8/28.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoPropertyController.h"
#import "MidStudent.h"
#import "MHMacrosLog.h"
#import "HLWebViewController.h"

#import <ReactiveObjC.h>
#import <Masonry.h>

@interface NBLoPropertyController (){
    NSArray *_father ;
}

//@property(nonatomic , strong)NSString *father ;

@end



@implementation NBLoPropertyController
//  @synthesize 属性名 = 变量名， 这种写法意思是： 将属性的getter 、setter 方法让“变量”可以调用；
//  当使用了懒加载时（加载前），若属性的值为空，却直接用变量名(_father)访问，此情况是不会有值的，调用懒加载要用属性去调用，不能用变量名调用懒加载
//@synthesize _father = aFather;

//  https://www.jianshu.com/p/6ca11cbe4187
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *s = @[[UIButton new],@"2333",@"2333",@"2333"];
    _father  = s ;
    NSLog(@"array:%@",_father);
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.height.and.width.equalTo(@100);
        make.center.mas_equalTo(self.view);
    }];
    
    [[btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        HLWebViewController * hl = [[HLWebViewController alloc] initWithUrl:@"https://www.jianshu.com/p/6ca11cbe4187" webType:HLWebViewTypeH5CanBack];
        [self.navigationController pushViewController:hl animated:YES];
    }];
    
    
    // .m文件内的成员变量、属性，在外部都是无法访问的，只能在对应的.m文件使用
    //  @public:在任何地方都能直接访问对象的成员变量
    
    MidStudent *midStu = [MidStudent new];
    NSLog(midStu->_name);
//    NSLog(midStu->_six); // 无法访问，会报错
    NSLog([NSString stringWithFormat:@"%ld",midStu->_source]);
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"array:%@",_father);
}

//- (NSString *)_father {
//    if (!_father) {
//        _father = @"111";
//    }return _father;
//}

@end
