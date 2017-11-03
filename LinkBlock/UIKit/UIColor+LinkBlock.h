//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIColorLinkBlock)
/** <^(NSString* prefix)>颜色转16进制字符串，返回为：prefix+颜色。发生错误时返回NSNull */
LBDeclare NSString*        (^colorToHexStrByPrefix)(NSString* prefix);
/** <^(CGSize size)>根据颜色创建图片 */
LBDeclare UIImage*         (^colorToUIImage)(CGSize size);
/** <^()> */
LBDeclare CGFloat          (^colorRed)();
/** <^()> */
LBDeclare CGFloat          (^colorGreen)();
/** <^()> */
LBDeclare CGFloat          (^colorBlue)();
/** <^()> */
LBDeclare CGFloat          (^colorAlpha)();
/** <^()> */
LBDeclare CGFloat          (^colorHue)();
/** <^()> */
LBDeclare CGFloat          (^colorSaturation)();
/** <^()> */
LBDeclare CGFloat          (^colorBrightness)();
/** <^(CGFloat value)>设置红色，返回新对象 */
LBDeclare UIColor*         (^colorRedSet)(CGFloat value);
/** <^(CGFloat value)> */
LBDeclare UIColor*         (^colorGreenSet)(CGFloat value);
/** <^(CGFloat value)> */
LBDeclare UIColor*         (^colorBlueSet)(CGFloat value);
/** <^(CGFloat value)> */
LBDeclare UIColor*         (^colorAlphaSet)(CGFloat value);
/** <^(double percent)>调节亮度,percent ∈ [-1,1] */
LBDeclare UIColor*         (^colorBrightnessPercent)(double percent);
/** <^()>变暗40%，接近系统变暗效果 */
LBDeclare UIColor*         (^colorHighlightDarkColor)();
/** <^()>变亮40% */
LBDeclare UIColor*         (^colorHighlightLightColor)();
/** <^(CGFloat value)>设置色调，返回新对象 */
LBDeclare UIColor*         (^colorHueSet)(CGFloat value);
/** <^(CGFloat value)>设置饱和度，返回新对象 */
LBDeclare UIColor*         (^colorSaturationSet)(CGFloat value);
/** <^(CGFloat value)>设置亮度，返回新对象 */
LBDeclare UIColor*         (^colorBrightnessSet)(CGFloat value);

/** <^(UIView* view)> */
LBDeclare UIColor*         (^colorSetToViewBG)(UIView* view);
/** <^(NSArray<UIView*>* views)> */
LBDeclare UIColor*         (^colorSetToViewsBG)(NSArray<UIView*>* views);
/** <^(UILabel* lab)> */
LBDeclare UIColor*         (^colorSetToLabText)(UILabel* lab);
/** <^(UITextView* txtView)> */
LBDeclare UIColor*         (^colorSetToTxtViewText)(UITextView* txtView);
/** <^(UITextField* txtField)> */
LBDeclare UIColor*         (^colorSetToTxtFieldText)(UITextField* txtField);
/** <^(UIButton* btn, UIControlState state)> */
LBDeclare UIColor*         (^colorSetToBtnTitle)(UIButton* btn, UIControlState state);
@end
