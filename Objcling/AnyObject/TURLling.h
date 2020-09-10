//
//  TURLling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TStringling;

NS_ASSUME_NONNULL_BEGIN

@interface TURLling : TObjectling

#pragma mark - 增
@property (readonly) TURLling *(^appendPathComponent)(NSString *s);

@property (readonly) TURLling *(^appendDirectoryComponent)(NSString *s);

@property (readonly) TURLling *(^appendPathExtension)(NSString *s);
#pragma mark - 删
@property (readonly) TURLling *deleteLastPathComponent;
#pragma mark - 改

#pragma mark - 查
@property (readonly) TStringling *absoluteString;

#pragma mark - 转
@property (readonly) TStringling *lastPathComponent;

@property (readonly) TStringling *pathExtension;

@end

NS_ASSUME_NONNULL_END
