//
//  MHBaseListPageViewModel.h
//  WonderfulLife
//
//  Created by lgh on 2017/12/29.
//  Copyright © 2017年 WuHanMeiHao. All rights reserved.
//

#import "NBBaseViewModel.h"

@interface NBListPageHttpConfig : NBHttpConfig

//分页列表解析器，这里只要解析到分页层即可
@property (nonatomic,copy)void (^ListParserBlock)(NBParserMarker *marker);

//返回一个默认配置的请求配置
+ (NBListPageHttpConfig *)listDefaultHttpConfig;

@end

@interface NBBaseListPageViewModel : NBBaseViewModel

@property (nonatomic,assign)NSInteger mh_currentPage;
@property (nonatomic,assign)NSInteger mh_total_pages;
@property (nonatomic,assign)BOOL mh_has_next;
@property (nonatomic,assign)BOOL mh_isRefresh;

//实例化一个分页列表的基础的请求配置
- (NBListPageHttpConfig *)mh_listDefaultHttpConfigWithApi:(NSString *)apiStr;

@end
