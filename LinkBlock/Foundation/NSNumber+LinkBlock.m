//
//  NSNumber+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/4.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"


@implementation NSObject(NSNumberLinkBlock)

- (NSObject *)linkIf_YES
{
    if([self isKindOfClass:[LinkInfo class]]){
        if(((LinkError*)self).infoType == LinkInfoError){
            
            ((LinkError*)self).throwCount++;
            return self;
        }else if(((LinkReturn*)self).infoType == LinkInfoReturn){//中断时
            
            switch (((LinkReturn*)self).returnType) {
                case LinkReturnLink:
                    return self;
                case LinkReturnCondition:
                {
                    NSNumber* reVal = ((LinkReturn*)self).returnValue;
                    if([reVal isKindOfClass:[NSNumber class]] && reVal.boolValue){
                        return reVal;
                    }
                }
                default:
                    return self;
            }
        }
        return self;
    }
    ////////////////////
    ///LinkGroupHandle
    ////////////////////
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (LinkGroup*)self;
        NSMutableArray* returnObjs = [NSMutableArray new];
        for (int i=0; i<group.linkObjects.count; i++) {
            id re = group.linkObjects[i].linkIf_YES;
            [returnObjs addObject:re];
        }
        [group.linkObjects setArray:returnObjs];
        return (id)group;
    }
    
    if([self isKindOfClass:[NSNumber class]] && ((NSNumber*)self).boolValue){//@YES
        return (id)self;
    }
    return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnCondition];
}

- (NSObject *)linkIf_NO
{
    if([self isKindOfClass:[LinkInfo class]]){
        if(((LinkError*)self).infoType == LinkInfoError){
            
            ((LinkError*)self).throwCount++;
            return self;
        }else if(((LinkReturn*)self).infoType == LinkInfoReturn){//中断时
            
            switch (((LinkReturn*)self).returnType) {
                case LinkReturnLink:
                    return self;
                case LinkReturnCondition:
                {
                    NSNumber* reVal = ((LinkReturn*)self).returnValue;
                    if([reVal isKindOfClass:[NSNumber class]] && !reVal.boolValue){
                        return reVal;
                    }
                }
                default:
                    return self;
            }
        }
        return (id)self;
    }
    ////////////////////
    ///LinkGroupHandle
    ////////////////////
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (LinkGroup*)self;
        NSMutableArray* returnObjs = [NSMutableArray new];
        for (int i=0; i<group.linkObjects.count; i++) {
            id re = group.linkObjects[i].linkIf_NO;
            [returnObjs addObject:re];
        }
        [group.linkObjects setArray:returnObjs];
        return (id)group;
    }
    
    if([self isKindOfClass:[NSNumber class]] && !((NSNumber*)self).boolValue){
        return self;
    }
    return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnCondition];
}

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

- (BOOL (^)())numIsIntegerType
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsIntegerType)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        
        char ocType = _self.objCType[0];
        if(ocType == 's' ||//short
           ocType == 'i' ||//int
           ocType == 'l' ||//long
           ocType == 'q' ||//long long
           ocType == 'S' ||//unsigned short
           ocType == 'I' ||//unsigned int
           ocType == 'L' ||//unsigned long
           ocType == 'Q' ){//unsigned long long
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsFloatingType
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsFloatingType)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        
        char ocType = _self.objCType[0];
        if(ocType == 'f' ||//float
           ocType == 'd' ){//double
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsCharType
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsCharType)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        
        char ocType = _self.objCType[0];
        if(ocType == 'c' ||//char
           ocType == 'C' ){//unsigned char
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsBOOL
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsBOOL)
        if(_self.class == NSClassFromString(@"__NSCFBoolean") ||
           [_self isKindOfClass: NSClassFromString(@"__NSCFBoolean")]){
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsChar
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsChar)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        
        char ocType = _self.objCType[0];
        if(ocType == 'c' ){
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsShort
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsShort)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 's') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsInt
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsInt)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'i') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsLong
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsLong)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'l') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsLongLong
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsLongLong)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'q') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsUnsignedChar
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsUnsignedChar)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        
        char ocType = _self.objCType[0];
        if(ocType == 'C' ){
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())numIsUnsignedShort
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsUnsignedShort)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'S') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsUnsignedInt
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsUnsignedInt)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'I') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsUnsignedLong
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsUnsignedLong)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'L') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsUnsignedLongLong
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsUnsignedLongLong)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'Q') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsFloat
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsFloat)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'f') return YES;
        return NO;
    };
}

- (BOOL (^)())numIsDouble
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        };
        LinkGroupHandle_VAL(numIsDouble)
        if(_self.class != NSClassFromString(@"__NSCFNumber")) return NO;
        if(_self.objCType[0] == 'd') return YES;
        return NO;
    };
}

- (NSString *(^)(NSUInteger))numToStrFloating
{
    return ^id(NSUInteger digit){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numToStrFloating,digit)
        if(digit<=0){
            
            return [NSString stringWithFormat:@"%ld", (long)[_self integerValue]];
        }else{
            
            NSString* formatStr = [NSString stringWithFormat:@"%%.%luf",digit];
            return  [NSString stringWithFormat:formatStr , [_self doubleValue]];
        }
    };
}

- (NSMutableString *(^)(NSUInteger))numToStrPercent
{
    return ^id(NSUInteger digit){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numToStrPercent,digit)
        NSMutableString* re = [NSMutableString new];
        [re appendString:@([_self doubleValue]*100.0).numToStrFloating(digit)];
        [re appendString:@"%"];
        return re;
    };
}

- (NSString *(^)(NSUInteger))numToStrMaxDigit
{
    return ^id(NSUInteger maxDigit){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numToStrMaxDigit,maxDigit)
        if(!_self.numIsFloatingType())  return self.description;
        if(maxDigit<1) return [NSString stringWithFormat:@"%lu" , _self.integerValue];
        NSString* formatStr = [NSString stringWithFormat:@"%%.%luf",maxDigit];
        NSString* numStr = [NSString stringWithFormat:formatStr,_self.doubleValue];
        numStr = numStr.strTrimRight(@"0");
        return numStr;
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
- (NSNumber* (^)())numHasDecimalValue_n
{
    return ^id(){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numHasDecimalValue_n)
        if([_self doubleValue] - [_self integerValue])
            return @YES;
        return @NO;
    };
}

- (BOOL (^)(NSNumber *))numIsEqualToNum
{
    return ^(NSNumber* num){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsEqualToNum,num)
        return [_self isEqualToNumber:num];
    };
}

- (NSNumber* (^)(NSNumber *))numIsEqualToNum_n
{
    return ^id(NSNumber* num){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsEqualToNum_n,num)
        return @([_self isEqualToNumber:num]);
    };
}

- (BOOL (^)(NSNumber*))numIsGreatThanNum
{
    return ^BOOL(NSNumber* num){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsGreatThanNum,num)
        return [_self compare:num]==NSOrderedDescending;
    };
}

- (NSNumber* (^)(NSNumber*))numIsGreatThanNum_n
{
    return ^id(NSNumber* num){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsGreatThanNum_n,num)
        return @([_self compare:num]==NSOrderedDescending);
    };
}

- (BOOL (^)(NSNumber*))numIsGreatEqualNum
{
    return ^BOOL(NSNumber* num){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsGreatEqualNum,num)
        return [_self compare:num]>=NSOrderedSame;
    };
}

- (NSNumber* (^)(NSNumber*))numIsGreatEqualNum_n
{
    return ^id(NSNumber* num){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsGreatEqualNum_n,num)
        return @([_self compare:num]>=NSOrderedSame);
    };
}

- (BOOL (^)(NSNumber*))numIsLessThanNum
{
    return ^BOOL(NSNumber* num){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsLessThanNum,num)
        return [_self compare:num]==NSOrderedAscending;
    };
}

- (NSNumber* (^)(NSNumber*))numIsLessThanNum_n
{
    return ^id(NSNumber* num){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsLessThanNum_n,num)
        return @([_self compare:num]==NSOrderedAscending);
    };
}

- (BOOL (^)(NSNumber*))numIsLessEqualNum
{
    return ^BOOL(NSNumber* num){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsLessEqualNum,num)
        return [_self compare:num]<=NSOrderedSame;
    };
}

- (NSNumber* (^)(NSNumber*))numIsLessEqualNum_n
{
    return ^id(NSNumber* num){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsLessEqualNum_n,num)
        return @([_self compare:num]<=NSOrderedSame);
    };
}

- (BOOL (^)())numIsYES
{
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsYES)
        return [_self boolValue] == YES;
    };
}

- (BOOL (^)())numIsNO
{
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsNO)
        return [_self boolValue] == NO;
    };
}

- (NSDate *(^)())numToNSDateSince1970
{
    return ^id(){
        LinkHandle_REF(NSNumber)
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
        if(_self.numIsIntegerType() && ([_self integerValue]%2 == 1)){
            
            return YES;
        }
        return NO;
    };
}
- (NSNumber* (^)())numIsOdd_n
{
    return ^id(){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsOdd_n)
        if(_self.numIsIntegerType() && ([_self integerValue]%2 == 1)){
            
            return @YES;
        }
        return @NO;
    };
}

- (BOOL (^)())numIsEven
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSNumber){
            return NO;
        }
        LinkGroupHandle_VAL(numIsEven)
        if(_self.numIsIntegerType() && ([_self integerValue]%2 == 0)){
            return YES;
        }
        return NO;
    };
}
- (NSNumber* (^)())numIsEven_n
{
    return ^id(){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIsEven_n)
        if(_self.numIsIntegerType() && ([_self integerValue]%2 == 0)){
            return @YES;
        }
        return @NO;
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
- (NSNumber* (^)(NSArray *))numIndexIsInArrRange_n
{
    return ^id(NSArray* arr){
        
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIndexIsInArrRange_n,arr)
        if(![arr isKindOfClass:[NSArray class]])
            return @NO;
        NSInteger idx = [_self integerValue];
        if(idx>=0 && idx<arr.count)
            return @YES;
        return @NO;
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
- (NSNumber* (^)(NSString *))numIndexIsInStringRange_n
{
    return ^id(NSString* str){
        
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIndexIsInStringRange_n,str)
        if(![str isKindOfClass:[NSString class]])
            return @NO;
        NSInteger idx = [_self integerValue];
        if(idx>=0 && idx<str.length)
            return @YES;
        return @NO;
    };
}

- (NSNumber* (^)(NSMutableArray *))numIndexObjRemoveFromArr
{
    return ^id(NSMutableArray* arr){
        
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIndexObjRemoveFromArr,arr)
        NSInteger idx = _self.integerValue;
        if(idx>0 && idx<arr.count-1)
            [arr removeObjectAtIndex:idx];
        return _self;
    };
}

- (NSObject *(^)(NSMutableArray *))numIndexObjInArr
{
    return ^id(NSMutableArray* arr){
        
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numIndexObjInArr,arr)
        NSInteger idx = _self.integerValue;
        if(idx>0 && idx<arr.count-1) return arr[idx];
        return [NSNull null];
    };
}

- (UIFont *(^)())numToUIFontSystemSize
{
    return ^id(){
        LinkHandle_REF(NSNumber)
        LinkGroupHandle_REF(numToUIFontSystemSize)
        return [UIFont systemFontOfSize:[_self doubleValue]];
    };
}

- (UIColor *(^)())numToUIColorFromHex
{
    return ^id(){
        LinkHandle_REF(NSNumber)
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
