//
//  NSMutableString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SQLNew ([NSMutableString SQLInit])

@interface NSObject(NSMutableStringLinkBlock)
@property (nonatomic,copy) NSMutableString*     (^m_strInsertStrAt)(NSString* str, NSUInteger idx);
@property (nonatomic,copy) NSMutableString*     (^m_strAppenStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr);

#pragma mark - SQL拼接部分
+ (NSMutableString* )SQLInit;
@property (nonatomic,copy) NSMutableString*     (^SQLStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^SQLInt)(NSInteger intVal);
@property (nonatomic,copy) NSMutableString*     (^SQLDouble)(double doubleVal);
@property (nonatomic,copy) NSMutableString*     (^SQLArr)(NSArray* arr);
@property (nonatomic,copy) NSMutableString*     (^SQLDictKeys)(NSDictionary* dict);
@property (nonatomic,copy) NSMutableString*     (^SQLDictValues)(NSDictionary* dict);

@property (nonatomic,copy) NSMutableString*     (^SQLStrInStr)(NSString* str);
@property (nonatomic,copy) NSMutableString*     (^SQLIntInStr)(NSInteger intVal);
@property (nonatomic,copy) NSMutableString*     (^SQLDoubleInStr)(double doubleVal);
@property (nonatomic,copy) NSMutableString*     (^SQLArrInStr)(NSArray* arr);
@property (nonatomic,copy) NSMutableString*     (^SQLDictKeysInStr)(NSDictionary* dict);
@property (nonatomic,copy) NSMutableString*     (^SQLDictValuesInStr)(NSDictionary* dict);

//@property (nonatomic,copy) NSMutableString*     (^SQLSelect)();
//@property (nonatomic,copy) NSMutableString*     (^SQLFrom)();
//@property (nonatomic,copy) NSMutableString*     (^SQLWhere)();
@end


@interface NSMutableArray (NSMutableStringLinkBlock)
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

- (NSMutableString*)SQLIf:(BOOL(^)())ifBlock
                    using:(NSString*(^)(NSMutableString* _self))block;

- (NSMutableString*)SQLIfNot:(BOOL(^)())ifNotblock
                       using:(NSString*(^)(NSMutableString* _self))block;
@end