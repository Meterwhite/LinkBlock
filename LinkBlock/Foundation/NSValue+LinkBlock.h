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
LBDeclare NSUInteger       (^valueNSRangeLocation)(void);
/** <^()> */
LBDeclare NSUInteger       (^valueNSRangeLength)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGPointX)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGPointY)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGSizeWidth)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGSizeHeight)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGRectX)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGRectY)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGRectWidth)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGRectHeight)(void);
/** <^()> */
LBDeclare CGSize           (^valueCGRectSize)(void);
/** <^()> */
LBDeclare CGPoint          (^valueCGRectOrigin)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGVectorX)(void);
/** <^()> */
LBDeclare CGFloat          (^valueCGVectorY)(void);
/** <^(NSArray* views)> */
LBDeclare NSValue*         (^valueCGSizeSetToViews)(NSArray* views);
/** <^(NSArray* views)> */
LBDeclare NSValue*         (^valueCGPointSetToViews)(NSArray* views);

@end
