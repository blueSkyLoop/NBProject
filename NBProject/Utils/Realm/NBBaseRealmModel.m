//
//  NBBaseRealmModel.m
//  NBProject
//
//  Created by Lucas on 2018/8/2.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "NBBaseRealmModel.h"
#import <YYModel.h>
#import <objc/runtime.h>
#import "NSObject+isNull.h"
@implementation NBBaseRealmModel
/*
 //方法1:
 Stu *stu = [[Stu alloc]initWithValue:@[@2,@"土豆"]];
 RLMRealm *realm = [RLMRealm defaultRealm];
 [realm beginWriteTransaction];
 [realm addObject:stu];
 [realm commitWriteTransaction];
 
 //方法2:
 Stu *stu = [[Stu alloc]initWithValue:@[@2,@"土豆"]];
 RLMRealm *realm = [RLMRealm defaultRealm];
 [realm transactionWithBlock:^{
 [realm addObject:stu];
 }];
 
 //方法3:
 RLMRealm *realm = [RLMRealm defaultRealm];
 [realm transactionWithBlock:^{
 [Stu createInRealm:realm withValue:@{@"num":@3,@"name":@"哈哈"}];
 }];
 
 */

- (instancetype)initWithValue:(id)value realmTableName:(NSString *)realmTableName {
    self = [super initWithValue:value];
    if (self) {
        self.realmTableName = realmTableName ;
    }return self;
}

- (BOOL)saveRealm {
    // 无主键数值，不保存
    if (self.primary_id == nil || self.primary_id.length == 0) return NO;
    // 查主键，判断是否已存在此数据，重复保存同一个主键会导致崩溃
    id rm = [self checkRealm];
    if (rm == nil) { // 数据库查不到，就保存一次
        NSDictionary *rmDic = [self yy_modelToJSONObject];
        rm = [[[self class] alloc] initWithValue:rmDic];
        
        NSError *error = nil ;
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addObject:rm];
        [realm commitWriteTransaction:&error];
        return error == nil ? YES : NO;
    }else { // 数据库查到，就更新一次
       return [self updateRealm];
    }
}



- (id)checkRealm {
    [self setDefaultRealmFileName];
    // 查看数据库是否存在此数据
    NSString *where = [NSString stringWithFormat:@"primary_id = '%@'",self.primary_id];
    RLMResults *result = [[self class] objectsWhere:where];
    NSDictionary *resJson = [[result firstObject] yy_modelToJSONObject];
    NBBaseRealmModel *rm = [[self class] yy_modelWithJSON:resJson];
    rm.realmTableName = self.realmTableName; // 数据库把"库名"忽略了，重设一次
    return rm;
}

+ (NSArray *)checkRealmsWithFileName:(NSString *)fileName {
    RLMResults *results ;
    NSMutableArray *realms = [NSMutableArray array];
    if ([NSObject isNull:fileName]) {
        results = [self allObjects];
    }else{
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        //使用默认的目录,使用用户名来替换默认的文件名
        NSURL *fileUrl = [[[config.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:fileName] URLByAppendingPathExtension:@"realm"];
        
        RLMRealm *petsRealm = [RLMRealm realmWithURL:fileUrl]; // 获得一个指定的 Realm 数据库
        results = [self allObjectsInRealm:petsRealm];
    }
    for (id model in results) {
        NSDictionary *dic = [model yy_modelToJSONObject];
        id rm = [self yy_modelWithJSON:dic];
        [realms addObject:rm];
    }
    return [realms copy];
}


- (BOOL)deleteRealm {
    // 无主键数值，不删除
    if (self.primary_id == nil || self.primary_id.length == 0) return NO;
    id rm = [self checkRealm];
    if (rm) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        id rmDel = [[self class] objectInRealm:realm forPrimaryKey:self.primary_id];
        NSError *error = nil ;
        [realm beginWriteTransaction];
        [realm deleteObject:rmDel];
        [realm commitWriteTransaction:&error];
        return error == nil ? YES : NO;
    }
    return YES;
}


- (BOOL)updateRealm {
    [self setDefaultRealmFileName];
    RLMRealm * realm = [RLMRealm defaultRealm];
    NSError *error = nil ;
    [realm beginWriteTransaction];
    [[self class] createOrUpdateInRealm:realm withValue:self];
    [realm commitWriteTransaction:&error];
    return error == nil ? YES : NO;
}

- (void)clearRealmFile {
    [self setDefaultRealmFileName];
    [[NSFileManager defaultManager] removeItemAtURL:[RLMRealmConfiguration defaultConfiguration].fileURL error:nil];
}

- (void)setDefaultRealmFileName {
    NSString *fileName = self.realmTableName;
    if (fileName == nil || fileName.length == 0) { // 若没设置 数据库名，则使用默认
        fileName = @"default";
    }
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //使用默认的目录,使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:fileName] URLByAppendingPathExtension:@"realm"];
    //将这个配置应用到默认的realm数据库中
    [RLMRealmConfiguration setDefaultConfiguration:config];
}


#pragma mark - Realm config

+ (NSString *)primaryKey {
    return @"primary_id";
}

/** 子类若有属性需要忽略的话，请重写此方法并 调用 [super ignoredProperties]*/
+ (NSArray<NSString *> *)ignoredProperties {
    return @[@"realmTableName"];
}

// 设置默认属性的值
//+ (NSDictionary *)defaultPropertyValues {
//    return  @{@"realmTableName":NSStringFromClass([self class])};
//}

// 重写 linkingObjectsProperties,使得 person 与 cars 进行关联
//+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties{
//    return @{
//             @"owners":[RLMPropertyDescriptor descriptorWithClass:NBRLMPerson.class propertyName:@"cars"],
//             };
//}
@end
