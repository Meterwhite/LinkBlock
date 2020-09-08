//
//  TColorling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/8.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "Tling.h"

@class TColorling;

NS_ASSUME_NONNULL_BEGIN

@protocol TColorLetling <NSObject>

/// 亮40%
@property (readonly) TColorling<TColorLetling> *lighter;

/// 暗40%
@property (readonly) TColorling<TColorLetling> *darker;

/// 调节亮度 percent ∈ [-1,1]
@property (readonly) TColorling<TColorLetling> *(^brightness)(NSString *percent);

@property (readonly) TColorling<TColorLetling> *(^bgcolorInto)(id control);

@property (readonly) TColorling<TColorLetling> *(^textColorInto)(id control);

@end

@interface TColorling : Tling

@property (readonly) TColorling<TColorLetling> *let;

@property (readonly) TColorling *(^r)(CGFloat f);

@property (readonly) TColorling *(^g)(CGFloat f);

@property (readonly) TColorling *(^b)(CGFloat f);

@property (readonly) TColorling *(^a)(CGFloat f);

/// 色调
@property (readonly) TColorling *(^hue)(CGFloat f);
/// 饱和度
@property (readonly) TColorling *(^saturation)(CGFloat f);
/// 亮度
@property (readonly) TColorling *(^brightness)(CGFloat f);


@end


@interface TColorling (Generic)

@end

NS_ASSUME_NONNULL_END
