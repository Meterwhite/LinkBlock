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
- (void)setNumValue:(void *(^)())numValue{};

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
- (void)setNumIsInteger:(BOOL (^)())numIsInteger{};

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
- (void)setNumIsFloating:(BOOL (^)())numIsFloating{};

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
- (void)setNumIsChar:(BOOL (^)())numIsChar{};


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
- (void)setNumIsBool:(BOOL (^)())numIsBool{};


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
- (void)setNumSetWidthToViews:(NSNumber *(^)(NSArray *))numSetWidthToViews{};

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
- (void)setNumSetHeightToViews:(NSNumber *(^)(NSArray *))numSetHeightToViews{};

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
- (void)setNumSetXToViews:(NSNumber *(^)(NSArray *))numSetXToViews{};

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
- (void)setNumSetYToViews:(NSNumber *(^)(NSArray *))numSetYToViews{};

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
- (void)setNumFloatingToPercentStr:(NSMutableString *(^)(NSUInteger))numFloatingToPercentStr{};

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
- (void)setNumHasDecimalValue:(BOOL (^)())numHasDecimalValue{};

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
- (void)setNumIsEqualToValue:(BOOL (^)(double))numIsEqualToValue{};

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
- (void)setNumIsMoreThanValue:(BOOL (^)(double))numIsMoreThanValue{};

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
- (void)setNumIsMoreThanOrEqualValue:(BOOL (^)(double))numIsMoreThanOrEqualValue{};

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
- (void)setNumIsLessThanValue:(BOOL (^)(double))numIsLessThanValue{};

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
- (void)setNumIsLessThanOrEqualValue:(BOOL (^)(double))numIsLessThanOrEqualValue{};

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
- (void)setNumIsEqualToNum:(BOOL (^)(NSNumber *))numIsEqualToNum{};

- (NSDate *(^)())numToNSDateSince1970
{
    return ^id(){
        LinkHandle_REF(NSDate, NSNumber)
        LinkGroupHandle_REF(numToNSDateSince1970)
        return [NSDate dateWithTimeIntervalSince1970:[_self doubleValue]];
    };
}
- (void)setNumToNSDateSince1970:(NSDate *(^)())numToNSDateSince1970{};

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
- (void)setNumIsOdd:(BOOL (^)())numIsOdd{};

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
- (void)setNumIsEven:(BOOL (^)())numIsEven{};

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
- (void)setNumIndexIsInArrRange:(BOOL (^)(NSArray *))numIndexIsInArrRange{};

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
- (void)setNumIndexIsInStringRange:(BOOL (^)(NSString *))numIndexIsInStringRange{};

- (UIFont *(^)())numToUIFontSystemSize
{
    return ^id(){
        LinkHandle_REF(UIFont, NSNumber)
        LinkGroupHandle_REF(numToUIFontSystemSize)
        return [UIFont systemFontOfSize:[_self doubleValue]];
    };
}
- (void)setNumToUIFontSystemSize:(UIFont *(^)())numToUIFontSystemSize{};
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
