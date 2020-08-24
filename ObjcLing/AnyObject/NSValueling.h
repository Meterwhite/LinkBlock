//
//  NSValueling.h
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TLing.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSValueling : TLing

#pragma mark - CGRect
@property (readonly) NSValueling *x;
@property (readonly) NSValueling *y;
@property (readonly) NSValueling *width;
@property (readonly) NSValueling *height;
@property (readonly) NSValueling *size;
@property (readonly) NSValueling *origin;

#pragma mark - NSRange
@property (readonly) NSValueling *location;
@property (readonly) NSValueling *lenth;

#pragma mark - UIEdgeInsets
@property (readonly) NSValueling *top;
@property (readonly) NSValueling *left;
@property (readonly) NSValueling *bottom;
@property (readonly) NSValueling *right;



@end

NS_ASSUME_NONNULL_END
