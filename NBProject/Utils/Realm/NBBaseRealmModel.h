//
//  NBBaseRealmModel.h
//  NBProject
//
//  Created by Lucas on 2018/8/2.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>
@interface NBBaseRealmModel : RLMObject

/** 默认此属性为 realm 数据库的主键 */
@property NSString *primary_id;
@property NSString *name;




/** 数据库表名，此属性主要用于区分多个数据库时，便于查询 ,必须在ignoredProperties 进行忽略；否则会插入到数据库中导致崩溃*/
@property NSString *realmTableName;

//@property RLMLinkingObjects *owners;

#pragma mark - 当子类继承此类时，以下方法必须用子类的类型去调用
/** 增一条：（保存结果： YES成功，NO失败）*/
- (BOOL)saveRealm;


/**  查一条: 默认使用 primary_id 作为主键去查询，一般简单的数据库查询，使用一个键值足矣，若需要多条件查询，需另外重写另外一个方法 */
- (id)checkRealm;

/**  查全部: 根据数据库的文件名进行查找  如： xxx.realm, 参数传:xxx即可 */
+ (NSArray *)checkRealmsWithFileName:(NSString *)fileName;

/**  改:（修改结果： YES成功，NO失败 */
- (BOOL)updateRealm;

/**  删一条：（删除结果： YES成功，NO失败）*/
- (BOOL)deleteRealm;

/** 删除整个reaml本地文件 */
- (void)clearRealmFile;

/** 切换或修改 realm 数据库名字： 只需要在增、删、改、查前调用一下这个方法即可；
   提供一个独立的 Realm 数据库，并且当前账户所使用的数据库将作为默认 Realm 数据库来使用：
   realm 能自动区别大小写 fileName 去查找表
 */
- (void)setDefaultRealmWithFileName:(NSString *)fileName;

- (instancetype)initWithValue:(id)value realmTableName:(NSString *)realmTableName;

@end
