//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSObject(NSMutableStringLinkBlock)
@property (nonatomic,copy) NSMutableString*     (^m_strInsertStrAt)(NSString* str, NSUInteger idx);
@property (nonatomic,copy) NSMutableString*     (^m_strAppenStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr);


#pragma mark - SQL拼接部分

#define SQLNew ([NSMutableString SQLInit])

+ (NSMutableString* )SQLInit;
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

//@property (nonatomic,copy) NSMutableString*     (^SQLValueEqualStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueEqualStrInStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueEqualInt)(NSString* key, NSInteger num);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueEqualDouble)(NSString* key, double num);
//
//@property (nonatomic,copy) NSMutableString*     (^SQLValueNotEqualStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueNotEqualStrInStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueNotEqualInt)(NSString* key, NSInteger num);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueNotEqualDouble)(NSString* key, double num);
//
//@property (nonatomic,copy) NSMutableString*     (^SQLValueMoreThanStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueMoreThanStrInStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueMoreThanInt)(NSString* key, NSInteger num);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueMoreThanDouble)(NSString* key, double num);
//
//@property (nonatomic,copy) NSMutableString*     (^SQLValueLessThanStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueLessThanStrInStr)(NSString* key, NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueLessThanInt)(NSString* key, NSInteger num);
//@property (nonatomic,copy) NSMutableString*     (^SQLValueLessThanDouble)(NSString* key, double num);
@end


@interface NSMutableString (NSMutableStringLinkBlock)
/** 方便阅读 */
- (NSMutableString*)SQLUsing:(void(^)(NSMutableString* _self))block;
#pragma mark - SQL拼接部分
- (NSMutableString*)SQLSelect:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLWhere:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLFrom:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLValues:(NSString*(^)(NSMutableString* _self))block;
/** 括号里的变量 */
- (NSMutableString*)SQLInPair:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLCreate:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLDelete:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLUpdate:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLReplaceInto:(NSString*(^)(NSMutableString* _self))block;
- (NSMutableString*)SQLInsertInto:(NSString*(^)(NSMutableString* _self))block;

- (NSMutableString*)SQLLike:(NSString*(^)(NSMutableString* _self))block;

- (NSMutableString*)SQLIf:(BOOL(^)())ifBlock
                    using:(NSString*(^)(NSMutableString* _self))block;

- (NSMutableString*)SQLIf:(BOOL(^)())ifBlock
                    using:(NSString*(^)(NSMutableString* _self))usingBlock
                    elseUsing:(NSString*(^)(NSMutableString* _self))elseUsingBlock;
@end