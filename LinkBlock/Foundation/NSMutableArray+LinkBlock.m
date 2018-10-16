//
//  NSMutableArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSMutable2DArrayLinkBlock)

- (_Nullable id)thisValueFor2DArray
{
    return self==NSNull.null ? nil : self;;
}

- (NSObject *(^)(NSUInteger, NSUInteger))m2DArraryObjectAt
{
    return ^id(NSUInteger x,NSUInteger y){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArraryObjectAt,x,y)
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y || x > info.x-1 || y > info.y-1){
            return NSNull.null;
        }
        return [_self objectAtIndex:x*info.y + y];
    };
}

- (NSMutableArray * (^)(id, NSUInteger, NSUInteger))m2DArrarySetObjectAt
{
    return ^id(id obj ,NSUInteger x,NSUInteger y){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArrarySetObjectAt,obj,x,y)
        
        if(!obj) return _self;
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y ||x > info.x-1 || y > info.y-1){
            return _self;
        }
        [_self setObject:obj atIndexedSubscript:x*info.y + y];
        return _self;
    };
}

- (NSMutableArray * (^)(NSUInteger, NSUInteger))m2DArraryCleanObjectAt
{
    return ^id(NSUInteger x,NSUInteger y){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArraryCleanObjectAt,x,y)
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y ||x > info.x-1 || y > info.y-1){
            return _self;
        }
        [_self setObject:NSNull.null atIndexedSubscript:x*info.y + y];
        return _self;
    };
}

- (NSMutableArray *(^)(void))m2DArraryCleanAllObjects
{
    return ^id(){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArraryCleanAllObjects)
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y){
            return _self;
        }
        id non = NSNull.null;
        for (NSUInteger i=0; i<_self.count; i++) {
            
            if(non != _self[i]){
                _self[i] = non;
            }
        }
        return _self;
    };
}
-(NSMutableArray *(^)(id))m2DArraryCleanObject
{
    return ^id(id obj){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArraryCleanObject,obj)
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y){
            return _self;
        }
        id non = NSNull.null;
        for (NSUInteger i=0; i<_self.count; i++) {
            
            if([obj isEqual:_self[i]]){
                _self[i] = non;
            }
        }
        return _self;
    };
}

- (NSValue *(^)(id))m2DArraryIndexOfObject
{
    return ^id(id obj){
        
        LinkHandle_REF(NSMutableArray)
        LinkGroupHandle_REF(m2DArraryIndexOfObject,obj)
        
        if(!obj) return NSNull.null;
        
        CGPoint info = _self.accessibilityActivationPoint;
        if(!info.x || !info.y){
            return NSNull.null;
        }
        
        NSUInteger idx = [_self indexOfObject:obj];
        NSUInteger row = floor(idx / (NSUInteger)info.x);
        NSUInteger col = (idx % (NSUInteger)info.y);
        return [NSValue valueWithCGPoint:CGPointMake(row , col)];
    };
}


@end
