//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIColorLinkBlock)
/** 颜色转16进制字符串，返回为：prefix+颜色 */
@property (nonatomic,copy,readonly) NSString*        (^colorToStrWithPrefix)(NSString* prefix);
@property (nonatomic,copy,readonly) CGFloat          (^colorRed)();
@property (nonatomic,copy,readonly) CGFloat          (^colorGreen)();
@property (nonatomic,copy,readonly) CGFloat          (^colorBlue)();
@property (nonatomic,copy,readonly) CGFloat          (^colorAlpha)();
@property (nonatomic,copy,readonly) CGFloat          (^colorHue)();
@property (nonatomic,copy,readonly) CGFloat          (^colorSaturation)();
@property (nonatomic,copy,readonly) CGFloat          (^colorBrightness)();
/** 设置红色，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorRedSet)(CGFloat value);
@property (nonatomic,copy,readonly) UIColor*         (^colorGreenSet)(CGFloat value);
@property (nonatomic,copy,readonly) UIColor*         (^colorBlueSet)(CGFloat value);
@property (nonatomic,copy,readonly) UIColor*         (^colorAlphaSet)(CGFloat value);
/** 设置色调，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorHueSet)(CGFloat value);
/** 设置饱和度，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorSaturationSet)(CGFloat value);
/** 设置亮度，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorBrightnessSet)(CGFloat value);

@property (nonatomic,copy,readonly) UIColor*         (^colorSetBackgroundToViews)(NSArray* views);
/** 尝试设置控件及其子控件的文本颜色 */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetTextColorToViewSubviews)(UIView* view);
/** 调节亮度,percent ∈ [-1,1] */
@property (nonatomic,copy,readonly) UIColor*         (^colorBrightnessPercent)(double percent);
/** 变暗38.2%，接近系统变暗效果 */
@property (nonatomic,copy,readonly) UIColor*         (^colorHighlightDarkColor)();
/** 变亮38.2% */
@property (nonatomic,copy,readonly) UIColor*         (^colorHighlightLightColor)();
@end
