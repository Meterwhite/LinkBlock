//
//  NSDictionary+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSDictionaryLinkBlock)
/** 安全取值，没有符合的健的时候返回nil，该返回值允许包括NSNull类型对象 */
/** get value safely. if no value is associated with aKey, return nil. Return value can include NSNull. */
@property (nonatomic,copy) id           (^dictGet)(id<NSCopying> key);
/** 安全取值，没有符合的健或者结果类型为NSNull的时候返回nil */
/** get value safely. if no value is associated with aKey or value type is NSNull, return nil. */
@property (nonatomic,copy) id           (^dictGetNoNSNull)(id<NSCopying> key);
/** 安全取出字典对象，没有符合的健或取出对象不是字典时返回空字典，而不是nil和NSNull*/
/** get value safely. if no value is associated with aKey or value type is NSNull, return new NSDictionary instead of nil and NSNull. */
@property (nonatomic,copy) NSDictionary* (^dictGetDictNoNullType)(id<NSCopying> key);
/** 安全取出数组对象，没有符合的健或取出对象不是数组时返回空数组，而不是nil和NSNull */
/** get value safely. if no value is associated with aKey or value type is NSNull, return new NSArray instead of nil and NSNull instead of nil and NSNull. */
@property (nonatomic,copy) NSArray*     (^dictGetArrNoNullType)(id<NSCopying> key);
/** 安全取出布尔值，没有符合的健时返回NO，而不是nil和NSNull */
/** get value safely. if no value is associated with aKey , return new NO instead of nil and NSNull.. */
@property (nonatomic,copy) BOOL         (^dictGetBOOLNoNullType)(id<NSCopying> key);

@property (nonatomic,copy) BOOL         (^dictContainerKey)(id<NSCopying> key);
@property (nonatomic,copy) BOOL         (^dictContainerValue)(id value);
@property (nonatomic,copy) NSArray*     (^dictAllKeys)();
@property (nonatomic,copy) NSArray*     (^dictAllValues)();
@property (nonatomic,copy) NSArray*     (^dictKeysForValue)(id value);
@end
