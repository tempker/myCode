//
//  WYYWorkTool.h
//  单例
//
//  Created by 元元魏 on 16/6/11.
//  Copyright © 2016年 魏元元. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYYWorkTool : NSObject <NSCopying>

+(instancetype)shareWorkTool;

@end
