//
//  TPredicateling.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TPredicateling.h"

@interface TPredicateling ()
@property (readonly) TArrayling *(^select)(id objects);
@end

@implementation TPredicateling

- (id)let {
    return self;
}

@end
