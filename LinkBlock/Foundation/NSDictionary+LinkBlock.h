//
//  NSDictionary+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSDictionaryLinkBlock)
/** <^(id<NSCopying> key)>该返回值允许包括NSNull类型对象 */
LBDeclare NSObject*    (^dictGet)(id<NSCopying> key);
/** <^(id<NSCopying> key)>该返回值不包括NSNull类型对象，如果有则为nil */
LBDeclare id           (^dictGetNoNSNull)(id<NSCopying> key);
/** <^(id<NSCopying> key)>取出布尔值 */
LBDeclare BOOL         (^dictGetBOOL)(id<NSCopying> key);
LBDeclare NSNumber*    (^dictGetBOOL_n)(id<NSCopying> key);
/** <^(id<NSCopying> key)>是否包含key */
LBDeclare BOOL         (^dictContaineKey)(id<NSCopying> key);
LBDeclare NSNumber*    (^dictContaineKey_n)(id<NSCopying> key);
/** <^(id value)>是否包含value */
LBDeclare BOOL         (^dictContaineValue)(id value);
LBDeclare NSNumber*    (^dictContaineValue_n)(id value);
/** <^()> */
LBDeclare NSArray*     (^dictAllKeys)();
/** <^()> */
LBDeclare NSArray*     (^dictAllValues)();
/** <^(id value)>根据值返取所有键的集合 */
LBDeclare NSArray*     (^dictKeysForValue)(id value);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，层次遍历字典和数组 */
LBDeclare NSMutableDictionary* (^dictReplaceKey)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，非层次遍历的 */
LBDeclare NSMutableDictionary* (^dictReplaceKeyWithoutDeep)(id<NSCopying> replaceKey, id<NSCopying> withKey);
/** <^()>对字典中的对象随机赋值，仅含字符串和数字类型 */
LBDeclare NSDictionary*        (^dictObjsValueRandom)();

#pragma mark - 获取dictForXXX中XXX的为键的字典值
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaType)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerOriginalImage)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerEditedImage)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerCropRect)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaURL)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerReferenceURL)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaMetadata)();
LBDeclare UIImage*     (^dictForUIImagePickerControllerLivePhoto)();

#pragma mark - NSMutableDictionary
/** <^(id<NSCopying> key , id value)>赋值 */
LBDeclare NSMutableDictionary* (^dictSetValue)(id<NSCopying> key , id value);
/* <^(id<NSCopying> replaceKey, id<NSCopying> withKey)>替换字典中的key，层次遍历字典和数组 */
/** <^(NSDictionary* dict)>并集，由传入参数覆盖原来数据 */
LBDeclare NSMutableDictionary* (^dictUnionDict)(NSDictionary* dict);
@end
