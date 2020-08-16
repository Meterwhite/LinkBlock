//
//  TLingErr.m
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TLingErr.h"

@implementation TLingErr

+ (instancetype)errFrom:(id)sender at:(NSUInteger)step {
    TLingErr *err = [self alloc];
    err.sender = sender;
    err.step = step;
    err.info = [NSMutableDictionary dictionary];
    err.info[@"sender"] = sender;
    err.info[@"step"]   = @(step);
    return err;
}

- (instancetype)initForKind:(Class)clz sel:(SEL)sel {
    NSString *need = NSStringFromClass(clz);
    NSString *but  = NSStringFromClass([self.sender class]);
    NSString *s    = NSStringFromSelector(sel);
    NSString *reason = [NSString stringWithFormat:@"LinkAnyObject Error: %@(%@) cannot respond to the selector %@. It is not %@.",self.sender, but, s, need];
    return [self initWithName:NSObjectInaccessibleException reason:reason userInfo:self.info];
}

- (instancetype)initForMissingAct:(SEL)sel {
    NSString *s    = NSStringFromSelector(sel);
    NSString *reason = [NSString stringWithFormat:@"LinkAnyObject Error: Could not find Action object for selector %@.", s];
    return [self initWithName:NSObjectInaccessibleException reason:reason userInfo:self.info];
}

- (instancetype)initForUserDescription:(NSString *)udes {
    return [self initWithName:NSObjectInaccessibleException reason:udes userInfo:self.info];
}
@end
