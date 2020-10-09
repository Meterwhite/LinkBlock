//
//  TObjectling_clean.m
//  Objcling
//
//  Created by MeterWhite on 2020/9/16.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling_clean.h"
#import "ObjclingRuntime.h"
#import <objc/runtime.h>
#import "TlingErr.h"

@implementation TObjectling_clean

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    // 集合的清空，字符串的清空
    do {
        Class c = object_getClass(self.target);
        if ([c isSubclassOfClass:NSString.class]) {
            if(ocling_is_mutableobject(self.target)) {
                [self.target setString:@""];
                break;
            }
        } else if([self.target respondsToSelector:@selector(removeAllObjects)]) {
            [self.target removeAllObjects];
            break;
        } else if([self.target respondsToSelector:@selector(removeAllIndexes)]) {
            [self.target removeAllIndexes];
            break;
        } else if([self.target respondsToSelector:@selector(removeAllCachedResponses)]) {
            [self.target removeAllCachedResponses];
            break;
        } else if([self.target respondsToSelector:@selector(removeAllActions)]) {
            [self.target removeAllActions];
            break;
        }
        *err = [[TlingErr allocWith:self.target] initForUserDescription:@"clean cannot be used on immutable objects."];
    } while (0);
    
    return nil;
}

@end
