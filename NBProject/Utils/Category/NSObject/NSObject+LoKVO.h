//
//  NSObject+LoKVO.h
//  NBProject
//
//  Created by Lucas on 2019/1/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LoKVO)

- (void)nb_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
