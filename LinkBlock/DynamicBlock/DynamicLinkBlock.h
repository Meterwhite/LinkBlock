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

@property (nonatomic,assign,readonly) NSUInteger index;
@property (nonatomic,strong) NSIndexPath* indexPath;
@property (nonatomic,assign) NSUInteger countOfItem;
@property (nonatomic,copy) NSString* stringValue;

- (BOOL)containsIndexPathOfItem:(NSIndexPath*)indexPath;
- (DynamicLinkArgument*)argumentAt:(NSUInteger*)idx;
@end
