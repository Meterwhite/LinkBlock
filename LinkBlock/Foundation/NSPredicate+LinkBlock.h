//
//  NSPredicate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2018/10/9.
//  Copyright © 2018 QuXingYi. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef PredicateWitchIsFalse
#define PredicateWitchIsFalse(witch)\
([NSPredicate predicateWithFormat:@"%K==0",witch])
#endif

#ifndef PredicateWitchIsTrue
#define PredicateWitchIsTrue(witch)\
([NSPredicate predicateWithFormat:@"%K==1",witch])
#endif

#ifndef PredicateWitchIsNil
#define PredicateWitchIsNil(witch)\
([NSPredicate predicateWithFormat:@"%K==nil",witch])
#endif

#ifndef PredicateWitchNotNil
#define PredicateWitchNotNil(witch)\
([NSPredicate predicateWithFormat:@"%K!=nil",witch])
#endif

#ifndef PredicateWitchIsEqual
#define PredicateWitchIsEqual(witch,value)\
([NSPredicate predicateWithFormat:@"%K=%@",witch,value])
#endif

#ifndef PredicateWitchNotEqual
#define PredicateWitchNotEqual(witch,value)\
([NSPredicate predicateWithFormat:@"%K!=%@",witch,value])
#endif

#ifndef PredicateWitchIsIn
#define PredicateWitchIsIn(witch,value)\
([NSPredicate predicateWithFormat:@"%K IN (%@)",witch,value])
#endif

#ifndef PredicateWitchNotIn
#define PredicateWitchNotIn(witch,value)\
([NSPredicate predicateWithFormat:@"NOT %K IN (%@)",witch,value])
#endif

#ifndef PredicateWitchBeginsWith
#define PredicateWitchBeginsWith(witch,value)\
([NSPredicate predicateWithFormat:@"%K BEGINSWITH[cd] %@",witch,value])
#endif

#ifndef PredicateWitchBeginsWith
#define PredicateWitchBeginsWith(witch,value)\
([NSPredicate predicateWithFormat:@"%K BEGINSWITH[cd] %@",witch,value])
#endif

#ifndef PredicateWitchNotBeginsWith
#define PredicateWitchNotBeginsWith(witch,value)\
([NSPredicate predicateWithFormat:@"NOT %K BEGINSWITH[cd] %@",witch,value])
#endif

#ifndef PredicateWitchEndsWith
#define PredicateWitchEndsWith(witch,value)\
([NSPredicate predicateWithFormat:@"%K ENDSWITH[cd] %@",witch,value])
#endif

#ifndef PredicateWitchNotEndsWith
#define PredicateWitchNotEndsWith(witch,value)\
([NSPredicate predicateWithFormat:@"NOT %K ENDSWITH[cd] %@",witch,value])
#endif

#ifndef PredicateWitchContains
#define PredicateWitchContains(witch,value)\
([NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@",witch,value])
#endif

#ifndef PredicateWitchNotContains
#define PredicateWitchNotContains(witch,value)\
([NSPredicate predicateWithFormat:@"NOT %K CONTAINS[cd] %@",witch,value])
#endif

#ifndef PredicateWitchLike
#define PredicateWitchLike(witch,value)\
([NSPredicate predicateWithFormat:@"%K LIKE[cd] %@",witch,value])
#endif

#ifndef PredicateWitchGreaterThan
#define PredicateWitchGreaterThan(witch,value)\
([NSPredicate predicateWithFormat:@"%K>%@",witch,value])
#endif

#ifndef PredicateWitchGreaterThanOrEqual
#define PredicateWitchGreaterThanOrEqual(witch,value)\
([NSPredicate predicateWithFormat:@"%K>=%@",witch,value])
#endif

#ifndef PredicateWitchLessThan
#define PredicateWitchLessThan(witch,value)\
([NSPredicate predicateWithFormat:@"%K<%@",witch,value])
#endif

#ifndef PredicateWitchLessThanOrEqual
#define PredicateWitchLessThanOrEqual(witch,value)\
([NSPredicate predicateWithFormat:@"%K<=%@",witch,value])
#endif

#ifndef PredicateWitchBetween
#define PredicateWitchBetween(witch,left,right)\
([NSPredicate predicateWithFormat:@"(%K >= %@) AND (%K < %@)",witch,left,right])
#endif

@interface NSObject(NSPredicateLinkBlock)

#pragma mark - Foundation Mirror/镜像

/**
 *  predicateA.andPredicate(predicateB);
 */
@property LB_BK NSCompoundPredicate* (^andPredicate)(NSPredicate* predicate);
@property LB_BK NSCompoundPredicate* (^notPredicate)(NSPredicate* predicate);
@property LB_BK NSCompoundPredicate* (^orPredicate)(NSPredicate* predicate);
#pragma mark - Foundation Speed/速度

#pragma mark - Foundation Extend/补充

#pragma mark - Weak coding/弱类型编码

#pragma mark - LinkBlock

@end
