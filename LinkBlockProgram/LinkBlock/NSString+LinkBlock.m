//
//  NSString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSString+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(NSStringLinkBlock)

- (NSMutableString *(^)())strMutableCopy
{
    return ^(){
        LinkError_REF_AUTO_IF(NSMutableString, NSString);
        return (NSMutableString*)_self.mutableCopy;
    };
}
- (void)setStrMutableCopy:(NSMutableString *(^)())strMutableCopy{};

- (BOOL (^)(NSString *))strIsEqualStr
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self isEqualToString:str];
    };
}

- (NSString *(^)(NSString *))strAppend
{
    return ^(NSString *str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(str.objIsKind([NSString class])){
            return [_self stringByAppendingString:str];
        }else{
            return _self;
        }
    };
}

- (NSString *(^)(NSString *, NSString *))strReplace
{
    return ^(NSString* replaceStr, NSString* withStr){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(replaceStr.objIsKind([NSString class]) && withStr.objIsKind([NSString class])){
            return [_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr];
        }
        else{
            return _self;
        }
    };
}

- (NSString *(^)(NSString *, NSUInteger))strInsertAt
{
    return ^(NSString* str, NSUInteger index){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(str.objIsKind([NSString class])){
            NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
            [tNewMStr insertString:str atIndex:index];
            return (NSString*)[tNewMStr copy];
        }else{
            return _self;
        }
    };
}

- (NSString *(^)(NSRange))strDeleteInRange
{
    return ^(NSRange range){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
        [tNewMStr deleteCharactersInRange:range];
        return (NSString*)[tNewMStr copy];
    };
}
- (NSString *(^)(NSUInteger))strAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(index > _self.length - 1)
            index = _self.length - 1;
        unichar ch = [_self characterAtIndex:index];
        return [NSString stringWithCharacters:&ch length:1];
    };
}


- (NSString *(^)(NSString *, NSRange))strReplaceInRange
{
    return ^(NSString* str, NSRange range){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(str.objIsKind([NSString class])){
            return [_self stringByReplacingCharactersInRange:range withString:str];
        }else{
            return _self;
        }
    };
}
- (NSString *(^)(NSString *))strDeleteStr
{
    return ^(NSString *str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if(str.objIsKind([NSString class])){
            return [_self stringByReplacingOccurrencesOfString:str withString:@""];
        }else{
            return _self;
        }
    };
}
- (BOOL (^)(NSString *))strIsContain
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self containsString:str];
    };
}
- (NSInteger (^)(NSString *))strIndexOfStr
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return (NSInteger)0;
        }
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([_self rangeOfString:str].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (NSInteger (^)(NSString *, NSUInteger))strIndexOfStrStartAt
{
    return ^(NSString* str, NSUInteger startIndex){
        LinkError_VAL_IF(NSString){
            return (NSInteger)0;
        }
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([_self rangeOfString:str options:NSCaseInsensitiveSearch range:NSMakeRange(startIndex, _self.length- startIndex)].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (NSRange (^)(NSString *))strRangeOfStr
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return NSMakeRange(NSNotFound, 0);
        }
        if([str isKindOfClass:[NSString class]]){
            return [_self rangeOfString:str];
        }else{
            return NSMakeRange(NSNotFound, 0);
        }
    };
}
- (NSString *(^)(NSString *, ...))strAppendFormate
{
    return ^(NSString *formateStr, ...){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if([formateStr isKindOfClass:[NSString class]]){
            va_list args;
            va_start(args, formateStr);
            NSString *re= [_self stringByAppendingString:[[NSString alloc] initWithFormat:formateStr arguments:args]];
            va_end(args);
            return re;
        }
        return _self;
    };
}
- (BOOL (^)())strIsEmoji
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        // 判断是否是 emoji表情
        BOOL returnValue = NO;
        
        const unichar hs = [_self characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (_self.length > 1) {
                const unichar ls = [_self characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (_self.length > 1) {
            const unichar ls = [_self characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
        return returnValue;
    };
}

- (CGSize (^)(UIFont *))strSizeWithFont
{
    return ^(UIFont* font){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return _self.strSizeWithFontAndMaxWidth(font , MAXFLOAT);
    };
}

- (CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth
{
    return ^(UIFont* font, CGFloat maxWidth){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return _self.strSizeWithFontAndMaxSize(font , CGSizeMake(maxWidth, MAXFLOAT));
    };
}

- (CGSize (^)(UIFont *, CGSize))strSizeWithFontAndMaxSize
{
    return ^(UIFont* font, CGSize maxSize){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = font;
        
        if ([[UIDevice currentDevice].systemVersion floatValue]>= 7.0) {
            return [_self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
        } else {
            return [_self sizeWithFont:font constrainedToSize:maxSize];
        }
    };
}

- (BOOL (^)())strIsBlank{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        if ([[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
        if ([_self isEqualToString:@"<null>"]) {
            return YES;
        }
        if ([_self isEqualToString:@"(null)"]) {
            return YES;
        }
        return NO;
    };
}

- (NSUInteger (^)())strLength
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSUInteger)0;
        }
        return _self.length;
    };
}

- (NSUInteger (^)())strLengthASCII
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSUInteger)0;
        }
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < _self.length; i++)
        {
            unichar uc = [_self characterAtIndex: i];
            asciiLength += isascii(uc) ? 1 : 2;
        }
        return asciiLength;
    };
}

- (NSUInteger (^)())strLengthUnicode
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSUInteger)0;
        }
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < _self.length; i++)
        {
            unichar uc = [_self characterAtIndex: i];
            asciiLength += isascii(uc) ? 1 : 2;
        }
        NSUInteger unicodeLength = asciiLength / 2;
        if(asciiLength % 2)
        {
            unicodeLength++;
        }
        return unicodeLength;
    };
}

- (BOOL (^)())strIsContainEmoji
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        __block BOOL isEomji = NO;
        
        [_self enumerateSubstringsInRange:NSMakeRange(0, _self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            const unichar hs = [substring characterAtIndex:0];
            // surrogate pair
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        isEomji = YES;
                    }
                }
            } else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    isEomji = YES;
                }
            } else {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                    isEomji = YES;
                } else if (0x2B05 <= hs && hs <= 0x2b07) {
                    isEomji = YES;
                } else if (0x2934 <= hs && hs <= 0x2935) {
                    isEomji = YES;
                } else if (0x3297 <= hs && hs <= 0x3299) {
                    isEomji = YES;
                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                    isEomji = YES;
                }
            }
        }];
        return isEomji;
    };
}

- (NSString* (^)())strClearSpaceAndWrap
{
    return ^(){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSString *noWrap = [_self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@" " withString:@""];
        return noWrap;
    };
}

- (NSComparisonResult (^)(NSString *))strCompareNumberSensitive
{
    return ^(NSString* str ){
        LinkError_VAL_IF(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        return [_self compare:str options: NSNumericSearch | NSWidthInsensitiveSearch ];
    };
}

- (NSComparisonResult (^)(NSString *))strCompare
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        return [_self compare:str options: NSWidthInsensitiveSearch | NSForcedOrderingSearch];
    };;
}

- (BOOL (^)())strIsInteger
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        NSScanner *scaner= [[NSScanner alloc] initWithString:_self];
        NSInteger intVal;
        return (BOOL)([scaner scanInteger:&intVal] && [scaner isAtEnd]);
    };
}

- (BOOL (^)())strIsFloating
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        NSScanner *scaner= [[NSScanner alloc] initWithString:_self];
        double doubleVal;
        return (BOOL)([scaner scanDouble:&doubleVal] && [scaner isAtEnd]);
    };
}

- (BOOL (^)())strIsNumber
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return (BOOL)(_self.strIsInteger() || _self.strIsFloating());
    };
}
- (void)setStrIsNumber:(BOOL (^)())blockIsNumber{};

- (NSString *(^)(NSString *))strDeleteLeft
{
    return ^(NSString* str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSMutableString * reIsStrM= [_self mutableCopy];
        NSRange range = [str rangeOfString:str];
        if(range.location == 0){
            [reIsStrM deleteCharactersInRange:range];
        }
        return (NSString*)reIsStrM.objCopy();
    };
}
- (NSString *(^)(NSString *))strDeleteRight
{
    return ^(NSString* str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSString* re = _self;
        NSString* lastStr = [re substringWithRange:NSMakeRange(_self.length- str.length, str.length)];
        if([str isEqualToString:lastStr]){
            re= [_self substringWithRange:NSMakeRange(0, _self.length - str.length)];
        }
        return re;
    };
}

- (NSString *(^)(NSString*))strTrimLeft
{
    return ^(NSString* str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSMutableString * reIsStrM= _self.strMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}

- (NSString *(^)(NSString*))strTrimRight
{
    return ^(NSString* str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSMutableString * reIsStrM= [_self mutableCopy];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}

- (NSString *(^)(NSString *))strTrim
{
    return ^(NSString* str){
        LinkError_REF_AUTO_IF(NSString, NSString);
        NSMutableString * reIsStrM= _self.strMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}

- (UIColor *(^)())strToColorFromHexStr
{
    return ^(){
        LinkError_REF_AUTO_IF(UIColor, NSString);
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString length] < 6)
            return [UIColor whiteColor];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        if ([newString length] != 6)
            return [UIColor whiteColor];
        
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [newString substringWithRange:range];
        range.location = 2;
        NSString *gString = [newString substringWithRange:range];
        range.location = 4;
        NSString *bString = [newString substringWithRange:range];
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    };
}

- (double (^)())strToDoubleFromHexStr
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return 0.0;
        }
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        double re=0.0;
        [[NSScanner scannerWithString:newString] scanHexDouble:&re];
        return re;
    };
}

- (unsigned int (^)())strToIntFromHexStr
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (unsigned int)0;
        }
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        unsigned int re = 0;
        [[NSScanner scannerWithString:newString] scanHexInt:&re];
        return re;
    };
}

- (CGRect (^)())strToCGRect
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGRectZero;
        }
        return CGRectFromString(_self);
    };
}

- (CGPoint (^)())strToCGPoint
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGPointZero;
        }
        return CGPointFromString(_self);
    };
}

- (CGVector (^)())strToCGVector
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGVectorMake(0, 0);
        }
        return CGVectorFromString(_self);
    };
}

- (CGSize (^)())strToCGSize
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return CGSizeFromString(_self);
    };
}

- (CGAffineTransform (^)())strToCGAffineTransform
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGAffineTransformMake(0, 0, 0, 0, 0, 0);
        }
        return CGAffineTransformFromString(_self);
    };
}

- (UIEdgeInsets (^)())strToUIEdgeInsets
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return UIEdgeInsetsZero;
        }
        return UIEdgeInsetsFromString(_self);
    };
}

- (UIOffset (^)())strToUIOffset
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return UIOffsetZero;
        }
        return UIOffsetFromString(_self);
    };
}

-(NSURL *(^)())strToNSURL
{
    return ^(){
        LinkError_REF_AUTO_IF(NSURL, NSString);
        return [NSURL URLWithString:_self];
    };
}

- (UIImage *(^)())strToUIImage
{
    return ^(){
        LinkError_REF_AUTO_IF(UIImage, NSString);
        return [UIImage imageNamed:_self];
    };
}

- (NSInteger (^)())strToInteger
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSInteger)0;
        }
        return [_self integerValue];
    };
}

- (long long (^)())strToLongLong
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (long long)0;
        }
        return [_self longLongValue];
    };
}

- (BOOL (^)())strToBOOL
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self boolValue];
    };
}

- (double (^)())strToDouble
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (double)0.0;
        }
        return [_self doubleValue];
    };
}

- (float (^)())strToFloat
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (float)0.0;
        }
        return [_self floatValue];
    };
}

- (NSArray *(^)(NSString *))strSplitWithStr
{
    return ^(NSString* splitStr){
        LinkError_REF_AUTO_IF(NSArray, NSString);
        return [_self componentsSeparatedByString:splitStr];
    };
}
- (void)setStrSplitWithStr:(NSArray *(^)(NSString *))blockSplitStrWithStr{};

- (NSArray *(^)(NSString *))strSplitWithCharsStr
{
    return ^(NSString* splitStrs){
        LinkError_REF_AUTO_IF(NSArray, NSString);
        NSCharacterSet *charSet= [NSCharacterSet characterSetWithCharactersInString:splitStrs];
        return [_self componentsSeparatedByCharactersInSet:charSet];
    };
}
- (void)setStrSplitWithCharsStr:(NSArray *(^)(NSString *))blockSplitStrWithCharsStr{};

- (BOOL (^)(NSString *))strHasPrefix
{
    return ^(NSString* prefix){
        LinkError_VAL_IF(NSString);
        return [_self hasPrefix:prefix];
    };
}
- (void)setStrHasPrefix:(BOOL (^)(NSString *))strHasPrefix{};

- (BOOL (^)(NSString *))strHasSuffix
{
    return ^(NSString* suffix){
        LinkError_VAL_IF(NSString);
        return [_self hasSuffix:suffix];
    };
}
- (void)setStrHasSuffix:(BOOL (^)(NSString *))strHasSuffix{};

- (NSString *(^)(NSUInteger))strSubFrom
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO_IF(NSString, NSString);
        return [_self substringFromIndex:idx];
    };
}
- (void)setStrSubFrom:(NSString *(^)(NSUInteger))strSubFrom{};

- (NSString *(^)(NSUInteger))strSubTo
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO_IF(NSString, NSString);
        return [_self substringToIndex:idx];
    };
}
- (void)setStrSubTo:(NSString *(^)(NSUInteger))strSubTo{};

- (NSString *(^)(NSUInteger, NSUInteger))strSubFromTo
{
    return ^(NSUInteger from, NSUInteger to){
        LinkError_REF_AUTO_IF(NSString, NSString);
        if( from> to || to>_self.length)
            return _self;
        return [_self substringWithRange:NSMakeRange(from, to- from)];
    };
}
- (void)setStrSubFromTo:(NSString *(^)(NSUInteger, NSUInteger))strSubFromTo{};

- (void)setStrAppend:(NSString *(^)(NSString *))strAppendStr{};
- (void)setStrDeleteStr:(NSString *(^)(NSString *))strDeleteStr{};
- (void)setStrDeleteInRange:(NSString *(^)(NSRange))strDeleteStrInRange{};
- (void)setStrIndexOfStr:(NSInteger (^)(NSString *))strIndexOfStr{};
- (void)setStrIndexOfStrStartAt:(NSInteger (^)(NSString *, NSUInteger))strIndexOfStrStartIndex{};
- (void)setStrInsertAt:(NSString *(^)(NSString *, NSUInteger))strInsertStrAtIndex{};
- (void)setStrIsContain:(BOOL (^)(NSString *))strIsContainStr{};
- (void)setStrRangeOfStr:(NSRange (^)(NSString *))strRangeOfString{};
- (void)setStrReplaceInRange:(NSString *(^)(NSString *, NSRange))strReplaceStrInRange{};
- (void)setStrReplace:(NSString *(^)(NSString *, NSString *))strReplaceStrWithStr{};
- (void)setStrAppendFormate:(NSString *(^)(NSString *, ...))strAppendFormate{};
- (void)setStrAt:(NSString *(^)(NSUInteger))strStrAtIndex{};
- (void)setStrLength:(NSUInteger (^)())strLength{};
- (void)setStrLengthASCII:(NSUInteger (^)())strLengthASCII{};
- (void)setStrLengthUnicode:(NSUInteger (^)())strLengthUniCode{};
- (void)setStrCompareNumberSensitive:(NSComparisonResult (^)(NSString *))strCompareStrNumberSuper{};
- (void)setStrCompare:(NSComparisonResult (^)(NSString *))strCompareStr{};
- (void)setStrIsInteger:(BOOL (^)())strIsInt{};
- (void)setStrIsFloating:(BOOL (^)())strIsDoubel{};
- (void)setStrIsBlank:(BOOL (^)())strIsStrBlank{};
- (void)setStrTrimLeft:(NSString *(^)(NSString *))strTrimCharLeft{};
- (void)setStrSizeWithFont:(CGSize (^)(UIFont *))strSizeWithFont{};
- (void)setStrSizeWithFontAndMaxSize:(CGSize (^)(UIFont *, CGSize))strSizeWithFontAndMaxSize{};
- (void)setStrSizeWithFontAndMaxWidth:(CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth{};
- (void)setStrDeleteRight:(NSString *(^)(NSString *))strDeleteStrRight{};
- (void)setStrDeleteLeft:(NSString *(^)(NSString *))strDeleteStrLeft{};
- (void)setStrIsContainEmoji:(BOOL (^)())strIsContainEmoji{};
- (void)setStrTrimRight:(NSString *(^)(NSString *))strTrimCharRight{};
- (void)setStrIsEmoji:(BOOL (^)())strIsStrEmoji{};
- (void)setStrClearSpaceAndWrap:(NSString *(^)())strClearSpaceAndWrap{};
- (void)setStrIsEqualStr:(BOOL (^)(NSString *))strIsEqualStr{};
- (void)setStrToCGPoint:(CGPoint (^)())strToCGPoint{};
- (void)setStrToCGVector:(CGVector (^)())strToCGVector{};
- (void)setStrToCGSize:(CGSize (^)())strToCGSize{};
- (void)setStrToCGRect:(CGRect (^)())strToCGRect{};
- (void)setStrToCGAffineTransform:(CGAffineTransform (^)())strToCGAffineTransform{};
- (void)setStrToUIEdgeInsets:(UIEdgeInsets (^)())strToUIEdgeInsets{};
- (void)setStrToUIOffset:(UIOffset (^)())strToUIOffset{};
- (void)setStrToColorFromHexStr:(UIColor *(^)())strToColorFromHexStr{};
- (void)setStrToBOOL:(BOOL (^)())strToBOOL{};
- (void)setStrToUIImage:(UIImage *(^)())strToUIImage{};
- (void)setStrToInteger:(NSInteger (^)())strToNSInteger{};
- (void)setStrToDouble:(double (^)())strToDouble{};
- (void)setStrToNSURL:(NSURL *(^)())strToNSURL{};
- (void)setStrToFloat:(float (^)())strToFloat{};
- (void)setStrToLongLong:(long long (^)())strToLongLong{};
- (void)setStrToDoubleFromHexStr:(double (^)())strToDoubleFromHexStr{};
- (void)setStrToIntFromHexStr:(unsigned int (^)())strToIntFromHexStr{};
@end
