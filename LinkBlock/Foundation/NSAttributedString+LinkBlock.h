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
LBDeclare NSValue* (^attr_strSizeING)(CGFloat maxWidth);
/** <^(CGFloat maxWidth, NSStringDrawingOptions optoins)> */
LBDeclare CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
LBDeclare NSValue* (^attr_strSizeWithOptionsING)(CGFloat maxWidth, NSStringDrawingOptions optoins);
/** <^(NSAttributedString* attrStr)> */
LBDeclare BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
LBDeclare NSNumber*(^attr_strIsEqualToAttrStrING)(NSAttributedString* attrStr);
/** <^(UIImage* image, CGRect rect)>属性文本绘制到图片 */
LBDeclare UIImage* (^attr_strDrawToImg_linkTo)(UIImage* image, CGRect rect);
/** <^(UILabel* lab)>属性文本设置到Label，并以Label作为链条 */
LBDeclare UILabel* (^attr_strSetToLabel_linkTo)(UILabel* lab);
@end
