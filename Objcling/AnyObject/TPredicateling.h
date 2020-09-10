//
//  TPredicateling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TArrayling;

NS_ASSUME_NONNULL_BEGIN

@protocol TPredicateLetling <NSObject>

@property (readonly) TArrayling *(^select)(id objs);

@end

@interface TPredicateling : TObjectling

@property (readonly) TPredicateling *(^and)(NSPredicate *p);

@property (readonly) TPredicateling *(^not)(NSPredicate *p);

@property (readonly) TPredicateling *(^or)(NSPredicate *p);

@end

@interface TPredicateling (ObjclingGoing)

@end


NS_ASSUME_NONNULL_END
