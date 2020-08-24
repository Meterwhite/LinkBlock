//
//  TDynamicLingInfo.h
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDynamicLingInfo : NSObject

@property (nonatomic) Class dependentClass;

@property (nonatomic) SEL sel;

@end

NS_ASSUME_NONNULL_END
