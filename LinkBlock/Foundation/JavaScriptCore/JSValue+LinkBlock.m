//
//  JSValue+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/6/21.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(JSValueLinkBlock)
- (JSManagedValue *(^)(id))jsValueToManagedValue
{
    return ^id(id owner){
        LinkHandle_REF(JSManagedValue, JSValue)
        if(owner){
            return [JSManagedValue managedValueWithValue:_self andOwner:owner];
        }else{
            return [JSManagedValue managedValueWithValue:_self];
        }
    };
}
- (void)setJsValueToManagedValue:(JSManagedValue *(^)(id))jsValueToManagedValue{};

- (JSValue *(^)(id))jsValueAddToSelfManagedRef
{
    return ^id(id owner){
        LinkHandle_REF(JSValue, JSValue)
        JSManagedValue* value = [JSManagedValue managedValueWithValue:_self];
        [_self.context.virtualMachine addManagedReference:value withOwner:owner];
        return _self;
    };
}
- (void)setJsValueAddToSelfManagedRef:(JSValue *(^)(id))jsValueAddToSelfManagedRef{};

- (JSValue *(^)(NSArray *))jsValueCallFunc
{
    return ^id(NSArray* args){
        LinkHandle_REF(JSValue, JSValue)
        return [_self callWithArguments:args];
    };
}
- (void)setJsValueCallFunc:(JSValue *(^)(NSArray *))jsValueCallFunc{};

@end
