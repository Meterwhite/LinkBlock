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

@property (nonatomic,strong) NSIndexPath* indexPath;
@property (nonatomic,assign) NSUInteger index;
@property (nonatomic,copy) NSString* stringValue;

- (const char*)objcType;
- (void)getValue:(void*)value;
@end
