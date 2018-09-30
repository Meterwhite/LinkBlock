//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSAttributedStringLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
LBDeclare NSNumber*(^attr_strIsEqualToAttrStrAs)(NSAttributedString* attrStr);



#pragma mark - Foundation Speed/速度
/** use boundingRectWithSize */
LBDeclare CGRect   (^attr_strSize)(CGFloat maxWidth);
LBDeclare NSValue* (^attr_strSizeAs)(CGFloat maxWidth);
LBDeclare CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
LBDeclare NSValue* (^attr_strSizeWithOptionsAs)(CGFloat maxWidth, NSStringDrawingOptions optoins);


#pragma mark - Weak coding/弱类型编码
/** <^(UIImage* image, CGRect rect)>属性文本绘制到图片，链条切换为入参； */
LBDeclare UIImage* (^attr_strDrawToImageAsWhatSet)(UIImage* image, CGRect rect);
/** <^(UILabel* lab)>属性文本设置到Label，链条切换为入参 */
LBDeclare UILabel* (^attr_strSetToLabelAsWhatSet)(UILabel* lab);



@end
