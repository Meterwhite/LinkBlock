//
//  TLing.m
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLing.h"

@implementation TLing

- (id)get {
    if(error && safe > ALingSafeStateTrying) {
        @throw error;
        return nil;
    }
    if(self.count > 1) return self.targets;
    return self.target;
}

- (void)done {
    if(error && safe > ALingSafeStateTrying) {
        @throw error;
    }
}

- (instancetype)trying {
    safe = ALingSafeStateTrying;
    return self;
}

- (instancetype)throwing {
    safe = ALingSafeStateThrowing;
    return self;
}

@end
