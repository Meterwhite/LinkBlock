//
//  DynamicLinkArgument.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DynamicLinkArgument;

@interface DynamicLinkArgument : NSObject

/**
 构造失败返回nil
 */
+ (instancetype)dynamicLinkArgumentFromVlueCode:(NSString*)code;

@property (nonatomic,strong,readonly) NSIndexPath* indexPath;
@property (nonatomic,assign,readonly) NSUInteger index;
@property (nonatomic,copy,readonly) NSString* stringValue;

@property (nonatomic,assign,readonly) const char* objcType;
@property (nonatomic,strong,readonly) NSValue* objcValue;
@end
