//
//  NBRealmController.m
//  NBProject
//
//  Created by Lucas on 2018/7/31.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBRealmController.h"

#import "NBPerson.h"

#import "NBComHeaderFile.h"

@interface NBRealmController ()
@property (nonatomic, strong) NBPerson *realmM;

@property (weak, nonatomic) IBOutlet UITextView *msgLB;
@property (weak, nonatomic) IBOutlet UITextField *valueTF;
@property (weak, nonatomic) IBOutlet UITextField *valueTF2;
@property (weak, nonatomic) IBOutlet UITextField *tabNameTF;

@end

@implementation NBRealmController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置一个数据库
    NSLog(@"fileUrl:%@",[[RLMRealmConfiguration defaultConfiguration] fileURL]);
}

// 由于realm 这里的用法是可以切换不同的数据库，所以 realmTableName 要 动态赋值且必填, 实际开发的时候可以考虑直接实例化时配置上去
- (IBAction)addFunc:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self reloadContent];
        self.realmM.name = self.valueTF2.text;
        [self.realmM saveRealm];
        NSLog(@"fileUrl:%@",[[RLMRealmConfiguration defaultConfiguration] fileURL]);
    });
}


- (IBAction)delFunc:(id)sender {
    [self reloadContent];
    [self.realmM deleteRealm];
}


- (IBAction)updateFunc:(id)sender {
    [self reloadContent];
    self.realmM.name = self.valueTF2.text;
    [self.realmM updateRealm];
}


- (IBAction)checkFunc:(id)sender {
    [self reloadContent];
    self.msgLB.text = [NSString stringWithFormat:@"model:%@",
                       [[self.realmM checkRealm] yy_modelToJSONString]];
}

- (IBAction)checkAll:(id)sender {
    NSArray *a = [NBPerson checkRealmsWithFileName:self.tabNameTF.text];
    self.msgLB.text = [NSString stringWithFormat:@"model:%@",
                       [a yy_modelToJSONString]];
}


- (IBAction)clearRealm:(id)sender {
    self.realmM.realmTableName = self.tabNameTF.text;
    [self.realmM clearRealmFile];
}


- (void)reloadContent {
    self.realmM.primary_id = self.valueTF.text ;
    self.realmM.realmTableName = self.tabNameTF.text;
}

- (NBPerson *)realmM {
    if (!_realmM) {
        _realmM = [NBPerson new];
    }return _realmM;
}
@end
