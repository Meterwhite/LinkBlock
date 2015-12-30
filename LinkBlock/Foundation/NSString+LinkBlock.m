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
        LinkError_REF_AUTO(NSMutableString, NSString);
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

- (void)setStrIsEqualStr:(BOOL (^)(NSString *))strIsEqualStr{};

- (NSString *(^)(NSString *))strAppend
{
    return ^(NSString *str){
        LinkError_REF_AUTO(NSString, NSString);
        if(str.isKindOf([NSString class])){
            return [_self stringByAppendingString:str];
        }else{
            return _self;
        }
    };
}
- (void)setStrAppend:(NSString *(^)(NSString *))strAppend{};

- (NSString *(^)(NSString *, NSString *))strReplace
{
    return ^(NSString* replaceStr, NSString* withStr){
        LinkError_REF_AUTO(NSString, NSString);
        if(replaceStr.isKindOf([NSString class]) && withStr.isKindOf([NSString class])){
            return [_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr];
        }
        else{
            return _self;
        }
    };
}
- (void)setStrReplace:(NSString *(^)(NSString *, NSString *))strReplace{};

- (NSString *(^)(NSString *, NSUInteger))strInsertAt
{
    return ^(NSString* str, NSUInteger index){
        LinkError_REF_AUTO(NSString, NSString);
        if(str.isKindOf([NSString class])){
            NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
            [tNewMStr insertString:str atIndex:index];
            return (NSString*)[tNewMStr copy];
        }else{
            return _self;
        }
    };
}
- (void)setStrInsertAt:(NSString *(^)(NSString *, NSUInteger))strInsertAt{};

- (NSString *(^)(NSRange))strDeleteInRange
{
    return ^(NSRange range){
        LinkError_REF_AUTO(NSString, NSString);
        NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
        [tNewMStr deleteCharactersInRange:range];
        return (NSString*)[tNewMStr copy];
    };
}
- (void)setStrDeleteInRange:(NSString *(^)(NSRange))strDeleteInRange{};

- (NSString *(^)(NSUInteger))strAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(NSString, NSString);
        if(index > _self.length - 1)
            index = _self.length - 1;
        unichar ch = [_self characterAtIndex:index];
        return [NSString stringWithCharacters:&ch length:1];
    };
}
- (void)setStrAt:(NSString *(^)(NSUInteger))strAt{};

- (NSString *(^)(NSString *, NSRange))strReplaceInRange
{
    return ^(NSString* str, NSRange range){
        LinkError_REF_AUTO(NSString, NSString);
        if(str.isKindOf([NSString class])){
            return [_self stringByReplacingCharactersInRange:range withString:str];
        }else{
            return _self;
        }
    };
}
- (void)setStrReplaceInRange:(NSString *(^)(NSString *, NSRange))strReplaceInRange{};

- (NSString *(^)(NSString *))strDeleteStr
{
    return ^(NSString *str){
        LinkError_REF_AUTO(NSString, NSString);
        if(str.isKindOf([NSString class])){
            return [_self stringByReplacingOccurrencesOfString:str withString:@""];
        }else{
            return _self;
        }
    };
}
- (void)setStrDeleteStr:(NSString *(^)(NSString *))strDeleteStr{};

- (BOOL (^)(NSString *))strIsContain
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self containsString:str];
    };
}
- (void)setStrIsContain:(BOOL (^)(NSString *))strIsContain{};

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
- (void)setStrIndexOfStr:(NSInteger (^)(NSString *))strIndexOfStr{};

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
- (void)setStrIndexOfStrStartAt:(NSInteger (^)(NSString *, NSUInteger))strIndexOfStrStartAt{};

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
- (void)setStrRangeOfStr:(NSRange (^)(NSString *))strRangeOfStr{};

- (NSString *(^)(NSString *, ...))strAppendFormate
{
    return ^(NSString *formateStr, ...){
        LinkError_REF_AUTO(NSString, NSString);
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
- (void)setStrAppendFormate:(NSString *(^)(NSString *, ...))strAppendFormate{};

- (NSString *(^)(NSString *))strAppendLine
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSString, NSString);
        return [_self stringByAppendingFormat:@"%@%@", @"\r\n", str];
    };
}
- (void)setStrAppendLine:(NSString *(^)(NSString *))strAppendLine{};

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
- (void)setStrIsEmoji:(BOOL (^)())strIsEmoji{};

- (CGSize (^)(UIFont *))strSizeWithFont
{
    return ^(UIFont* font){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return _self.strSizeWithFontAndMaxWidth(font , MAXFLOAT);
    };
}
- (void)setStrSizeWithFont:(CGSize (^)(UIFont *))strSizeWithFont{};

- (CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth
{
    return ^(UIFont* font, CGFloat maxWidth){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return _self.strSizeWithFontAndMaxSize(font , CGSizeMake(maxWidth, MAXFLOAT));
    };
}
- (void)setStrSizeWithFontAndMaxWidth:(CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth{};

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
- (void)setStrSizeWithFontAndMaxSize:(CGSize (^)(UIFont *, CGSize))strSizeWithFontAndMaxSize{};

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
- (void)setStrIsBlank:(BOOL (^)())strIsBlank{};

- (NSUInteger (^)())strLength
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSUInteger)0;
        }
        return _self.length;
    };
}
- (void)setStrLength:(NSUInteger (^)())strLength{};

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
- (void)setStrLengthASCII:(NSUInteger (^)())strLengthASCII{};

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
- (void)setStrLengthUnicode:(NSUInteger (^)())strLengthUnicode{};

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
- (void)setStrIsContainEmoji:(BOOL (^)())strIsContainEmoji{};

- (NSString* (^)())strClearSpaceAndWrap
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSString);
        NSString *noWrap = [_self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@" " withString:@""];
        return noWrap;
    };
}
- (void)setStrClearSpaceAndWrap:(NSString *(^)())strClearSpaceAndWrap{};

- (NSComparisonResult (^)(NSString *))strCompareNumberSensitive
{
    return ^(NSString* str ){
        LinkError_VAL_IF(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        return [_self compare:str options: NSNumericSearch | NSWidthInsensitiveSearch ];
    };
}
- (void)setStrCompareNumberSensitive:(NSComparisonResult (^)(NSString *))strCompareNumberSensitive{};

- (NSComparisonResult (^)(NSString *))strCompare
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        return [_self compare:str options: NSWidthInsensitiveSearch | NSForcedOrderingSearch];
    };;
}
- (void)setStrCompare:(NSComparisonResult (^)(NSString *))strCompare{};

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
- (void)setStrIsInteger:(BOOL (^)())strIsInteger{};

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
- (void)setStrIsFloating:(BOOL (^)())strIsFloating{};

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
        LinkError_REF_AUTO(NSString, NSString);
        NSMutableString * reIsStrM= [_self mutableCopy];
        NSRange range = [str rangeOfString:str];
        if(range.location == 0){
            [reIsStrM deleteCharactersInRange:range];
        }
        return (NSString*)reIsStrM.objCopy();
    };
}
- (void)setStrDeleteLeft:(NSString *(^)(NSString *))strDeleteLeft{};

- (NSString *(^)(NSString *))strDeleteRight
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSString, NSString);
        NSString* re = _self;
        NSString* lastStr = [re substringWithRange:NSMakeRange(_self.length- str.length, str.length)];
        if([str isEqualToString:lastStr]){
            re= [_self substringWithRange:NSMakeRange(0, _self.length - str.length)];
        }
        return re;
    };
}
- (void)setStrDeleteRight:(NSString *(^)(NSString *))strDeleteRight{};

- (NSString *(^)(NSString*))strTrimLeft
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSString, NSString);
        NSMutableString * reIsStrM= _self.strMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}
- (void)setStrTrimLeft:(NSString *(^)(NSString *))strTrimLeft{};

- (NSString *(^)(NSString*))strTrimRight
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSString, NSString);
        NSMutableString * reIsStrM= [_self mutableCopy];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}
- (void)setStrTrimRight:(NSString *(^)(NSString *))strTrimRight{};

- (NSString *(^)(NSString *))strTrim
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSString, NSString);
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
- (void)setStrTrim:(NSString *(^)(NSString *))strTrim{};

- (UIColor *(^)())strToUIColorFromHexStr
{
    return ^(){
        LinkError_REF_AUTO(UIColor, NSString);
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
- (void)setStrToUIColorFromHexStr:(UIColor *(^)())strToColorFromHexStr{};

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
- (void)setStrToDoubleFromHexStr:(double (^)())strToDoubleFromHexStr{};

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
- (void)setStrToIntFromHexStr:(unsigned int (^)())strToIntFromHexStr{};

- (CGRect (^)())strToCGRect
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGRectZero;
        }
        return CGRectFromString(_self);
    };
}
- (void)setStrToCGRect:(CGRect (^)())strToCGRect{};
- (CGPoint (^)())strToCGPoint
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGPointZero;
        }
        return CGPointFromString(_self);
    };
}
- (void)setStrToCGPoint:(CGPoint (^)())strToCGPoint{};

- (CGVector (^)())strToCGVector
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGVectorMake(0, 0);
        }
        return CGVectorFromString(_self);
    };
}
- (void)setStrToCGVector:(CGVector (^)())strToCGVector{};

- (CGSize (^)())strToCGSize
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGSizeZero;
        }
        return CGSizeFromString(_self);
    };
}
- (void)setStrToCGSize:(CGSize (^)())strToCGSize{};

- (CGAffineTransform (^)())strToCGAffineTransform
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return CGAffineTransformMake(0, 0, 0, 0, 0, 0);
        }
        return CGAffineTransformFromString(_self);
    };
}
- (void)setStrToCGAffineTransform:(CGAffineTransform (^)())strToCGAffineTransform{};
- (UIEdgeInsets (^)())strToUIEdgeInsets
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return UIEdgeInsetsZero;
        }
        return UIEdgeInsetsFromString(_self);
    };
}
- (void)setStrToUIEdgeInsets:(UIEdgeInsets (^)())strToUIEdgeInsets{};
- (UIOffset (^)())strToUIOffset
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return UIOffsetZero;
        }
        return UIOffsetFromString(_self);
    };
}
- (void)setStrToUIOffset:(UIOffset (^)())strToUIOffset{};
- (NSData *(^)())strToNSDataWithContentsOfFile
{
    return ^(){
        LinkError_REF_AUTO(NSData, NSString);
        return [NSData dataWithContentsOfFile:_self];
    };
}
- (void)setStrToNSDataWithContentsOfFile:(NSData *(^)())strToNSDataFromContents{};
- (NSData *(^)(NSStringEncoding))strToNSDataUseEncoding
{
    return ^(NSStringEncoding encoding){
        LinkError_REF_AUTO(NSData, NSString);
        return [_self dataUsingEncoding:encoding];
    };
}
- (void)setStrToNSDataUseEncoding:(NSData *(^)(NSStringEncoding))strToNSDataUseEncoding{};
- (NSDate *(^)(NSString *))strToNSDateWithFormate
{
    return ^(NSString* formateStr){
        LinkError_REF_AUTO(NSDate, NSString);
        NSDateFormatter* fmt = [NSDateFormatter new];
        fmt.dateFormat = formateStr;
        return [fmt dateFromString:_self];
    };
}
- (void)setStrToNSDateWithFormate:(NSDate *(^)(NSString *))strToNSDateWithFormate{};
- (NSDictionary *(^)(NSStringEncoding))strToNSDictionary
{
    return ^(NSStringEncoding encoding){
        LinkError_REF_AUTO(NSDictionary, NSString);
        
        NSString* newStr = [_self stringByReplacingOccurrencesOfString:@" "
                                                            withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\n"
                                                  withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\r"
                                                  withString:@""];

        NSData* strIsData = [newStr dataUsingEncoding:encoding];

        
        NSDictionary* re = [NSJSONSerialization JSONObjectWithData:strIsData
                                        options:NSJSONReadingMutableContainers
                                        error:nil];
        if([re isKindOfClass:[NSDictionary class]]){
            return re;
        }
        return @{};
    };
}
- (void)setStrToNSDictionary:(NSDictionary *(^)(NSStringEncoding))strToNSDictionary{};

- (NSArray *(^)(NSStringEncoding))strToNSArrary
{
    return ^(NSStringEncoding encoding){
        LinkError_REF_AUTO(NSArray, NSString);
        
        NSString* newStr = [_self stringByReplacingOccurrencesOfString:@" "
                                                            withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\n"
                                                  withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\r"
                                                  withString:@""];
        
        NSData* strIsData = [newStr dataUsingEncoding:encoding];
        
        
        NSArray* re = [NSJSONSerialization JSONObjectWithData:strIsData
                                                           options:NSJSONReadingMutableContainers
                                                             error:nil];
        if([re isKindOfClass:[NSArray class]]){
            return re;
        }
        return @[];
    };
}
- (void)setStrToNSArrary:(NSArray *(^)(NSStringEncoding))strToNSArrary{};

-(NSURL *(^)())strToNSURL
{
    return ^(){
        LinkError_REF_AUTO(NSURL, NSString);
        return [NSURL URLWithString:_self];
    };
}
- (void)setStrToNSURL:(NSURL *(^)())strToNSURL{};

- (UIImage *(^)())strToUIImage
{
    return ^(){
        LinkError_REF_AUTO(UIImage, NSString);
        return [UIImage imageNamed:_self];
    };
}
- (void)setStrToUIImage:(UIImage *(^)())strToUIImage{};

- (NSInteger (^)())strToInteger
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (NSInteger)0;
        }
        return [_self integerValue];
    };
}
- (void)setStrToInteger:(NSInteger (^)())strToInteger{};

- (long long (^)())strToLongLong
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (long long)0;
        }
        return [_self longLongValue];
    };
}
- (void)setStrToLongLong:(long long (^)())strToLongLong{};

- (BOOL (^)())strToBOOL
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self boolValue];
    };
}
- (void)setStrToBOOL:(BOOL (^)())strToBOOL{};

- (double (^)())strToDouble
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (double)0.0;
        }
        return [_self doubleValue];
    };
}
- (void)setStrToDouble:(double (^)())strToDouble{};

- (float (^)())strToFloat
{
    return ^(){
        LinkError_VAL_IF(NSString){
            return (float)0.0;
        }
        return [_self floatValue];
    };
}
- (void)setStrToFloat:(float (^)())strToFloat{};

- (NSArray<NSString*> *(^)(NSString *))strSplitWithStr
{
    return ^(NSString* splitStr){
        LinkError_REF_AUTO(NSArray<NSString*>, NSString);
        return [_self componentsSeparatedByString:splitStr];
    };
}
- (void)setStrSplitWithStr:(NSArray<NSString*> *(^)(NSString *))blockSplitStrWithStr{};

- (NSArray<NSString*> *(^)(NSString *))strSplitWithCharsStr
{
    return ^(NSString* splitStrs){
        LinkError_REF_AUTO(NSArray<NSString*>, NSString);
        NSCharacterSet *charSet= [NSCharacterSet characterSetWithCharactersInString:splitStrs];
        return [_self componentsSeparatedByCharactersInSet:charSet];
    };
}
- (void)setStrSplitWithCharsStr:(NSArray<NSString*> *(^)(NSString *))blockSplitStrWithCharsStr{};

- (BOOL (^)(NSString *))strHasPrefix
{
    return ^(NSString* prefix){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self hasPrefix:prefix];
    };
}
- (void)setStrHasPrefix:(BOOL (^)(NSString *))strHasPrefix{};

- (BOOL (^)(NSString *))strHasSuffix
{
    return ^(NSString* suffix){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        return [_self hasSuffix:suffix];
    };
}
- (void)setStrHasSuffix:(BOOL (^)(NSString *))strHasSuffix{};

- (NSString *(^)(NSUInteger))strSubFrom
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSString, NSString);
        return [_self substringFromIndex:idx];
    };
}
- (void)setStrSubFrom:(NSString *(^)(NSUInteger))strSubFrom{};

- (NSString *(^)(NSUInteger))strSubTo
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSString, NSString);
        return [_self substringToIndex:idx];
    };
}
- (void)setStrSubTo:(NSString *(^)(NSUInteger))strSubTo{};

- (NSString *(^)(NSUInteger, NSUInteger))strSubFromTo
{
    return ^(NSUInteger from, NSUInteger to){
        LinkError_REF_AUTO(NSString, NSString);
        if( from> to || to>_self.length)
            return _self;
        return [_self substringWithRange:NSMakeRange(from, to- from)];
    };
}
- (void)setStrSubFromTo:(NSString *(^)(NSUInteger, NSUInteger))strSubFromTo{};

- (NSObject *(^)())strCreateObj
{
    return ^(){
        LinkError_REF_AUTO(NSObject, NSString);
        Class class= NSClassFromString(_self);
        if(class){
            return (NSObject*)[class new];
        }else{
            return (NSObject*)[LinkError share];
        }
    };
}
- (void)setStrCreateObj:(NSObject *(^)())strCreateObj{};

- (UILabel *(^)(CGRect))strCreateLab
{
    return ^(CGRect frame){
        LinkError_REF_AUTO(UILabel, NSString);
        UILabel* re= [[UILabel alloc] initWithFrame:frame];
        re.text= _self;
        return re;
    };
}
- (void)setStrCreateLab:(UILabel *(^)(CGRect))strCreateLab{};

- (UIImageView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))strCreateImgView
{
    return ^(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
        LinkError_REF_AUTO(UIImageView, NSString);
        UIImageView* re = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        re.image = [UIImage imageNamed:_self];
        return re;
    };
}
- (void)setStrCreateImgView:(UIImageView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))strCreateImgView{};

- (BOOL (^)(NSString *))strRegexIsMatch
{
    return ^(NSString* regex){
        LinkError_VAL_IF(NSString){
            return NO;
        }
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        if([predicate evaluateWithObject:_self] == YES){
            return YES;
        }
        return NO;
    };
}
- (void)setStrRegexIsMatch:(BOOL (^)(NSString *))strRegexIsMatch{};


- (NSString *(^)(NSString *, NSString*))strRegexReplace
{
    return ^(NSString* regexStr, NSString* replaceTemplate){
        LinkError_REF_AUTO(NSString, NSString);
        NSRegularExpression* regex = [[NSRegularExpression alloc]
                                      initWithPattern:regexStr
                                      options:0
                                      error:nil];
        return [regex stringByReplacingMatchesInString:[_self mutableCopy]
                                               options:0
                                                 range:NSMakeRange(0, _self.length)
                                          withTemplate:replaceTemplate];
    };
}
- (void)setStrRegexReplace:(NSString *(^)(NSString *, NSString *))strRegexReplace{};

- (NSString *(^)(NSArray *))strSetTextToControls
{
    return ^(NSArray* controls){
        LinkError_REF_AUTO(NSString, NSString);
        [controls enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            if([view isKindOfClass:[UIView class]]){
                if([view isKindOfClass:[UIButton class]]){
                    [((UIButton*)view) setTitle:_self forState:UIControlStateNormal];
                }else if([view isKindOfClass:[UILabel class]] ||
                         [view isKindOfClass:[UITextField class]] ||
                         [view isKindOfClass:[UITextView class]]){
                    [view setValue:_self forKey:@"text"];
                }
            }
        }];
        return _self;
    };
}
- (void)setStrSetTextToControls:(NSString *(^)(NSArray *))strSetTextToControls{};

- (NSString *(^)(NSArray *))strSetTextColorToControls
{
    return ^(NSArray* controls){
        LinkError_REF_AUTO(NSString, NSString);
        UIColor* color = _self.strToUIColorFromHexStr();
        [controls enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIButton class]]){
                [((UIButton*)v) setTitleColor:color forState:UIControlStateNormal];
            }else if ([v isKindOfClass:[UILabel class]] ||
                      [v isKindOfClass:[UITextField class]] ||
                      [v isKindOfClass:[UITextView class]]
                      ){
                [v setValue:color forKey:@"textColor"];
            }
           
        }];
        return _self;
    };
}
- (void)setStrSetTextColorToControls:(NSString *(^)(NSArray *))strSetTextColorToControls{};

- (NSString *(^)(NSArray *))strSetBGColorHexToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSString, NSString);
        UIColor* color = _self.strToUIColorFromHexStr();
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]])
                v.backgroundColor = color;
        }];
        return _self;
    };
}
- (void)setStrSetBGColorHexToViews:(NSString *(^)(NSArray *))strSetBgColorToViews{};

- (double (^)())strNumberFind
{
    return ^(){
        double re = 0.0;
        LinkError_VAL_IF(NSString){
            return re;
        }
        NSScanner* scaner= [[NSScanner alloc] initWithString:_self];
        [scaner scanDouble:&re];
        return re;
    };
}
- (void)setStrNumberFind:(double (^)())strNumberFind{};

- (void)strEnumerateScanIntegerUsingBlock:(void (^)(NSInteger num, NSUInteger idx, BOOL *stop))block
{
    if(block){
        LinkError_VAL_IF(NSString){
            return;
        }
        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?[0-9]+" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:_self
                                        options:0
                                          range:NSMakeRange(0, _self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [_self substringWithRange: result.range];
            block(numStr.integerValue , idx, stop);
        }];
    }
}

- (void)strEnumerateScanFloatingUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block
{
    if(block){
        LinkError_VAL_IF(NSString){
            return;
        }
        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?(?:[0-9]*\\.[0-9]+|[0-9]+\\.)" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:_self
                                        options:0
                                          range:NSMakeRange(0, _self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [_self substringWithRange: result.range];
            block(numStr.doubleValue , idx, stop);
        }];
    }
}

- (void)strEnumerateScanNumberUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block
{
    if(block){
        LinkError_VAL_IF(NSString){
            return;
        }
        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?\\d+(\\.\\d+)?" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:_self
                                        options:0
                                          range:NSMakeRange(0, _self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [_self substringWithRange: result.range];
            block(numStr.doubleValue , idx, stop);
        }];
    }
}
@end
