//
//  WYYWorkTool.m
//  单例
//
//  Created by 元元魏 on 16/6/11.
//  Copyright © 2016年 魏元元. All rights reserved.
//

#import "WYYWorkTool.h"

@implementation WYYWorkTool
static id instance = nil;
//+(instancetype)shareWorkTool{
//    
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[WYYWorkTool alloc]init];
//    });
//    return instance;
//}

+(instancetype)shareWorkTool{
    
    return [[self alloc]init];
}

//通过alloc方法创建对象的方法
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
//通过copy方法创建对想的方法
-(instancetype)copyWithZone:(NSZone *)zone{
    return instance;
}

@end
