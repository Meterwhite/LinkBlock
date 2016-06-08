//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSMutableStringNew ([NSMutableString new])
@interface NSObject(NSMutableStringLinkBlock)
@property (nonatomic,copy) NSMutableString*     (^m_strInsertStrAt)(NSString* str, NSUInteger idx);
@property (nonatomic,copy) NSMutableString*     (^m_strAppenStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr);
@property (nonatomic,copy) NSMutableString*     (^m_strDeleteInRange)(NSRange range);
@property (nonatomic,copy) NSMutableString*     (^m_strClear)();

#pragma mark - SQL拼接部分
#define SQLNew ([NSMutableString new])
@property (nonatomic,copy) NSMutableString*     (^SQLStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^SQLInt)(NSInteger intVal);
@property (nonatomic,copy) NSMutableString*     (^SQLDouble)(double doubleVal);
@property (nonatomic,copy) NSMutableString*     (^SQLArr)(NSArray* arr);
@property (nonatomic,copy) NSMutableString*     (^SQLDictKeys)(NSDictionary* dict);
@property (nonatomic,copy) NSMutableString*     (^SQLDictValues)(NSDictionary* dict);

/** 单引号包围的值 '...' */
@property (nonatomic,copy) NSMutableString*     (^SQLStrInStr)(NSString* str);
/** 单引号包围的值 '...' */
@property (nonatomic,copy) NSMutableString*     (^SQLIntInStr)(NSInteger intVal);
/** 单引号包围的值 '...' */
@property (nonatomic,copy) NSMutableString*     (^SQLDoubleInStr)(double doubleVal);

@property (nonatomic,copy) NSMutableString*     (^SQL_Select)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Where)();
@property (nonatomic,copy) NSMutableString*     (^SQL_From)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Create)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Update)();
@property (nonatomic,copy) NSMutableString*     (^SQL_InsertInto)();
@property (nonatomic,copy) NSMutableString*     (^SQL_ReplaceInto)();

@property (nonatomic,copy) NSMutableString*     (^SQL_And)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Or)();
@property (nonatomic,copy) NSMutableString*     (^SQL_In)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Distinct)();
@property (nonatomic,copy) NSMutableString*     (^SQL_As)();
@property (nonatomic,copy) NSMutableString*     (^SQL_Like)();
/** 逗号 */
@property (nonatomic,copy) NSMutableString*     (^SQL_Comma)();
/** 括号包围 */
@property (nonatomic,copy) NSMutableString*     (^SQL_InPair)(id val);
/** 单引号包围 */
@property (nonatomic,copy) NSMutableString*     (^SQL_InvertedComma)(id val);

@end


@interface NSMutableString (NSMutableStringLinkBlock)
/** 遍历同时可修改字符串，遍历按元字符组成的序列，即汉字，emoji，都作为一个字符。返回修改后结果 */
- (void)m_strEnumerateComposedModifiedUsingBlock:(void(^)(NSString** string,NSRange range,BOOL *stop))block;

/** 方便阅读 */
- (NSMutableString*)SQLUsing:(void(^)(NSMutableString* makeSQL))block;
#pragma mark - SQL拼接部分
- (NSMutableString*)SQLSelect:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLWhere:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLFrom:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLValues:(void(^)(NSMutableString* makeSQL))block;
/** 括号里的变量 */
- (NSMutableString*)SQLInPair:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLCreate:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLDelete:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLUpdate:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLReplaceInto:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLInsertInto:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLLike:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLIf:(BOOL)b
                    using:(void(^)(NSMutableString* makeSQL))block;
- (NSMutableString*)SQLIf:(BOOL)b
                    using:(void(^)(NSMutableString* makeSQL))usingBlock
                    elseUsing:(void(^)(NSMutableString* makeSQL))elseUsingBlock;
@end