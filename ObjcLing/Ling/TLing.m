//
//  TLing.m
//  ObjcLing
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
    step ++;
    if(self.count > 1) return self.targets;
    return self.target;
}

- (void(^)(void))done {
    if(error && safe > ALingSafeStateTrying) {
        @throw error;
    }
    step ++;
    return ^(){};
}

- (instancetype)trying {
    step ++;
    safe = ALingSafeStateTrying;
    return self;
}

- (instancetype)throwing {
    step ++;
    safe = ALingSafeStateThrowing;
    return self;
}

@end
