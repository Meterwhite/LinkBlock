//
//  DynamilingInfo.h
//  Objcling
//
//  Created by meterwhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tling;

NS_ASSUME_NONNULL_BEGIN

/// 动态链信息,添加动态链时需要。
@interface DynamilingInfo : NSObject

/// 必选
@property (nullable,nonatomic) Class dependentClass;
/// 必选
@property (nonatomic) SEL sel;

/// 可选；动态生成的链
@property (nonatomic) Tling *dynamiling;

@end

NS_ASSUME_NONNULL_END
