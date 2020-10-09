//
//  TObjectling_kvcClean.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/30.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling_kvcClean.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TlingErr.h"

@interface TObjectling_kvcClean ()

@property (nonnull,nonatomic,strong) NSMutableArray *args;

@end

@implementation TObjectling_kvcClean

- (NSMutableArray *)args {
    if(!_args) {
        _args = [NSMutableArray array];
    }
    return _args;
}

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    // 集合的清空，字符串的清空，数字的归零，对象的置为nil
    id v = [self.target valueForKeyPath:self.at0];
    ObjclingTypeEnc *enc = [ObjclingTypeEnc.alloc initWithEnc:ocling_encForKey(self.target, self.at0)];
    if(!v) return nil;
    Class c = enc.class;
    if(enc.isObject) {
        if ([c isSubclassOfClass:NSString.class]) {
            if(ocling_is_mutableobject(v)) {
                [(NSMutableString *)v setString:@""];
            }
        } else if([v respondsToSelector:@selector(removeAllObjects)]) {
            [v removeAllObjects];
        } else if([v respondsToSelector:@selector(removeAllIndexes)]) {
            [v removeAllIndexes];
        } else if([v respondsToSelector:@selector(removeAllCachedResponses)]) {
            [v removeAllCachedResponses];
        } else if([v respondsToSelector:@selector(removeAllActions)]) {
            [v removeAllActions];
        } else if([c isSubclassOfClass:NSNumber.class]) {/// 数字
            [self.target setValue:@0 forKeyPath:self.at0];
        }
        [self.target setValue:nil forKeyPath:self.at0];
    } else if(enc.isCNumber) {
        /// 数字
        [self.target setValue:@0 forKeyPath:self.at0];
    }
    return nil;
}

- (NSUInteger)count {
    return 1;
}

- (NSMutableArray *)arrayForValist {
    return self.args;
}
@end
