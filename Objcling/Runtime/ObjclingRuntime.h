//
//  ObjclingRuntime.h
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSDecimalNumber *ocling_get_decimal(id x);

NSSet *ocling_mutable_class_map(void);

/// 是否是可变对象
bool ocling_is_mutableobject(id x);

/// 按需的可变拷贝
id ocling_mutablecopy_ifneed(id x);

NSNumber *_Nullable ocling_to_number(id x);

NSString *_Nullable ocling_to_string(id x);

@interface ObjclingRuntime : NSObject


@end


NS_ASSUME_NONNULL_END
