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

#ifndef NSMutable2DArrayNew
#define NSMutable2DArrayNew(x,y) (LB_2DArray_New(x,y))
#endif

@interface NSObject(NSMutable2DArrayLinkBlock)

@property LB_FN id thisValueFor2DArray;

/**
 ...m2DArraryCountAs().anUnsignedIntegerNumber...
 */
@property LB_BK NSNumber*       (^m2DArraryCountAs)(void);
@property LB_BK NSNumber*       (^m2DArraryRowCountAs)(void);
@property LB_BK NSNumber*       (^m2DArraryColCountAs)(void);
/**
 ...m2DArraryCountAs().aBOOLValue...
 */
@property LB_BK NSNumber*       (^m2DArraryContainsObjectAs)(id obj);

@property LB_BK NSObject*       (^m2DArraryObjectAt)(NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray* (^m2DArrarySetObjectAt)(id obj,NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray* (^m2DArraryCleanObject)(id obj);
@property LB_BK NSMutableArray* (^m2DArraryCleanObjectAt)(NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray* (^m2DArraryCleanAllObjects)(void);


/**
 return NSValue-CGPoint
 */
@property LB_BK NSValue*     (^m2DArraryIndexOfObject)(id obj);
/**
 return NSArray<NSValue-CGPoint>*
 */
@property LB_BK NSArray<NSValue*>*(^m2DArraryIndexesOfObject)(id obj);

@property LB_BK NSArray*    (^m2DArraryObjectsForRow)(NSUInteger row);
@property LB_BK NSArray*    (^m2DArraryObjectsForCol)(NSUInteger col);
@property LB_BK NSObject*    (^m2DArraryCleanObjectsForRow)(NSUInteger row);
@property LB_BK NSObject*    (^m2DArraryCleanObjectsForCol)(NSUInteger col);

@end




NS_INLINE NSMutableArray* LB_2DArray_New(NSUInteger x,NSUInteger y){
    
    NSMutableArray* arrayCol = [NSMutableArray arrayWithCapacity:y];
    id nullObj = NSNull.null;
    NSUInteger col = y;
    while (col--) {
        [arrayCol addObject:nullObj];
    }
    NSMutableArray* array2D = [NSMutableArray arrayWithCapacity:y];
    NSUInteger row = x;
    while (row--) {
        [array2D addObject:[arrayCol mutableCopy]];
    }
    return array2D;
}


//@property LB_BK NSObject*    (^m2DArraryObjectAtPointVal)(CGPoint point);
//@property LB_BK NSObject*    (^m2DArrarySetObjectAtPointVal)(_Nonnull id obj,CGPoint point);
//@property LB_BK NSObject*    (^m2DArraryCleanAtPointVal)(CGPoint point);
