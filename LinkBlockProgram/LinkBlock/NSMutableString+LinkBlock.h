//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSMutableStringLinkBlock)
@property (nonatomic,copy) NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr);
@end
