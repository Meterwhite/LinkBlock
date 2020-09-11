//
//  TLabelling.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TLabelling.h"

@interface TLabelling ()

@property (readonly) TLabelling *noLimitLines;

@property (readonly) TLabelling *alignmentCenter;

@property (readonly) TLabelling *alignmentRight;

@property (readonly) TLabelling *alignmentLeft;

@end

@implementation TLabelling

- (id)let {
    return self;
}

@end
