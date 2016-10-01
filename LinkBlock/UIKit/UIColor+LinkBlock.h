//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIColorLinkBlock)
/** <^(NSString* prefix)>颜色转16进制字符串，返回为：prefix+颜色 */
@property (nonatomic,copy,readonly) NSString*        (^colorToHexStrByPrefix)(NSString* prefix);
/** <^(CGSize size)>根据颜色创建图片 */
@property (nonatomic,copy,readonly) UIImage*         (^colorToUIImage)(CGSize size);
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorRed)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorGreen)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorBlue)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorAlpha)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorHue)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorSaturation)();
/** <^()> */
@property (nonatomic,copy,readonly) CGFloat          (^colorBrightness)();
/** <^(CGFloat value)>设置红色，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorRedSet)(CGFloat value);
/** <^(CGFloat value)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorGreenSet)(CGFloat value);
/** <^(CGFloat value)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorBlueSet)(CGFloat value);
/** <^(CGFloat value)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorAlphaSet)(CGFloat value);
/** <^(double percent)>调节亮度,percent ∈ [-1,1] */
@property (nonatomic,copy,readonly) UIColor*         (^colorBrightnessPercent)(double percent);
/** <^()>变暗38.2%，接近系统变暗效果 */
@property (nonatomic,copy,readonly) UIColor*         (^colorHighlightDarkColor)();
/** <^()>变亮38.2% */
@property (nonatomic,copy,readonly) UIColor*         (^colorHighlightLightColor)();
/** <^(CGFloat value)>设置色调，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorHueSet)(CGFloat value);
/** <^(CGFloat value)>设置饱和度，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorSaturationSet)(CGFloat value);
/** <^(CGFloat value)>设置亮度，返回新对象 */
@property (nonatomic,copy,readonly) UIColor*         (^colorBrightnessSet)(CGFloat value);

/** <^(UIView* view)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToViewBG)(UIView* view);
/** <^(NSArray<UIView*>* views)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToViewsBG)(NSArray<UIView*>* views);
/** <^(UILabel* lab)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToLabText)(UILabel* lab);
/** <^(UITextView* txtView)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToTxtViewText)(UITextView* txtView);
/** <^(UITextField* txtField)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToTxtFieldText)(UITextField* txtField);
/** <^(UIButton* btn, UIControlState state)> */
@property (nonatomic,copy,readonly) UIColor*         (^colorSetToBtnTitle)(UIButton* btn, UIControlState state);
@end
