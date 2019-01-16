//
//  NBLoRuntimeMethodController.m
//  NBProject
//
//  Created by Lucas on 2018/8/29.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoRuntimeMethodController.h"
#import "NSObject+MethodIvar.h"
#import <objc/runtime.h>

#import "Student.h"
@interface NBLoRuntimeMethodController ()
@property (nonatomic ,strong) Student *stu ;
@end

@implementation NBLoRuntimeMethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stu = [[Student alloc]init];
    NSLog(@"%@",self.stu.class);
    
}

- (IBAction)objIvars:(id)sender {
    Ivar *ivars = [NSObject nb_objectWithIvars:self.stu];
    free(ivars);
}

- (IBAction)methodsList:(id)sender {
     [NSObject nb_objectWithMethods:self.stu];
    
}

@end
