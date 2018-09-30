//
//  NSDictionary+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSDictionaryLinkBlock)

#pragma mark - Foundation Mirror/镜像
/** nil->NSNull.if need nil please to use foundation API */
LBDeclare NSObject*    (^dictObjectForKey)(id key);

#pragma mark - Foundation Speed/速度
LBDeclare BOOL         (^dictContainsKey)(id key);
LBDeclare NSNumber*    (^dictContainsKeyAs)(id key);
LBDeclare BOOL         (^dictContainsValue)(id value);
LBDeclare NSNumber*    (^dictContainsValueAs)(id value);
LBDeclare NSArray*     (^dictKeysForValue)(id value);
/// get object 'for+key'
LBDeclare NSObject*    (^dictForid)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaType)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerOriginalImage)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerEditedImage)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerCropRect)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaURL)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerReferenceURL)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerMediaMetadata)(void);
LBDeclare UIImage*     (^dictForUIImagePickerControllerLivePhoto)(void);

#pragma mark - Weak coding/弱类型编码
LBDeclare NSMutableDictionary* (^dictSetWithKeyObject)(id key , id value);
LBDeclare NSMutableDictionary* (^dictAddEntries)(NSDictionary* dict);

#pragma mark - LinkBlock

LBDeclare NSMutableDictionary* (^dictReplaceForKeyDepth)(id key, id newKey);
LBDeclare NSMutableDictionary* (^dictReplaceForKey)(id key, id newKey);


@end
