//
//  ALingAction.h
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TLingErr;
NS_ASSUME_NONNULL_BEGIN

/// Parametric Type Link.
/// at0..atN
@protocol TLingParametric <NSObject>
- (const char *)encodeForIndex:(NSUInteger)idx;
@end


/// Broken Type Link
@protocol TLingBroken <NSObject>

@end

/// Abstract Action Link
@interface ALingAction: NSObject

@property id tag;

@property NSUInteger step;

- (NSUInteger)count;

- (nullable SEL)forwardSEL;

/// return: return new target while not nil;
- (nullable id)sendMsg:(TLingErr *_Nullable*_Nullable)err;

@end

NS_ASSUME_NONNULL_END
