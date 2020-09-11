//
//  TTextViewling.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TTextViewling.h"

@interface TTextViewling ()

@property (readonly) TTextViewling *editEnable;

@property (readonly) TTextViewling *editDisable;

@property (readonly) TTextViewling *selectEnable;

@property (readonly) TTextViewling *selectDisable;

@property (readonly) TTextViewling *alignmentCenter;

@property (readonly) TTextViewling *alignmentRight;

@property (readonly) TTextViewling *alignmentLeft;

@end

@implementation TTextViewling

- (id)let {
    return self;
}

@end
