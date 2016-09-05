//
//  NSNumber+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"


@implementation NSObject(NSNumberLinkBlock)

- (void *(^)())numValue
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return (void*)nil;
        }
        LinkGroupHandle_VAL(numValue)
        void* re;
        [_self getValue:&re];
        return re;
    };
}


static NSArray* _integerCTypeArr;
- (BOOL (^)())numIsInteger
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsInteger)
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


static NSArray* _floatingCTypeArr;
- (BOOL (^)())numIsFloating
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsFloating)
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


static NSArray* _charCTypeArr;
- (BOOL (^)())numIsChar
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsChar)
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



- (BOOL (^)())numIsBool
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsBool)
        if(![NSStringFromClass(_self.class) isEqualToString:@"__NSCFBoolean"])
            return YES;
        if([_self isKindOfClass: NSClassFromString(@"__NSCFBoolean")])
            return YES;
        return NO;
    };
}



- (NSNumber *(^)(NSArray *))numSetWidthToViews
{
    return ^id(NSArray* views){
        
        LinkHandle_REF(NSNumber, NSNumber)
        LinkGroupHandle_REF(numSetWidthToViews,views)
        if(![views isKindOfClass:[NSArray class]])
            return _self;
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            
            if(![v isKindOfClass:[UIView class]]){
                *stop = YES;
                return;
            }
            CGRect frame = v.frame;
            frame.size.width = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}

- (NSNumber *(^)(NSArray *))numSetHeightToViews
{
    return ^id(NSArray* views){
        
        LinkHandle_REF(NSNumber, NSNumber)
        LinkGroupHandle_REF(numSetHeightToViews,views)
        if(![views isKindOfClass:[NSArray class]])
            return _self;
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            
            if(![v isKindOfClass:[UIView class]]){
                *stop = YES;
                return;
            }
            CGRect frame = v.frame;
            frame.size.height = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}

- (NSNumber *(^)(NSArray *))numSetXToViews
{
    return ^id(NSArray* views){
        
        LinkHandle_REF(NSNumber, NSNumber)
        LinkGroupHandle_REF(numSetXToViews,views)
        if(![views isKindOfClass:[NSArray class]])
            return _self;
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            
            if(![v isKindOfClass:[UIView class]]){
                *stop = YES;
                return;
            }
            CGRect frame = v.frame;
            frame.origin.x = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}

- (NSNumber *(^)(NSArray *))numSetYToViews
{
    return ^id(NSArray* views){
        
        LinkHandle_REF(NSNumber, NSNumber)
        LinkGroupHandle_REF(numSetYToViews,views)
        if(![views isKindOfClass:[NSArray class]])
            return _self;
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            
            if(![v isKindOfClass:[UIView class]]){
                *stop = YES;
                return;
            }
            CGRect frame = v.frame;
            frame.origin.y = _self.doubleValue;
            v.frame= frame;
        }];
        return _self;
    };
}

- (NSString *(^)(NSUInteger))numFloatingToStr
{
    return ^id(NSUInteger digit){
        LinkHandle_REF(NSString, NSNumber)
        LinkGroupHandle_REF(numFloatingToStr,digit)
        if(digit<=0){
            
            return [NSString stringWithFormat:@"%ld", (long)[_self integerValue]];
        }else{
            
            NSMutableString* formatStr = [NSMutableString new];
            [formatStr appendString:@"%."];
            [formatStr appendString:[NSString stringWithFormat:@"%lu", (unsigned long)digit]];
            [formatStr appendString:@"f"];
            return  [NSString stringWithFormat:formatStr , [_self doubleValue]];
        }
    };
}
- (void)setNumFloatingToStr:(NSString *(^)(NSUInteger))numFloatingToStr{}

- (NSMutableString *(^)(NSUInteger))numFloatingToPercentStr
{
    return ^id(NSUInteger digit){
        LinkHandle_REF(NSMutableString, NSNumber)
        LinkGroupHandle_REF(numFloatingToPercentStr,digit)
        NSMutableString* re = [NSMutableString new];
        [re appendString:@([_self doubleValue]*100.0).numFloatingToStr(digit)];
        [re appendString:@"%"];
        return re;
    };
}

- (BOOL (^)())numHasDecimalValue
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numHasDecimalValue)
        if([_self doubleValue] - [_self integerValue])
            return YES;
        return NO;
    };
}

- (BOOL (^)(double))numIsEqualToValue
{
    return ^(double value){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsEqualToValue,value)
        if([_self doubleValue] == value)
            return YES;
        return NO;
    };
}

- (BOOL (^)(double))numIsMoreThanValue
{
    return ^(double value){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsMoreThanValue,value)
        if([_self doubleValue] > value)
            return YES;
        return NO;
    };
}

- (BOOL (^)(double))numIsMoreThanOrEqualValue
{
    return ^(double value){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsMoreThanOrEqualValue,value)
        if([_self doubleValue] >= value)
            return YES;
        return NO;
    };
}

- (BOOL (^)(double))numIsLessThanValue
{
    return ^(double value){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsLessThanValue,value)
        if([_self doubleValue] < value)
            return YES;
        return NO;
    };
}

- (BOOL (^)(double))numIsLessThanOrEqualValue
{
    return ^(double value){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsLessThanOrEqualValue,value)
        if([_self doubleValue] <= value)
            return YES;
        return NO;
    };
}

- (BOOL (^)(NSNumber *))numIsEqualToNum
{
    return ^(NSNumber* aNum){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsEqualToNum,aNum)
        if(![aNum isKindOfClass:[NSNumber class]])
            return NO;
        if([_self isEqualToNumber:aNum]){
            return YES;
        }
        return NO;
    };
}

- (NSDate *(^)())numToNSDateSince1970
{
    return ^id(){
        LinkHandle_REF(NSDate, NSNumber)
        LinkGroupHandle_REF(numToNSDateSince1970)
        return [NSDate dateWithTimeIntervalSince1970:[_self doubleValue]];
    };
}

- (BOOL (^)())numIsOdd
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsOdd)
        if(_self.numIsInteger() && ([_self integerValue]%2 == 1)){
            
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsEven
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsEven)
        if(_self.numIsInteger() && ([_self integerValue]%2 == 0)){
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)(NSArray *))numIndexIsInArrRange
{
    return ^(NSArray* arr){
        
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIndexIsInArrRange,arr)
        if(![arr isKindOfClass:[NSArray class]])
            return NO;
        NSInteger idx = [_self integerValue];
        if(idx>=0 && idx<arr.count)
            return YES;
        return NO;
    };
}

- (BOOL (^)(NSString *))numIndexIsInStringRange
{
    return ^(NSString* str){
        
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIndexIsInStringRange,str)
        if(![str isKindOfClass:[NSString class]])
            return NO;
        NSInteger idx = [_self integerValue];
        if(idx>=0 && idx<str.length)
            return YES;
        return NO;
    };
}

- (UIFont *(^)())numToUIFontSystemSize
{
    return ^id(){
        LinkHandle_REF(UIFont, NSNumber)
        LinkGroupHandle_REF(numToUIFontSystemSize)
        return [UIFont systemFontOfSize:[_self doubleValue]];
    };
}

- (UIColor *(^)())numToUIColorFromHex
{
    return ^id(){
        LinkHandle_REF(UIColor, NSNumber)
        LinkGroupHandle_REF(numToUIColorFromHex)
        NSInteger rgbValue = _self.integerValue;
        return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                               green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
    };
}

@end

@implementation NSNumber (NSNumberLinkBlock)

- (void)numForLoopASC:(void (^)(int))forBlock
{
    if(forBlock){
        int x = self.intValue;
        for(int i=0 ; i< x; i++ ){
            forBlock(i);
        }
    }
}

- (void)numForLoopDESC:(void (^)(int))forBlock
{
    if(forBlock){
        int x = self.intValue;
        for(int i=x-1 ; i > -1; i-- ){
            forBlock(i);
        }
    }
}


@end
