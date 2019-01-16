//
//  NBLoRuntimModel.h
//  NBProject
//
//  Created by Lucas on 2018/12/21.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.当一个实例对象发送消息时，isa指针会先在当前的类去找方法，若果找不到就会去父类找，如果找到之后就会把方法缓存到子类的 cache 方法列表上
 2.类也是一个对象：类对象， 若果一个方法执行了类方法，会去先去这个对象所属的这个类的方法列表中查找方法；而向一个类发送消息时，会在这个类的meta-class 的方法列表中查找
 3.
 */
@interface NBLoRuntimModel : NSObject


- (void)ex_registerClassPair;
@end
