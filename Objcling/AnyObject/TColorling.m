//
//  TColorling.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TColorling.h"

@interface TColorling ()

@property (readonly) TColorling *lighter;

@property (readonly) TColorling *darker;

@property (readonly) TColorling *(^bgcolorInto)(id control);

@property (readonly) TColorling *(^textColorInto)(id control);

@end

@implementation TColorling

- (id)let {
    return self;
}

@end
