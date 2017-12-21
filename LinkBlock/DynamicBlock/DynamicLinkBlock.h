//
//  DynamicLinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DynamicLinkArgument;

@interface DynamicLinkBlock : NSObject

+ (instancetype)dynamicLinkBlockWithCode:(NSString*)code;

@property (nonatomic,strong,readonly) NSArray<NSString*>* objcTypesOfBlockArgs;
@property (nonatomic,assign,readonly) const char* objcTypeOfBlockReturn;
@property (nonatomic,assign,readonly) NSUInteger numberOfArguments;
@property (nonatomic,assign,readonly) NSUInteger lengthOfBlockReturn;


/**
 void类型返回nil；其他空类型都返回NSNull;

 @param origin <#origin description#>
 @param vlist <#vlist description#>
 @param end <#end description#>
 @return <#return value description#>
 */
- (id)invoke:(id)origin args:(va_list)vlist end:(BOOL*)end;

@property (nonatomic,assign,readonly) BOOL validate;
@property (nonatomic,copy,readonly) NSString* stringValue;
@property (nonatomic,copy,readonly) NSString* blockName;

@property (nonatomic,assign,readonly) NSUInteger index;
@property (nonatomic,strong,readonly) NSIndexPath* indexPath;
@property (nonatomic,assign,readonly) NSUInteger countOfItems;

- (BOOL)containsIndexPathOfItem:(NSIndexPath*)indexPath;
- (DynamicLinkArgument*)argumentAtIndexPath:(NSIndexPath*)indexPath;
@end
