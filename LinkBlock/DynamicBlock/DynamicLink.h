//
//  DynamicLink.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DynamicLinkBlock;
@class DynamicLinkArgument;

@interface DynamicLink : NSObject

+ (instancetype)dynamicLinkWithCode:(NSString*)code;
@property (nonatomic,readonly) NSString* code;
@property (nonatomic,assign,readonly) NSUInteger countOfItem;

- (DynamicLinkBlock*)blockAtIndexPath:(NSIndexPath*)indexPath;
- (DynamicLinkArgument*)argumentAtIndexPath:(NSIndexPath*)indexPath;

- (id)invokeLinkWith:(id)linkObj args:(va_list)args;
@end
