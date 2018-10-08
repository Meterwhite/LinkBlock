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
@property LB_BK NSMutableArray*  (^m_arrAddObj)(id obj);
@property LB_BK NSMutableArray*  (^m_arrAddObjs)(NSArray* array);
@property LB_BK NSMutableArray*  (^m_arrInsertObjAt)(id obj, NSUInteger index);
@property LB_BK NSMutableArray*  (^m_arrInsertArrayAt)(NSArray* array, NSUInteger index);
@property LB_BK NSMutableArray*  (^m_arrRemoveObj)(id obj);
/** not overflow */
@property LB_BK NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** not overflow */
@property LB_BK NSMutableArray*  (^m_arrRemoveObjsFromTo)(NSUInteger fromIndex,NSUInteger toIndex);
@property LB_BK NSMutableArray*  (^m_arrRemoveAll)(void);

#pragma mark - Foundation Speed/速度
@property LB_BK NSMutableArray*  (^m_arrAddObjOnlyOne)(id obj);
@property LB_BK NSMutableArray*  (^m_arrInsertObjBeforeTo)(id insert, id nextTo);
@property LB_BK NSMutableArray*  (^m_arrInsertObjNextTo)(id insert, id nextTo);
@property LB_BK NSMutableArray*  (^m_arrSort)(BOOL ascending);
@property LB_BK NSMutableArray*  (^m_arrSortByKey)(NSString* key, BOOL ascending);
@property LB_BK NSMutableArray*  (^m_arrFilter)(NSString* predicateFormat,...);
@property LB_BK NSMutableArray*  (^m_arrReversed)(void);
@property LB_BK NSMutableArray*  (^m_arrReplaceObjWith)(id obj,id withObj);


#pragma mark - LinkBlock
/**
 Sort NSValue-NSRange.If isCombine=YES NSRange(0,2) will contain NSRange(0,1).
 */
@property LB_BK NSMutableArray<NSValue*>* (^m_arrSortRange)(BOOL ascending, BOOL isCombine);

/** add or replace an object if key-value matched */
@property LB_BK NSMutableArray*          (^m_arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
@property LB_BK NSMutableArray*          (^m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** replace an object if key-value matched */
@property LB_BK NSMutableArray*          (^m_arrReplaceWhenObjValueMatchedForKey)(id obj,NSString* key);
@property LB_BK NSMutableArray*          (^m_arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs,NSString* key);

/** arrReplaceKeyForDictionaryItem().Deep traversal */
@property LB_BK NSMutableArray*          (^m_arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
@property LB_BK NSMutableArray*          (^m_arrReplaceKeyForDictionaryItem)(id key,id newKey);


@end
