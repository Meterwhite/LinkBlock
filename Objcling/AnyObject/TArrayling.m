//
//  TArrayling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/21.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TArrayling.h"

@interface TArrayling ()

@property (readonly) TArrayling *reversed;

@property (readonly) TArrayling *(^addUnique)(id obj);

@end

@implementation TArrayling

- (id)let {
    return self;
}

@end

