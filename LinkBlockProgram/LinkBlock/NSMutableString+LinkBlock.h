//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString(LinkBlock)
@property (nonatomic,copy) NSString*            (^blockCopy)();
@property (nonatomic,copy) NSMutableString*     (^blockReplaceStrWithStr)(NSString* replaceStr, NSString* withStr);
@end
