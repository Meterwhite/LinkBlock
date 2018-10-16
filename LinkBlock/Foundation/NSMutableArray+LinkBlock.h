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

@property LB_BK NSObject*    (^m2DArraryObjectAt)(NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray*    (^m2DArrarySetObjectAt)(id obj,NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray*    (^m2DArraryCleanObject)(id obj);
@property LB_BK NSMutableArray*    (^m2DArraryCleanObjectAt)(NSUInteger x,NSUInteger y);
@property LB_BK NSMutableArray*    (^m2DArraryCleanAllObjects)(void);



/**
 return NSValue-CGPoint
 */
@property LB_BK NSValue*     (^m2DArraryIndexOfObject)(id obj);
/**
 return NSArray<NSValue-CGPoint>*
 */
@property LB_BK NSArray<NSValue*>*(^m2DArraryIndexesOfObject)(NSUInteger x,NSUInteger y);

@property LB_BK NSArray*    (^m2DArraryObjectsForRow)(NSUInteger row);
@property LB_BK NSArray*    (^m2DArraryObjectsForCol)(NSUInteger col);
@property LB_BK NSObject*    (^m2DArraryCleanRow)(NSUInteger row);
@property LB_BK NSObject*    (^m2DArraryCleanCol)(NSUInteger row);


@property LB_BK NSMutableArray*    (^m2DArraryMutableCopy)(void);
@end




NS_INLINE NSMutableArray* LB_2DArray_New(NSUInteger x,NSUInteger y){
    
    NSUInteger count = x*y;
    NSMutableArray* array2D = [NSMutableArray arrayWithCapacity:count];
    id nullObj = NSNull.null;
    while (count--) [array2D addObject:nullObj];
    [array2D setAccessibilityActivationPoint:CGPointMake(x, y)];
    return array2D;
}


//@property LB_BK NSObject*    (^m2DArraryObjectAtPointVal)(CGPoint point);
//@property LB_BK NSObject*    (^m2DArrarySetObjectAtPointVal)(_Nonnull id obj,CGPoint point);
//@property LB_BK NSObject*    (^m2DArraryCleanAtPointVal)(CGPoint point);
