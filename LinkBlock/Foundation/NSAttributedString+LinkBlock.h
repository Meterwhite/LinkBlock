//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSAttributedStringLinkBlock)
/** <^(CGFloat maxWidth)>默认情况下计算尺寸，如支持UILable文字排版计算 */
LBDeclare CGRect   (^attr_strSize)(CGFloat maxWidth);
LBDeclare NSValue* (^attr_strSizeAs)(CGFloat maxWidth);
/** <^(CGFloat maxWidth, NSStringDrawingOptions optoins)> */
LBDeclare CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
LBDeclare NSValue* (^attr_strSizeWithOptionsAs)(CGFloat maxWidth, NSStringDrawingOptions optoins);
/** <^(NSAttributedString* attrStr)> */
LBDeclare BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
LBDeclare NSNumber*(^attr_strIsEqualToAttrStrAs)(NSAttributedString* attrStr);
/** <^(UIImage* image, CGRect rect)>属性文本绘制到图片，链条切换为入参； */
LBDeclare UIImage* (^attr_strDrawToImageAsWhatSet)(UIImage* image, CGRect rect);
/** <^(UILabel* lab)>属性文本设置到Label，链条切换为入参 */
LBDeclare UILabel* (^attr_strSetToLabelAsWhatSet)(UILabel* lab);
@end
