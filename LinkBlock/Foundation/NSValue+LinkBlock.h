//
//  NSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef NSValueNew
#define NSValueNew(...) ((NSValue*)(LBBoxValue((__VA_ARGS__))))
#endif


@interface NSObject(NSValueLinkBlock)
#pragma mark - Foundation Speed/速度
LBDeclare CGFloat          (^valueCGRectX)(void);
LBDeclare CGFloat          (^valueCGRectY)(void);
LBDeclare CGPoint          (^valueCGRectOrigin)(void);
LBDeclare CGSize           (^valueCGRectSize)(void);
LBDeclare CGFloat          (^valueCGRectMinX)(void);
LBDeclare CGFloat          (^valueCGRectMidX)(void);
LBDeclare CGFloat          (^valueCGRectMaxX)(void);
LBDeclare CGFloat          (^valueCGRectMinY)(void);
LBDeclare CGFloat          (^valueCGRectMidY)(void);
LBDeclare CGFloat          (^valueCGRectMaxY)(void);
LBDeclare CGFloat          (^valueCGRectWidth)(void);
LBDeclare CGFloat          (^valueCGRectHeight)(void);
LBDeclare NSNumber*        (^valueCGRectContainsRect)(CGRect rect);
LBDeclare NSNumber*        (^valueCGRectContainsPoint)(CGPoint rect);
LBDeclare CGFloat          (^valueCGSizeWidth)(void);
LBDeclare CGFloat          (^valueCGSizeHeight)(void);
LBDeclare CGFloat          (^valueCGPointX)(void);
LBDeclare CGFloat          (^valueCGPointY)(void);
LBDeclare CGFloat          (^valueCGVectorX)(void);
LBDeclare CGFloat          (^valueCGVectorY)(void);
LBDeclare NSUInteger       (^valueNSRangeLength)(void);
LBDeclare NSUInteger       (^valueNSRangeLocation)(void);

#pragma mark - Foundation Extend/多择
/** <^()> 数字或结构体是否是初始值 */
LBDeclare BOOL             (^valueIsBlank)(void);
/** <^()> NSNumber,c number */
LBDeclare NSNumber *       (^valueIsNumber)(void);
/** <^()> struc and Class */
LBDeclare NSNumber *       (^valueIsStruct)(void);











@end
