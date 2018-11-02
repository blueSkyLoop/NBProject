//
//  NBKeyedArchiverController.m
//  NBProject
//
//  Created by Lucas on 2018/11/1.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBKeyedArchiverController.h"
#import "NBArchiverModel.h"
#import <ReactiveObjC.h>
@interface NBKeyedArchiverController ()
@property (weak, nonatomic) IBOutlet UITextField *NameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITextField *sexTF;

@property (nonatomic, strong) NSMutableDictionary  *dic;
@end

@implementation NBKeyedArchiverController

- (void)viewDidLoad {
    [super viewDidLoad];
    NBArchiverModel * ac = [NBArchiverModel shareManager] ;
    RAC(ac,name) = RACObserve(self, NameTF.text);
    RAC(ac,age) = RACObserve(self, ageTF.text);
    RAC(ac,sex) = RACObserve(self, sexTF);
    
}


- (IBAction)saveAction:(id)sender {
    [self.dic setValue:self.NameTF.text forKey:@"name"];
    [self.dic setValue:self.ageTF.text forKey:@"age"];
    [self.dic setValue:self.sexTF.text forKey:@"sex"];
    [[NBArchiverModel shareManager] nb_analyzingJson:self.dic];
}


- (IBAction)delAction:(id)sender {
    [[NBArchiverModel shareManager] nb_clearArchive];
}


- (IBAction)checkAction:(id)sender {
    NSLog(@"%@",[[NBArchiverModel shareManager] description]);
}


#pragma mark - lazy
- (NSMutableDictionary *)dic {
    if (!_dic) {
        _dic = [NSMutableDictionary dictionary];
    }return _dic;
}
@end
