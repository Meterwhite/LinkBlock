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
/** 不会溢出 */
LBDeclare NSMutableArray*  (^m_arrRemoveAt)(NSUInteger index);
/** 不会溢出 */
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
 *对数组子项为NSRange值的NSValue对象进行排序；
 *isCombine：NSRange(0,2)将与子集NSRange(0,1)合并
 **/
LBDeclare NSMutableArray<NSValue*>* (^m_arrSortRange)(BOOL ascending, BOOL isCombine);

/** 添加或替换对象，如果指定键的值匹配 */
LBDeclare NSMutableArray*          (^m_arrAddOrReplaceWhenObjValueMatchedForKey)(id obj , NSString* key);
LBDeclare NSMutableArray*          (^m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt)(id obj , NSString* key, NSUInteger idx);
/** 尝试替换一项，如果指定键的值匹配 */
LBDeclare NSMutableArray*          (^m_arrReplaceWhenObjValueMatchedForKey)(id obj,NSString* key);
LBDeclare NSMutableArray*          (^m_arrReplaceWhenObjsValueMatchedForKey)(NSArray* objs,NSString* key);

/** m_arrReplaceDictionaryKey()的深度遍历 */
LBDeclare NSMutableArray*          (^m_arrReplaceKeyForDictionaryItemDepth)(id key,id newKey);
/** 替换数组中字典的key */
LBDeclare NSMutableArray*          (^m_arrReplaceKeyForDictionaryItem)(id key,id newKey);







@end
