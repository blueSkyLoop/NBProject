//
//  NBNavigationController.h
//  NBProject
//
//  Created by Lucas on 2018/7/9.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBNavigationController : UINavigationController

/** 初始化 NBNavigationController */
- (NBNavigationController *)initWithController:(UIViewController *)curreVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;
@end
