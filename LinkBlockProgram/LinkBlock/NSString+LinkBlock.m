//
//  NSString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSString+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSString(LinkBlock)

- (BOOL (^)(NSString *))blockIsEqualStr
{
    return ^(NSString* str){
        return [self isEqualToString:str];
    };
}

- (NSString *(^)(NSString *))blockAppendStr
{
    return ^(NSString *str){
        if(str.blockIsKindOf([NSString class])){
            return [self stringByAppendingString:str];
        }else{
            return self;
        }
    };
}

- (NSString *(^)(NSString *, NSString *))blockReplaceStrWithStr
{
    return ^(NSString* replaceStr, NSString* withStr){
        if(replaceStr.blockIsKindOf([NSString class]) && withStr.blockIsKindOf([NSString class])){
            return [self stringByReplacingOccurrencesOfString:replaceStr withString:withStr];
        }
        else{
            return self;
        }
    };
}

- (NSString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex
{
    return ^(NSString* str, NSUInteger index){
        if(str.blockIsKindOf([NSString class])){
            NSMutableString *tNewMStr= [NSMutableString stringWithString: self];
            [tNewMStr insertString:str atIndex:index];
            return (NSString*)[tNewMStr copy];
        }else{
            return self;
        }
    };
}

- (NSString *(^)(NSRange))blockDeleteStrInRange
{
    return ^(NSRange range){
        NSMutableString *tNewMStr= [NSMutableString stringWithString: self];
        [tNewMStr deleteCharactersInRange:range];
        return (NSString*)[tNewMStr copy];
    };
}
- (NSString *(^)(NSUInteger))blockStrAtIndex
{
    return ^(NSUInteger index){
        if(index > self.length - 1)
            index = self.length - 1;
        unichar ch = [self characterAtIndex:index];
        return [NSString stringWithCharacters:&ch length:1];
    };
}


- (NSString *(^)(NSString *, NSRange))blockReplaceStrInRange
{
    return ^(NSString* str, NSRange range){
        if(str.blockIsKindOf([NSString class])){
            return [self stringByReplacingCharactersInRange:range withString:str];
        }else{
            return self;
        }
    };
}
- (NSString *(^)(NSString *))blockDeleteStr
{
    return ^(NSString *str){
        if(str.blockIsKindOf([NSString class])){
            return [self stringByReplacingOccurrencesOfString:str withString:@""];
        }else{
            return self;
        }
    };
}
- (BOOL (^)(NSString *))blockIsContainStr
{
    return ^(NSString* str){
        return [self containsString:str];
    };
}
- (NSInteger (^)(NSString *))blockIndexOfStr
{
    return ^(NSString* str){
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([self rangeOfString:str].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (NSInteger (^)(NSString *, NSUInteger))blockIndexOfStrStartIndex
{
    return ^(NSString* str, NSUInteger startIndex){
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([self rangeOfString:str options:NSCaseInsensitiveSearch range:NSMakeRange(startIndex, self.length- startIndex)].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (NSRange (^)(NSString *))blockRangeOfStr
{
    return ^(NSString* str){
        if([str isKindOfClass:[NSString class]]){
            return [self rangeOfString:str];
        }else{
            return NSMakeRange(NSNotFound, 0);
        }
    };
}
- (NSString *(^)(NSString *, ...))blockAppendFormate
{
    return ^(NSString *formateStr, ...){
        if([formateStr isKindOfClass:[NSString class]]){
            va_list args;
            va_start(args, formateStr);
            NSString *re= [self stringByAppendingString:[[NSString alloc] initWithFormat:formateStr arguments:args]];
            va_end(args);
            return re;
        }
        return self;
    };
}
- (BOOL (^)())blockIsEmoji
{
    return ^(){
        // 判断是否是 emoji表情
        BOOL returnValue = NO;
        
        const unichar hs = [self characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (self.length > 1) {
                const unichar ls = [self characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
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

- (CGSize (^)(UIFont *))blockSizeWithFont
{
    return ^(UIFont* font){
        return self.blockSizeWithFontAndMaxWidth(font , MAXFLOAT);
    };
}

- (CGSize (^)(UIFont *, CGFloat))blockSizeWithFontAndMaxWidth
{
    return ^(UIFont* font, CGFloat maxWidth){
        return self.blockSizeWithFontAndMaxSize(font , CGSizeMake(maxWidth, MAXFLOAT));
    };
}

- (CGSize (^)(UIFont *, CGSize))blockSizeWithFontAndMaxSize
{
    return ^(UIFont* font, CGSize maxSize){
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = font;
        
        if ([[UIDevice currentDevice].systemVersion floatValue]>= 7.0) {
            return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
        } else {
            return [self sizeWithFont:font constrainedToSize:maxSize];
        }
    };
}

- (BOOL (^)())blockIsBlank{
    return ^(){
        if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
        if ([self isEqualToString:@"<null>"]) {
            return YES;
        }
        if ([self isEqualToString:@"(null)"]) {
            return YES;
        }
        return NO;
    };
}

- (NSUInteger (^)())blockLength
{
    return ^(){
        return self.length;
    };
}

- (NSUInteger (^)())blockLengthASCII
{
    return ^(){
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < self.length; i++)
        {
            unichar uc = [self characterAtIndex: i];
            asciiLength += isascii(uc) ? 1 : 2;
        }
        return asciiLength;
    };
}

- (NSUInteger (^)())blockLengthUniCode
{
    return ^(){
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < self.length; i++)
        {
            unichar uc = [self characterAtIndex: i];
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

- (BOOL (^)())blockIsContainEmoji
{
    return ^(){
        __block BOOL isEomji = NO;
        
        [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
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

- (NSString* (^)())blockClearSpaceAndWrap
{
    return ^(){
        NSString *noWrap = [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@" " withString:@""];
        return noWrap;
    };
}

- (NSComparisonResult (^)(NSString *, NSString *))blockCompareStrNumberScan
{
    return ^(NSString* str1 , NSString* str2){
        return [str1 compare:str2 options: NSNumericSearch | NSWidthInsensitiveSearch ];
    };
}

- (NSComparisonResult (^)(NSString *, NSString *))blockCompareStr
{
    return ^(NSString* str1 , NSString* str2){
        return [str1 compare:str2 options: NSWidthInsensitiveSearch | NSForcedOrderingSearch];
    };;
}

- (BOOL (^)())blockIsInteger
{
    return ^(){
        NSScanner *scaner= [[NSScanner alloc] initWithString:self];
        NSInteger intVal;
        return (BOOL)([scaner scanInteger:&intVal] && [scaner isAtEnd]);
    };
}

- (BOOL (^)())blockIsFloating
{
    return ^(){
        NSScanner *scaner= [[NSScanner alloc] initWithString:self];
        double doubleVal;
        return (BOOL)([scaner scanDouble:&doubleVal] && [scaner isAtEnd]);
    };
}

- (BOOL (^)())blockIsNumber
{
    return ^(){
        return (BOOL)(self.blockIsInteger() || self.blockIsFloating());
    };
}

- (NSString *(^)(NSString *))blockDeleteStrLeft
{
    return ^(NSString* str){
        NSMutableString * reIsStrM= [self mutableCopy];
        NSRange range = [str rangeOfString:str];
        if(range.location == 0){
            [reIsStrM deleteCharactersInRange:range];
        }
        return (NSString*)reIsStrM.blockCopy();
    };
}
- (NSString *(^)(NSString *))blockDeleteStrRight
{
    return ^(NSString* str){
        NSString* re = self;
        NSString* lastStr = [re substringWithRange:NSMakeRange(self.length- str.length, str.length)];
        if([str isEqualToString:lastStr]){
            re= [self substringWithRange:NSMakeRange(0, self.length - str.length)];
        }
        return re;
    };
}

- (NSString *(^)(NSString*))blockTrimCharLeft
{
    return ^(NSString* str){
        NSMutableString * reIsStrM= self.blockMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, self.length)];
        return (NSString*)reIsStrM.blockCopy();
    };
}

- (NSString *(^)(NSString*))blockTrimCharRight
{
    return ^(NSString* str){
        NSMutableString * reIsStrM= [self mutableCopy];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, self.length)];
        return (NSString*)reIsStrM.blockCopy();
    };
}

- (UIColor *(^)())blockToColorFromHexStr
{
    return ^(){
        NSString *newString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
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

- (double (^)())blockToDoubleFromHexStr
{
    return ^(){
        NSString *newString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        double re=0.0;
        [[NSScanner scannerWithString:newString] scanHexDouble:&re];
        return re;
    };
}

- (unsigned int (^)())blockToIntFromHexStr
{
    return ^(){
        NSString *newString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        unsigned int re = 0;
        [[NSScanner scannerWithString:newString] scanHexInt:&re];
        return re;
    };
}

- (CGRect (^)())blockToCGRect
{
    return ^(){
        return CGRectFromString(self);
    };
}

- (CGPoint (^)())blockToCGPoint
{
    return ^(){
        return CGPointFromString(self);
    };
}

- (CGVector (^)())blockToCGVector
{
    return ^(){
        return CGVectorFromString(self);
    };
}

- (CGSize (^)())blockToCGSize
{
    return ^(){
        return CGSizeFromString(self);
    };
}

- (CGAffineTransform (^)())blockToCGAffineTransform
{
    return ^(){
        return CGAffineTransformFromString(self);
    };
}

- (UIEdgeInsets (^)())blockToUIEdgeInsets
{
    return ^(){
        return UIEdgeInsetsFromString(self);
    };
}

- (UIOffset (^)())blockToUIOffset
{
    return ^(){
        return UIOffsetFromString(self);
    };
}

-(NSURL *(^)())blockToNSURL
{
    return ^(){
        return [NSURL URLWithString:self];
    };
}

- (UIImage *(^)())blockToUIImage
{
    return ^(){
        return [UIImage imageNamed:self];
    };
}

- (NSInteger (^)())blockToInteger
{
    return ^(){
        return [self integerValue];
    };
}

- (long long (^)())blockToLongLong
{
    return ^(){
        return [self longLongValue];
    };
}

- (BOOL (^)())blockToBOOL
{
    return ^(){
        return [self boolValue];
    };
}

- (double (^)())blockToDouble
{
    return ^(){
        return [self doubleValue];
    };
}

- (float (^)())blockToFloat
{
    return ^(){
        return [self floatValue];
    };
}

- (NSArray *(^)(NSString *))blockSplitStrWithStr
{
    return ^(NSString* splitStr){
        return [splitStr componentsSeparatedByString:splitStr];
    };
}
- (void)setBlockSplitStrWithStr:(NSArray *(^)(NSString *))blockSplitStrWithStr{};

- (NSArray *(^)(NSString *))blockSplitStrWithCharsStr
{
    return ^(NSString* splitStrs){
        NSCharacterSet *charSet= [NSCharacterSet characterSetWithCharactersInString:splitStrs];
        return [self componentsSeparatedByCharactersInSet:charSet];
    };
}
- (void)setBlockSplitStrWithCharsStr:(NSArray *(^)(NSString *))blockSplitStrWithCharsStr{};

- (void)setBlockAppendStr:(NSString *(^)(NSString *))blockAppendStr{};
- (void)setBlockDeleteStr:(NSString *(^)(NSString *))blockDeleteStr{};
- (void)setBlockDeleteStrInRange:(NSString *(^)(NSRange))blockDeleteStrInRange{};
- (void)setBlockIndexOfStr:(NSInteger (^)(NSString *))blockIndexOfStr{};
- (void)setBlockIndexOfStrStartIndex:(NSInteger (^)(NSString *, NSUInteger))blockIndexOfStrStartIndex{};
- (void)setBlockInsertStrAtIndex:(NSString *(^)(NSString *, NSUInteger))blockInsertStrAtIndex{};
- (void)setBlockIsContainStr:(BOOL (^)(NSString *))blockIsContainStr{};
- (void)setBlockRangeOfStr:(NSRange (^)(NSString *))blockRangeOfString{};
- (void)setBlockReplaceStrInRange:(NSString *(^)(NSString *, NSRange))blockReplaceStrInRange{};
- (void)setBlockReplaceStrWithStr:(NSString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};
- (void)setBlockAppendFormate:(NSString *(^)(NSString *, ...))blockAppendFormate{};
- (void)setBlockStrAtIndex:(NSString *(^)(NSUInteger))blockStrAtIndex{};
- (void)setBlockLength:(NSUInteger (^)())blockLength{};
- (void)setBlockLengthASCII:(NSUInteger (^)())blockLengthASCII{};
- (void)setBlockLengthUniCode:(NSUInteger (^)())blockLengthUniCode{};
- (void)setBlockCompareStrNumberScan:(NSComparisonResult (^)(NSString *, NSString *))blockCompareStrNumberSuper{};
- (void)setBlockCompareStr:(NSComparisonResult (^)(NSString *, NSString *))blockCompareStr{};
- (void)setBlockIsInteger:(BOOL (^)())blockIsInt{};
- (void)setBlockIsFloating:(BOOL (^)())blockIsDoubel{};
- (void)setBlockIsBlank:(BOOL (^)())blockIsStrBlank{};
- (void)setBlockTrimCharLeft:(NSString *(^)(NSString *))blockTrimCharLeft{};
- (void)setBlockSizeWithFont:(CGSize (^)(UIFont *))blockSizeWithFont{};
- (void)setBlockSizeWithFontAndMaxSize:(CGSize (^)(UIFont *, CGSize))blockSizeWithFontAndMaxSize{};
- (void)setBlockSizeWithFontAndMaxWidth:(CGSize (^)(UIFont *, CGFloat))blockSizeWithFontAndMaxWidth{};
- (void)setBlockDeleteStrRight:(NSString *(^)(NSString *))blockDeleteStrRight{};
- (void)setBlockDeleteStrLeft:(NSString *(^)(NSString *))blockDeleteStrLeft{};
- (void)setBlockIsContainEmoji:(BOOL (^)())blockIsContainEmoji{};
- (void)setBlockTrimCharRight:(NSString *(^)(NSString *))blockTrimCharRight{};
- (void)setBlockIsEmoji:(BOOL (^)())blockIsStrEmoji{};
- (void)setBlockClearSpaceAndWrap:(NSString *(^)())blockClearSpaceAndWrap{};
- (void)setBlockIsEqualStr:(BOOL (^)(NSString *))blockIsEqualStr{};
- (void)setBlockToCGPoint:(CGPoint (^)())blockToCGPoint{};
- (void)setBlockToCGVector:(CGVector (^)())blockToCGVector{};
- (void)setBlockToCGSize:(CGSize (^)())blockToCGSize{};
- (void)setBlockToCGRect:(CGRect (^)())blockToCGRect{};
- (void)setBlockToCGAffineTransform:(CGAffineTransform (^)())blockToCGAffineTransform{};
- (void)setBlockToUIEdgeInsets:(UIEdgeInsets (^)())blockToUIEdgeInsets{};
- (void)setBlockToUIOffset:(UIOffset (^)())blockToUIOffset{};
- (void)setBlockToColorFromHexStr:(UIColor *(^)())blockToColorFromHexStr{};
- (void)setBlockToBOOL:(BOOL (^)())blockToBOOL{};
- (void)setBlockToUIImage:(UIImage *(^)())blockToUIImage{};
- (void)setBlockToInteger:(NSInteger (^)())blockToNSInteger{};
- (void)setBlockToDouble:(double (^)())blockToDouble{};
- (void)setBlockToNSURL:(NSURL *(^)())blockToNSURL{};
- (void)setBlockToFloat:(float (^)())blockToFloat{};
- (void)setBlockToLongLong:(long long (^)())blockToLongLong{};
- (void)setBlockToDoubleFromHexStr:(double (^)())blockToDoubleFromHexStr{};
- (void)setBlockToIntFromHexStr:(unsigned int (^)())blockToIntFromHexStr{};
@end
