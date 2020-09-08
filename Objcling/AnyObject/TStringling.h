//
//  TStringling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TStringling, TNumberling, UIImageView, TURLling;

NS_ASSUME_NONNULL_BEGIN

@protocol TStringLetling <NSObject>

/// 倒序的字符串
@property (readonly) TStringling<TStringLetling> *reversed;
/// @"我" => @"\u6211"
@property (readonly) TStringling<TStringLetling> *unicodeEncoding;
/// @"\u6211" => @"我"
@property (readonly) TStringling<TStringLetling> *deUnicodeEncoding;

@property (readonly) TStringling<TStringLetling> *urlEncoding;

@property (readonly) TStringling<TStringLetling> *deUrlEncoding;

@property (readonly) TStringling<TStringLetling> *nonSpaceAndWrap;

/// ImageView Button
@property (readonly) TStringling *(^imageNamedImageInto)(id control);

@property (readonly) TStringling *(^textInto)(id control);

#pragma mark - URL
@property (readonly) TStringling *(^urlpathAppend)(NSString *pathComponent);

@property (readonly) TStringling *(^urlpathAppendDirectory)(NSString *component);

@property (readonly) TStringling *(^urlpathAppendExtension)(NSString *s);

@property (readonly) TStringling *urlpathDeleteLastComponent;

@property (readonly) TStringling *urlpathGetLastComponent;

@property (readonly) TStringling *urlpathGetExtension;

@property (readonly) TStringling *urlpathGetComponents;


@end

@interface TStringling : Tling

@property (readonly) TStringling<TStringLetling> *let;


#pragma mark - 增
@property (readonly) TStringling *(^append)(NSString *s);

@property (readonly) TStringling *(^appendLine)(NSString *s);
#pragma mark - 删
@property (readonly) TStringling *(^deletee)(NSString *s);

@property (readonly) TStringling *(^deleteLeft)(NSString *s);

@property (readonly) TStringling *(^deleteRight)(NSString *s);

@property (readonly) TStringling *(^trim)(NSString *s);

@property (readonly) TStringling *(^trimLeft)(NSString *s);

@property (readonly) TStringling *(^trimRight)(NSString *s);


#pragma mark - 改
@property (readonly) TStringling *(^replace)(NSString *substr, NSString* with);

@property (readonly) TStringling *(^split)(NSString* with);

@property (readonly) TStringling *(^subFrom)(NSUInteger from);

@property (readonly) TStringling *(^subString)(NSUInteger to, NSUInteger from);

@property (readonly) TStringling *(^subTo)(NSUInteger to);

@property (readonly) TStringling *(^subRange)(NSRange ran);

@property (readonly) TStringling *(^subElement)(NSUInteger to, NSUInteger from);

@property (readonly) TStringling *(^subElementFrom)(NSUInteger from);

@property (readonly) TStringling *(^subElementTo)(NSUInteger to);


#pragma mark - 查
@property (readonly) TStringling *(^at)(NSUInteger idx);

@property (readonly) TStringling *(^contains)(NSString *substr, NSString* with);

@property (readonly) TStringling *(^hasPrefix)(NSString* s);

@property (readonly) TStringling *(^hasSuffix)(NSString* s);

@property (readonly) TStringling *lenth;

@property (readonly) TStringling *lenthASCII;

@property (readonly) TStringling *lenthUnicode;

@property (readonly) TStringling *lenthElement;

#pragma mark - 转换
/// @""
@property (readonly) TNumberling *isEmpty;
/// <#Description#>
@property (readonly) TNumberling *isMeaningNone;

@property (readonly) TNumberling *containsEmoji;

@property (readonly) TNumberling *isEmoji;

@property (readonly) TNumberling *scannedNumber;

@property (readonly) TURLling    *asURL;

@end

@interface TStringling (Generic)

@end

NS_ASSUME_NONNULL_END
