//
//  NSNumber+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import "NSNumber+LinkBlock.h"


@implementation NSObject(NSNumberLinkBlock)

- (void *(^)())numValue
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return (void*)nil;
        }
        void* re;
        [_self getValue:&re];
        return re;
    };
}
- (void)setNumValue:(void *(^)())numValue{};

static NSArray* _integerCTypeArr;
- (BOOL (^)())numIsInteger
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
        if(![NSStringFromClass(_self.class) isEqualToString:@"__NSCFNumber"])
            return NO;
        if(!_integerCTypeArr){
            _integerCTypeArr = @[@"s", @"i", @"q"];
        }
        if([_integerCTypeArr containsObject:[NSString stringWithFormat:@"%s",_self.objCType]])
            return YES;
        return NO;
    };
}
- (void)setNumIsInteger:(BOOL (^)())numIsInteger{};

static NSArray* _floatingCTypeArr;
- (BOOL (^)())numIsFloating
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
        if(![NSStringFromClass(_self.class) isEqualToString:@"__NSCFNumber"])
            return NO;
        if(!_floatingCTypeArr){
            _floatingCTypeArr = @[@"f", @"d"];
        }
        if([_floatingCTypeArr containsObject:[NSString stringWithFormat:@"%s",_self.objCType]])
            return YES;
        return NO;
    };
}
- (void)setNumIsFloating:(BOOL (^)())numIsFloating{};

static NSArray* _charCTypeArr;
- (BOOL (^)())numIsChar
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
        if(![NSStringFromClass(_self.class) isEqualToString:@"__NSCFNumber"])
            return NO;
        if(!_charCTypeArr){
            _charCTypeArr = @[@"c"];
        }
        if([_charCTypeArr containsObject:[NSString stringWithFormat:@"%s",_self.objCType]])
            return YES;
        return NO;
    };
}
- (void)setNumIsChar:(BOOL (^)())numIsChar{};


- (BOOL (^)())numIsBool
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
        if(![NSStringFromClass(_self.class) isEqualToString:@"__NSCFBoolean"])
            return YES;
        if([_self isKindOfClass: NSClassFromString(@"__NSCFBoolean")])
            return YES;
        return NO;
    };
}
- (void)setNumIsBool:(BOOL (^)())numIsBool{};


- (NSNumber *(^)(NSArray *))numSetWidthToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSNumber, NSNumber);
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            CGRect frame = v.frame;
            frame.size.width = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}
- (void)setNumSetWidthToViews:(NSNumber *(^)(NSArray *))numSetWidthToViews{};

- (NSNumber *(^)(NSArray *))numSetXToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSNumber, NSNumber);
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            CGRect frame = v.frame;
            frame.origin.x = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}
- (void)setNumSetXToViews:(NSNumber *(^)(NSArray *))numSetXToViews{};

- (NSNumber *(^)(NSArray *))numSetYToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSNumber, NSNumber);
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            CGRect frame = v.frame;
            frame.origin.y = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}
- (void)setNumSetYToViews:(NSNumber *(^)(NSArray *))numSetYToViews{};

- (NSString *(^)(NSUInteger))numDoubleToStr
{
    return ^(NSUInteger digit){
        LinkError_REF_AUTO(NSString, NSNumber);
        
        if(!digit){
            
            return [NSString stringWithFormat:@"%ld", (long)[_self integerValue]];
        }else{
            
            NSMutableString* formateStr = [NSMutableString new];
            [formateStr appendString:@"%"];
            [formateStr appendString:[NSString stringWithFormat:@"%lu", (unsigned long)digit]];
            [formateStr appendString:@".f"];
            
            return  [NSString stringWithFormat:formateStr , [_self doubleValue]];
        }
    };
}
- (void)setNumDoubleToStr:(NSString *(^)(NSUInteger))numDoubleToStr{};

- (NSMutableString *(^)(NSUInteger))numDoubleToPercentStr
{
    return ^(NSUInteger digit){
        LinkError_REF_AUTO(NSMutableString, NSNumber);
        
        double newDouble = [_self doubleValue]*100.0;
        NSMutableString* re = [NSMutableString stringWithString:@"%"];
        [re appendString:@(newDouble).numDoubleToStr(digit)];
        return re;
    };
}
- (void)setNumDoubleToPercentStr:(NSMutableString *(^)(NSUInteger))numDoubleToPercentStr{};

@end

@implementation NSNumber (NSNumberLinkBlock)

- (void)numForLoopASC:(void (^)(int))forBlock
{
    LinkError_VAL_IF(NSNumber)
    return;
    if(forBlock){
        int x = _self.intValue;
        for(int i=0 ; i< x; i++ ){
            forBlock(i);
        }
    }
}

- (void)numForLoopDESC:(void (^)(int))forBlock
{
    LinkError_VAL_IF(NSNumber)
    return;
    if(forBlock){
        int x = _self.intValue;
        for(int i=x-1 ; i > -1; i-- ){
            forBlock(i);
        }
    }
}


@end
