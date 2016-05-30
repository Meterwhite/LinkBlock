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
    return ^(NSArray* views){
        
        LinkError_REF_AUTO(NSNumber, NSNumber);
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
    return ^(NSArray* views){
        
        LinkError_REF_AUTO(NSNumber, NSNumber);
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
    return ^(NSArray* views){
        
        LinkError_REF_AUTO(NSNumber, NSNumber);
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
    return ^(NSUInteger digit){
        LinkError_REF_AUTO(NSString, NSNumber);
        
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
    return ^(NSUInteger digit){
        LinkError_REF_AUTO(NSMutableString, NSNumber);
        
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
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] - [_self integerValue])
            return YES;
        return NO;
    };
}
- (void)setNumHasDecimalValue:(BOOL (^)())numHasDecimalValue{};

- (BOOL (^)(double))numIsEqualToValue
{
    return ^(double value){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] == value)
            return YES;
        return NO;
    };
}
- (void)setNumIsEqualToValue:(BOOL (^)(double))numIsEqualToValue{};

- (BOOL (^)(double))numIsMoreThanValue
{
    return ^(double value){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] > value)
            return YES;
        return NO;
    };
}
- (void)setNumIsMoreThanValue:(BOOL (^)(double))numIsMoreThanValue{};

- (BOOL (^)(double))numIsMoreThanOrEqualValue
{
    return ^(double value){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] >= value)
            return YES;
        return NO;
    };
}
- (void)setNumIsMoreThanOrEqualValue:(BOOL (^)(double))numIsMoreThanOrEqualValue{};

- (BOOL (^)(double))numIsLessThanValue
{
    return ^(double value){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] < value)
            return YES;
        return NO;
    };
}
- (void)setNumIsLessThanValue:(BOOL (^)(double))numIsLessThanValue{};

- (BOOL (^)(double))numIsLessThanOrEqualValue
{
    return ^(double value){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        if([_self doubleValue] <= value)
            return YES;
        return NO;
    };
}
- (void)setNumIsLessThanOrEqualValue:(BOOL (^)(double))numIsLessThanOrEqualValue{};

- (BOOL (^)(NSNumber *))numIsEqualToNum
{
    return ^(NSNumber* aNum){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
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
    return ^(){
        LinkError_REF_AUTO(NSDate, NSNumber);
        return [NSDate dateWithTimeIntervalSince1970:[_self doubleValue]];
    };
}
- (void)setNumToNSDateSince1970:(NSDate *(^)())numToNSDateSince1970{};

- (BOOL (^)())numIsOdd
{
    return ^(){
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        
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
        LinkError_VAL_IF(NSNumber){
            return NO;
        }
        
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
        
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
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
        
        LinkError_VAL_IF(NSNumber){
            return NO;
        };
        if(![str isKindOfClass:[NSString class]])
            return NO;
        NSInteger idx = [_self integerValue];
        if(idx>=0 && idx<str.length)
            return YES;
        return NO;
    };
}
- (void)setNumIndexIsInStringRange:(BOOL (^)(NSString *))numIndexIsInStringRange{};
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
