//
//  NSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NSValueNew
#define NSValueNew(...) ((NSValue*)(LBBoxValue((__VA_ARGS__))))
#endif
@interface NSObject(NSValueLinkBlock)
/** <^()> */
@property (nonatomic,copy,readonly) NSUInteger       (^valueNSRangeLocation)();
/** <^()> */
@property (nonatomic,copy,readonly) NSUInteger       (^valueNSRangeLength)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGPointX)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGPointY)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGSizeWidth)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGSizeHeight)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGRectX)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGRectY)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGRectWidth)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGRectHeight)();
/** <^()> */
@property (nonatomic,copy,readonly) CGSize           (^valueCGRectSize)();
/** <^()> */
@property (nonatomic,copy,readonly) CGPoint          (^valueCGRectOrigin)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGVectorX)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^valueCGVectorY)();
/** <^(NSArray* views)> */
@property (nonatomic,copy,readonly) NSValue*         (^valueCGSizeSetToViews)(NSArray* views);
/** <^(NSArray* views)> */
@property (nonatomic,copy,readonly) NSValue*         (^valueCGPointSetToViews)(NSArray* views);

@end
