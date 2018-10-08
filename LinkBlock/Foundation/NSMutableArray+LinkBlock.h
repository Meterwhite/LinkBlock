//
//  NSMutableArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"
#ifndef NSMutableArrayNew
#define NSMutableArrayNew ([NSMutableArray new])
#endif
@interface NSObject(NSMutableArrayLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare NSMutableArray*  (^m_arrAddObj)(id obj);
LBDeclare NSMutableArray*  (^m_arrAddObjs)(NSArray* array);
LBDeclare NSMutableArray*  (^m_arrInsertObjAt)(id obj, NSUInteger index);
LBDeclare NSMutableArray*  (^m_arrInsertArrayAt)(NSArray* array, NSUInteger index);
LBDeclare NSMutableArray*  (^m_arrRemoveObj)(id obj);
/** not overflow */
LBDeclare NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** not overflow */
LBDeclare NSMutableArray*  (^m_arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
LBDeclare NSMutableArray*  (^m_arrRemoveAll)(void);

#pragma mark - Foundation Speed/速度
LBDeclare NSMutableArray*  (^m_arrAddObjOnlyOne)(id obj);
LBDeclare NSMutableArray*  (^m_arrInsertObjBeforeTo)(id insert, id nextTo);
LBDeclare NSMutableArray*  (^m_arrInsertObjNextTo)(id insert, id nextTo);
LBDeclare NSMutableArray*  (^m_arrSort)(BOOL ascending);
LBDeclare NSMutableArray*  (^m_arrSortByKey)(NSString* key, BOOL ascending);
LBDeclare NSMutableArray*  (^m_arrFilter)(NSString* predicateFormat,...);
LBDeclare NSMutableArray*  (^m_arrReversed)(void);
LBDeclare NSMutableArray*  (^m_arrReplaceObjWith)(id obj,id withObj);


#pragma mark - LinkBlock
/**
 Sort NSValue-NSRange.If isCombine=YES NSRange(0,2) will contain NSRange(0,1).
 */
LBDeclare NSMutableArray<NSValue*>* (^m_arrSortRange)(BOOL ascending, BOOL isCombine);

/** add or replace an object if key-value matched */
LBDeclare NSMutableArray*          (^m_arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*          (^m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** replace an object if key-value matched */
LBDeclare NSMutableArray*          (^m_arrReplaceWhenObjValueMatchedForKey)(id obj,NSString* key);
LBDeclare NSMutableArray*          (^m_arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs,NSString* key);

/** arrReplaceKeyForDictionaryItem().Deep traversal */
LBDeclare NSMutableArray*          (^m_arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
LBDeclare NSMutableArray*          (^m_arrReplaceKeyForDictionaryItem)(id key,id newKey);


@end
