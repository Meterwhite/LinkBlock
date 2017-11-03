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
LBDeclare NSValue* (^attr_strSize_n)(CGFloat maxWidth);
/** <^(CGFloat maxWidth, NSStringDrawingOptions optoins)> */
LBDeclare CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
LBDeclare NSValue* (^attr_strSizeWithOptions_n)(CGFloat maxWidth, NSStringDrawingOptions optoins);
/** <^(NSAttributedString* attrStr)> */
LBDeclare BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
LBDeclare NSNumber*(^attr_strIsEqualToAttrStr_n)(NSAttributedString* attrStr);
/** <^(UIImage* image, CGRect rect)>属性文本绘制到图片 */
LBDeclare UIImage* (^attr_strDrawToImg_linkTo)(UIImage* image, CGRect rect);
/** <^(UILabel* lab)>属性文本设置到Label，并以Label作为链条 */
LBDeclare UILabel* (^attr_strSetToLabel_linkTo)(UILabel* lab);

/**
 截取特定的富文本长度，使返回值在指定最大宽度下满足:
 在指定的结尾字符时例如：@"...展开"（可以做点击功能）、@""（可以去掉末尾省略号刚好显示完整，也可以传空）
 ，返回文本在指定行高下不会截断以至于展示系统省略号，而是返回值和指定的结尾字符拼接后刚好排满指定行数或者未能排满最后一行。
 应用场景1：在文本最后做：...展开
 应用场景2：不展示系统省略号

 @param maxLine 最大行数
 @param endStr 结尾文本
 @return 返回截取后的文本，但并不包含指定的结尾字符
 */
//LBDeclare NSAttributedString* (^attr_strTruncateStrInMaxLineBeforeEndStr)(NSUInteger maxLine , NSAttributedString* endStr , CGFloat maxWidth);
@end
