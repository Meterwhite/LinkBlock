//
//  NSDictionary+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSDictionaryLinkBlock)
/** <^(id<NSCopying> key)>该返回值允许包括NSNull类型对象 */
@property (nonatomic,copy,readonly) NSObject*    (^dictGet)(id<NSCopying> key);
/** <^(id<NSCopying> key)>该返回值不包括NSNull类型对象，如果有则为nil */
@property (nonatomic,copy,readonly) NSObject*    (^dictGetNoNSNull)(id<NSCopying> key);
/** <^(id<NSCopying> key)>取出布尔值 */
@property (nonatomic,copy,readonly) BOOL         (^dictGetBOOL)(id<NSCopying> key);
/** <^(id<NSCopying> key)>是否包含key */
@property (nonatomic,copy,readonly) BOOL         (^dictContainerKey)(id<NSCopying> key);
/** <^(id value)>是否包含value */
@property (nonatomic,copy,readonly) BOOL         (^dictContainerValue)(id value);
/** <^()> */
@property (nonatomic,copy,readonly) NSArray*     (^dictAllKeys)();
/** <^()> */
@property (nonatomic,copy,readonly) NSArray*     (^dictAllValues)();
/** <^(id value)>根据值返取所有键的集合 */
@property (nonatomic,copy,readonly) NSArray*     (^dictKeysForValue)(id value);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，层次遍历字典和数组 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，非遍历的 */
@property (nonatomic,copy,readonly) NSMutableDictionary* (^dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^()>对字典中的值随机赋值，仅含字符串和数字类型 */
@property (nonatomic,copy,readonly) NSDictionary*        (^dictObjsValueRandom)();
@end
