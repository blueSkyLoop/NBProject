//
//  Student.h
//  NBProject
//
//  Created by Lucas on 2018/8/27.
//  Copyright © 2018年 com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
@public
    NSString *_name;
@private
    NSString *_six;
@protected  // 只能在Student 或 其子类里访问,由于age是@protrcted在外部是不能被访问的!
    NSInteger _age;
@package
    NSInteger _source;
}


@property (nonatomic, copy) NSString *userName;

- (void)study ;


- (void)run ;
@end
