//
//  ALingController.h
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TLing;

typedef TLing* _Nonnull (^TLing2Block)(void* at0, ...);

TLing *TLingCallPt(__kindof TLing *ling, SEL sel);

TLing2Block TLingCallBlockPt(__kindof TLing *ling, SEL sel);


@interface ALingController<__covariant ObjectType> : NSObject


@end

NS_ASSUME_NONNULL_END
