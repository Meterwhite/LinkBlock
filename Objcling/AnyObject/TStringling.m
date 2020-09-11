//
//  TStringling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/22.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TStringling.h"

@interface TStringling ()
@property (readonly) TStringling<TStringLetling> *reversed;
@property (readonly) TStringling<TStringLetling> *unicodeEncoding;
@property (readonly) TStringling<TStringLetling> *deUnicodeEncoding;
@property (readonly) TStringling<TStringLetling> *urlEncoding;
@property (readonly) TStringling<TStringLetling> *deUrlEncoding;
@property (readonly) TStringling<TStringLetling> *nonSpaceAndWrap;
@property (readonly) TStringling *(^imageNamedImageInto)(id control);
@property (readonly) TStringling *(^textInto)(id control);
@property (readonly) TStringling *(^urlpathAppend)(NSString *pathComponent);
@property (readonly) TStringling *(^urlpathAppendDirectory)(NSString *component);
@property (readonly) TStringling *(^urlpathAppendExtension)(NSString *s);
@property (readonly) TStringling *urlpathDeleteLastComponent;
@property (readonly) TStringling *urlpathGetLastComponent;
@property (readonly) TStringling *urlpathGetExtension;
@property (readonly) TStringling *urlpathGetComponents;
@end

@implementation TStringling

- (id)let {
    return self;
}

@end
