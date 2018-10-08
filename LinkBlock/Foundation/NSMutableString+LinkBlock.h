//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef NSMutableStringNew
#define NSMutableStringNew ([NSMutableString new])
#endif
@interface NSObject(NSMutableStringLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare NSMutableString*     (^m_strInsertStrAt)(NSString* str, NSUInteger idx);
LBDeclare NSMutableString*     (^m_strAppend)(id obj);
LBDeclare NSMutableString*     (^m_strReplace)(NSString* replaceStr, NSString* withStr);
LBDeclare NSMutableString*     (^m_strDeleteInRange)(NSRange range);

#pragma mark - Foundation Speed/速度
/** @"" */
LBDeclare NSMutableString*     (^m_strClear)(void);


@end


@interface NSMutableString (NSMutableStringLinkBlock)
/** Enumerate string by composed and modify. */
- (void)m_strEnumerateComposedModifiedUsingBlock:(void(^)(NSString** string,NSRange range,BOOL *stop))block;
@end
