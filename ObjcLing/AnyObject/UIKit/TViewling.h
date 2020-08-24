//
//  TViewling.h
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/25.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "NSObjectling.h"

@class TViewling;

NS_ASSUME_NONNULL_BEGIN

@protocol TViewLazyling <NSObject>

/// 仅仅.m实现
@property (readonly) TViewling *hide;
@property (readonly) TViewling *noHide;
@property (readonly) TViewling *theHidden;

@end

@interface TViewling : NSObjectling

@property (readonly) TViewling *(^text)(NSString *txt);

- (TViewling<TViewLazyling>*)lazy;

@end

NS_ASSUME_NONNULL_END
