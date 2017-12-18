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

@property (nonatomic,strong,readonly) NSArray* objcTypesOfBlock;
@property (nonatomic,assign,readonly) NSUInteger index;
@property (nonatomic,strong,readonly) NSIndexPath* indexPath;
@property (nonatomic,assign,readonly) NSUInteger countOfItems;
@property (nonatomic,copy,readonly) NSString* code;

- (BOOL)containsIndexPathOfItem:(NSIndexPath*)indexPath;
- (DynamicLinkArgument*)argumentAt:(NSUInteger)idx;

- (id)invoke:(id)target args:(va_list)args atIndex:(NSUInteger*)idx;
@end
