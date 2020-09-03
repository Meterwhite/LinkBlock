//
//  NSObject+ObjcLing.h
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TObjectling.h"

NS_ASSUME_NONNULL_BEGIN

#define Tling(obj) ((typeof(ling.T)<typeof(obj)>*)obj.ling)

/// obj.ling

@interface NSObject(Objcling)

/**
 * <#...#>
 */
@property (readonly) TObjectling* ling;

/**
 * <#...#>
 */
@property (readonly) TObjectling* lings;

@end

NS_ASSUME_NONNULL_END
