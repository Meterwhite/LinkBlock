//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIColorLinkBlock)
#pragma mark - Foundation Mirror/镜像

#pragma mark - Foundation Speed/速度
LBDeclare CGFloat          (^colorRed)(void);
LBDeclare CGFloat          (^colorGreen)(void);
LBDeclare CGFloat          (^colorBlue)(void);
LBDeclare CGFloat          (^colorAlpha)(void);
LBDeclare CGFloat          (^colorHue)(void);
LBDeclare CGFloat          (^colorSaturation)(void);
LBDeclare CGFloat          (^colorBrightness)(void);
/** 设置红色，return new obj */
LBDeclare UIColor*         (^colorRedSet)(CGFloat value);
LBDeclare UIColor*         (^colorGreenSet)(CGFloat value);
LBDeclare UIColor*         (^colorBlueSet)(CGFloat value);
LBDeclare UIColor*         (^colorAlphaSet)(CGFloat value);
/** 色调，return new obj */
LBDeclare UIColor*         (^colorHueSet)(CGFloat value);
/** 饱和度，return new obj */
LBDeclare UIColor*         (^colorSaturationSet)(CGFloat value);
/** 亮度，return new obj */
LBDeclare UIColor*         (^colorBrightnessSet)(CGFloat value);

#pragma mark - Foundation Extend/多择

#pragma mark - Weak coding/弱类型编码
/** return @"0xF2F2F2"(prefix=@"0x")||NSNull */
LBDeclare NSString*        (^colorToHexStringWithPrefix)(NSString* prefix);
/** 根据颜色创建图片 */
LBDeclare UIImage*         (^colorToUIImage)(CGSize size);
/**
 *  作为背景色
 *  toObj∈{NSArray||{.respondsToSelector(setTextColor:,setTitleColor:forState:) }}
 */
LBDeclare UIColor*         (^colorSetToUIForBackground)(id toObj);
/**
 *  作为文本色
 *  toObj∈{NSArray||{.respondsToSelector(setTextColor:,setTitleColor:forState:) }}
 */
LBDeclare UIColor*         (^colorSetToUIForText)(id toObj);




#pragma mark - LinkBlock
/** <^(double percent)>调节亮度,percent ∈ [-1,1] */
LBDeclare UIColor*         (^colorBrightnessPercent)(double percent);
/** <^()>变暗40%，接近系统变暗效果 */
LBDeclare UIColor*         (^colorHighlightDarkColor)(void);
/** <^()>变亮40% */
LBDeclare UIColor*         (^colorHighlightLightColor)(void);





@end
