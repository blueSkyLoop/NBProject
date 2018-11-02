//
//  NBFMDBController.m
//  NBProject
//
//  Created by Lucas on 2018/7/26.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBLoFMDBController.h"
#import "NBSQLPerson.h"
#import <YYModel.h>
@interface NBLoFMDBController ()

// 单条数据
@property (nonatomic, strong)NBSQLPerson *person ;

/** 多条数据 */
@property (strong,nonatomic) NSMutableArray <NBSQLPerson *>*persons;
@property (weak, nonatomic) IBOutlet UITextView *msgLB;

@property (weak, nonatomic) IBOutlet UITextField *sReplaceKeyTF;
@property (weak, nonatomic) IBOutlet UITextField *sReplaceValueTF;
@property (weak, nonatomic) IBOutlet UITextField *sFindKeyTF;
@property (weak, nonatomic) IBOutlet UITextField *sFindValueTF;


@end

@implementation NBLoFMDBController

//static NSString * tablename = @"NBSQLPerson_Table";

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 增加一个对象
- (IBAction)add:(id)sender {
    [[NBSQLPerson Person] bg_save];
}

// 删除：给出指定的参数作出
- (IBAction)delete:(id)sender {
    self.sFindKeyTF.text = @"person_id";
    //格式： where key=value
    NSString * where = [NSString stringWithFormat:@"where %@=%@",bg_sqlKey(self.sFindKeyTF.text),bg_sqlValue(self.sFindValueTF.text)];
    [NBSQLPerson bg_delete:nil where:where];
}

// 改：根据指定的key ，对旧值修改
- (IBAction)update:(id)sender {
    // set %@=%@   此处设置的为新值
    // where %@=%@  找到对应的旧值
    // 如: set age=29 where person_id=10086，根据person_id = 10086 查表， 将age的值修改为29
    NSString * where = [NSString stringWithFormat:@"set %@=%@ where %@=%@",
            bg_sqlKey(self.sReplaceKeyTF.text),bg_sqlValue(self.sReplaceValueTF.text),
            bg_sqlKey(self.sFindKeyTF.text),bg_sqlValue(self.sFindValueTF.text)];
    [NBSQLPerson bg_update:nil where:where];
}


// 查询：单条数据
- (IBAction)check:(id)sender {
    self.msgLB.text = [[NBSQLPerson bg_firstObjet:nil] yy_modelToJSONString];
}



// 直接删除数据表的数据
- (IBAction)deleteList:(id)sender {
    [NBSQLPerson bg_delete:nil row:1];
}

//  修改 person.teacher 里的二层嵌套属性
- (IBAction)updateComposite:(id)sender {
    NSArray *pathValues = @[@"teacher.subjects",bg_equal,self.sFindValueTF.text];
    NSString * where = [NSString stringWithFormat:@"where %@",bg_keyPathValues(pathValues)];
    self.person.teacher.subjects = self.sReplaceValueTF.text;
    [self.person bg_updateWhere:where];
}


// 查询整个 person 表的数据
- (IBAction)checkPersons:(id)sender {
    self.msgLB.text =[[NSMutableArray arrayWithArray:[NBSQLPerson bg_findAll:nil]] yy_modelToJSONString];
    NSLog(@"persons:%@\ncount:%ld",self.msgLB.text,self.persons.count)
    ;
}





// person 表第一条数据
- (NBSQLPerson *)person {
    if (!_person) {
        _person = [NBSQLPerson bg_firstObjet:nil];
        if (!_person) {
            _person = [NBSQLPerson Person];
        }
    }return _person;
}

// 整个 person 表的集合
- (NSMutableArray<NBSQLPerson *> *)persons {
    return [NSMutableArray arrayWithArray:[NBSQLPerson bg_findAll:nil]];
}

@end
