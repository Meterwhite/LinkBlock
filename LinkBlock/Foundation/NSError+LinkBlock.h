//
//  NSError+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSErrorLinkBlock)
/** <^(id<NSCopying> key)> */
@property (nonatomic,copy,readonly) NSObject*           (^errorValueInUserInfo)(id<NSCopying> key);
@end
