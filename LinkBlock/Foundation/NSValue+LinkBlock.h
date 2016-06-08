//
//  NSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSValueLinkBlock)
@property (nonatomic,copy) NSUInteger       (^valueNSRangeLocation)();
@property (nonatomic,copy) NSUInteger       (^valueNSRangeLength)();
@property (nonatomic,copy) CGFloat          (^valueCGPointX)();
@property (nonatomic,copy) CGFloat          (^valueCGPointY)();
@property (nonatomic,copy) CGFloat          (^valueCGSizeWidth)();
@property (nonatomic,copy) CGFloat          (^valueCGSizeHeight)();
@property (nonatomic,copy) CGFloat          (^valueCGRectX)();
@property (nonatomic,copy) CGFloat          (^valueCGRectY)();
@property (nonatomic,copy) CGFloat          (^valueCGRectWidth)();
@property (nonatomic,copy) CGFloat          (^valueCGRectHeight)();
@property (nonatomic,copy) CGSize           (^valueCGRectSize)();
@property (nonatomic,copy) CGPoint          (^valueCGRectOrigin)();
@property (nonatomic,copy) CGFloat          (^valueCGVectorX)();
@property (nonatomic,copy) CGFloat          (^valueCGVectorY)();

@property (nonatomic,copy) NSValue*         (^valueSetSizeToViews)(NSArray* views);
@property (nonatomic,copy) NSValue*         (^valueSetPointToViews)(NSArray* views);
@end