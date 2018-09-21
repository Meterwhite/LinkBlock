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
LBDeclare NSMutableString*     (^m_strInsertStrAt)(NSString* str, NSUInteger idx);
LBDeclare NSMutableString*     (^m_strAppend)(id obj);
LBDeclare NSMutableString*     (^m_strReplace)(NSString* replaceStr, NSString* withStr);
LBDeclare NSMutableString*     (^m_strDeleteInRange)(NSRange range);
/** <^()> set to @"" */
LBDeclare NSMutableString*     (^m_strClear)(void);
@end


@interface NSMutableString (NSMutableStringLinkBlock)
/** 遍历同时可修改字符串，遍历按元字符组成的序列，即汉字，emoji，都作为一个字符。返回修改后结果 */
- (void)m_strEnumerateComposedModifiedUsingBlock:(void(^)(NSString** string,NSRange range,BOOL *stop))block;


@end
