//
//  NSObject+LoKVO.m
//  NBProject
//
//  Created by Lucas on 2019/1/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "NSObject+LoKVO.h"
#import <objc/message.h>
@implementation NSObject (LoKVO)

- (void)nb_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    
    // 1.创建一个类
    NSString *oldClassName = NSStringFromClass(self.class);
    NSString *newClassName = [@"LoKVO_" stringByAppendingString:oldClassName];
    
    Class MyClass = objc_allocateClassPair(self.class, newClassName.UTF8String, 0);
    
    /** 注册类！！ */
    objc_registerClassPair(MyClass);
    
    // 注意： 此时，子类是没有父类的方法， 平时子类能够调用父类的方式，原因是子类修改了isa指针，指向了父类，从而调用了父类的方法而已，并不代表子类拥有父类的方法
    
    // 2.重写setName 方法， 这里所谓的重写，实质是添加方法
    /**
     * class 给那个类添加方法
     * sel      方法编号
     * imp      方法实现（函数指针！）
     * type     返回值类型
     */
    // v:代表返回值，  @代表id对象参数， ":"代表 SEL选择子
    class_addMethod(MyClass, @selector(setName:), (IMP)setName, "v@:@");
    
    // 在OC，所有对象调用方法时，底层都是有C函数的 objc_msgSend 进行消息发送，并转发为一下形式
    //    objc_msgSend(一个对象,@selector(方法名));
    // 任何类都可以直接使用 ， self、 _cmd , 这两个是oc里的隐式参数
    
    
    // 3.修改isa 指针！！！
    object_setClass(self, MyClass);
    
    // 4.将观察者保存到当前对象,动态添加属性
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
    
//        object_setClass(self, MyClass);
//    对象只是一个对象，而类型被修改了，这决定这个对象调用方法时去找哪块区域。
}

void setName(id self , SEL _cmd , NSString *newName) {
    
    NSLog(@"来了！！ %@",newName);
    /** 调用父类的setName方法 */
    Class class = [self class]; // 获取当前类型
    object_setClass(self, class_getSuperclass(class));
    // 让父类执行 setName 方法
    
    
    ((void(*)(id,SEL,NSString *))objc_msgSend)(self,@selector(setName:), newName);
//    objc_msgSend(self, @selector(setName:), newName);
    /** 观察者 */
    id observer = objc_getAssociatedObject(self, @"observer");
    if (observer) {
        // 给观察者发送回调消息
        ((void(*)(id,SEL,NSString *,id,NSDictionary *,id))objc_msgSend) (observer,@selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"new:":newName,@"kind":@1},nil);
        
//        objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"new:":newName,@"kind":@1},nil);
    }
    
    // 改回子类
    object_setClass(self, class);
    
}

/**
    1.获取当前的对象类型，然后拼接类型命名并创建一个新类，注册
    2.给此新类添加方法、并把传进来的观察者对象，通过使用动态添加属性把对象保存到当前的新类
    3.将当前的isa 指针修改为“新类”的类型
 
 
    调用setName 方法时
    1.获取当前isa指针类型，并把self 设回其 “父类” ，让父类执行 "setName" 方法
    2.并获取 “观察者” ，判断“观察者” 后向 “观察者” 发送回调消息
    3.最后把当前的 self 改回 子类“LoKVO_Person”
 */

@end
