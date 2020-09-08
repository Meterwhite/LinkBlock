//
//  TPredicateling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TArrayling;

NS_ASSUME_NONNULL_BEGIN

@protocol TPredicateLetling <NSObject>

@property (readonly) TArrayling *(^select)(id objs);

@end

@interface TPredicateling : Tling

@property (readonly) TPredicateling *(^and)(NSPredicate *p);

@property (readonly) TPredicateling *(^not)(NSPredicate *p);

@property (readonly) TPredicateling *(^or)(NSPredicate *p);

@end

@interface TPredicateling (Generic)

@end


NS_ASSUME_NONNULL_END
