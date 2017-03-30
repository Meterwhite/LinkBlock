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
/** <^()> */
LBDeclare NSUInteger       (^valueNSRangeLocation)();
/** <^()> */
LBDeclare NSUInteger       (^valueNSRangeLength)();
/** <^()> */
LBDeclare CGFloat          (^valueCGPointX)();
/** <^()> */
LBDeclare CGFloat          (^valueCGPointY)();
/** <^()> */
LBDeclare CGFloat          (^valueCGSizeWidth)();
/** <^()> */
LBDeclare CGFloat          (^valueCGSizeHeight)();
/** <^()> */
LBDeclare CGFloat          (^valueCGRectX)();
/** <^()> */
LBDeclare CGFloat          (^valueCGRectY)();
/** <^()> */
LBDeclare CGFloat          (^valueCGRectWidth)();
/** <^()> */
LBDeclare CGFloat          (^valueCGRectHeight)();
/** <^()> */
LBDeclare CGSize           (^valueCGRectSize)();
/** <^()> */
LBDeclare CGPoint          (^valueCGRectOrigin)();
/** <^()> */
LBDeclare CGFloat          (^valueCGVectorX)();
/** <^()> */
LBDeclare CGFloat          (^valueCGVectorY)();
/** <^(NSArray* views)> */
LBDeclare NSValue*         (^valueCGSizeSetToViews)(NSArray* views);
/** <^(NSArray* views)> */
LBDeclare NSValue*         (^valueCGPointSetToViews)(NSArray* views);

@end
