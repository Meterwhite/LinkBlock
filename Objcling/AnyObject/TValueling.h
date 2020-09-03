//
//  TValueling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

NS_ASSUME_NONNULL_BEGIN

@interface TValueling : Tling

#pragma mark - CGRect
@property (readonly) TValueling *x;
@property (readonly) TValueling *y;
@property (readonly) TValueling *width;
@property (readonly) TValueling *height;
@property (readonly) TValueling *size;
@property (readonly) TValueling *origin;

#pragma mark - NSRange
@property (readonly) TValueling *location;
@property (readonly) TValueling *lenth;

#pragma mark - UIEdgeInsets
@property (readonly) TValueling *top;
@property (readonly) TValueling *left;
@property (readonly) TValueling *bottom;
@property (readonly) TValueling *right;



@end

NS_ASSUME_NONNULL_END
