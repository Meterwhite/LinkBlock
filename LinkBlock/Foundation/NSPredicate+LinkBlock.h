//
//  NSPredicate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2018/10/9.
//  Copyright © 2018 QuXingYi. All rights reserved.
//

#import "LinkBlockDefine.h"

/**
 - (id)where:(NSString *)key isFalse:(BOOL)value;
 - (id)where:(NSString *)key isTrue:(BOOL)value;
 
 - (id)where:(NSString *)key isNull:(BOOL)value;
 - (id)where:(NSString *)key isNotNull:(BOOL)value;
 
 - (id)where:(NSString *)key equals:(id)value;
 - (id)where:(NSString *)key doesntEqual:(id)value;
 
 - (id)where:(NSString *)key isIn:(NSArray *)values;
 - (id)where:(NSString *)key isNotIn:(NSArray *)values;
 
 - (id)where:(NSString *)key startsWith:(NSString *)value;
 - (id)where:(NSString *)key doesntStartWith:(NSString *)value;
 - (id)where:(NSString *)key endsWith:(NSString *)value;
 - (id)where:(NSString *)key doesntEndWith:(NSString *)value;
 
 - (id)where:(NSString *)key contains:(NSString *)value;
 - (id)where:(NSString *)key like:(NSString *)value;
 
 - (id)where:(NSString *)key greaterThan:(id)value;
 - (id)where:(NSString *)key greaterThanOrEqualTo:(id)value;
 - (id)where:(NSString *)key lessThan:(id)value;
 - (id)where:(NSString *)key lessThanOrEqualTo:(id)value;
 - (id)where:(NSString *)key between:(id)first andThis:(id)second;
 */

#ifndef LBPredicateIsFalse
#define LBPredicateIsFalse(key,v)
#endif


//#define NSPredicateIsFalse

//NSCompoundPredicate
@interface NSObject(NSPredicateLinkBlock)

@end


